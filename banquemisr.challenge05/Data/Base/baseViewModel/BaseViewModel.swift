//
//  BaseViewModel.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import UIKit
import Combine

class BaseViewModel: NSObject {
    
    @Published private var isLoading: Bool = false
    private var errorSubject = PassthroughSubject<HttpClientError, Never>()
    var cancellables = Set<AnyCancellable>()
    
    var loadingPublisher: AnyPublisher<Bool, Never> {
        $isLoading.eraseToAnyPublisher()
    }

    override init() {
        super.init()
        bindLoader()
    }
    
    
}
// MARK: - Error Handling
extension BaseViewModel {
    
    func triggerError(_ error: HttpClientError) {
        errorSubject.send(error)
        setLoaderState(false)
    }
    
    func bindErrorHandling(to viewController: UIViewController) {
        errorSubject
            .receive(on: DispatchQueue.main)
            .sink { viewController.HandleError(error: $0) }
            .store(in: &cancellables)
    }
}

// MARK: - Loader Management
private extension BaseViewModel {
    
    func setLoaderState(_ isLoading: Bool) {
        DispatchQueue.main.async { self.isLoading = isLoading }
    }

    func bindLoader() {
        loadingPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in $0 ? self?.startLoader() : self?.stopLoader() }
            .store(in: &cancellables)
    }
    
    func startLoader() {
        if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            ActivityIndicatorManager.shared.showLoader(on: keyWindow)
        }
    }
    func stopLoader() {
        ActivityIndicatorManager.shared.hideLoader()
    }
    
    
}
// MARK: - Network Request Handling
extension BaseViewModel {
    
    func performRequest<T>(_ request: @escaping () async throws -> T) async -> T? {
        setLoaderState(true)
        defer { setLoaderState(false) }
        do {
            return try await request()
        } catch let error as HttpClientError {
            triggerError(error)
            return nil
        } catch {
            let customError = HttpClientError.customString(error.localizedDescription)
            triggerError(customError)
            return nil
        }
    }
}
