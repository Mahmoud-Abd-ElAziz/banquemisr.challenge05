//
//  Cache.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//


import Foundation

final class Cache<Key: Hashable, Value: AnyObject> {
    private let cache = NSCache<WrappedKey, Entry>()
    private let entryLifetime: TimeInterval?
    private let dateProvider: () -> Date

    init(entryLifetime: TimeInterval? = nil, dateProvider: @escaping () -> Date = Date.init) {
        self.entryLifetime = entryLifetime
        self.dateProvider = dateProvider
    }

    func insert(_ value: Value, forKey key: Key) {
        let entry = Entry(value: value, expirationDate: entryLifetime.map { dateProvider().addingTimeInterval($0) })
        cache.setObject(entry, forKey: WrappedKey(key))
    }

    func value(forKey key: Key) -> Value? {
        guard let entry = cache.object(forKey: WrappedKey(key)) else { return nil }

        if let expirationDate = entry.expirationDate, expirationDate < dateProvider() {
            removeValue(forKey: key)
            return nil
        }
        return entry.value
    }

    func removeValue(forKey key: Key) {
        cache.removeObject(forKey: WrappedKey(key))
    }

    func removeAll() {
        cache.removeAllObjects()
    }
}

// MARK: - Supporting Types
private extension Cache {
    final class WrappedKey: NSObject {
        let key: Key

        init(_ key: Key) {
            self.key = key
        }

        override var hash: Int {
            return key.hashValue
        }

        override func isEqual(_ object: Any?) -> Bool {
            guard let other = object as? WrappedKey else { return false }
            return other.key == key
        }
    }

    final class Entry {
        let value: Value
        let expirationDate: Date?

        init(value: Value, expirationDate: Date?) {
            self.value = value
            self.expirationDate = expirationDate
        }
    }
}
