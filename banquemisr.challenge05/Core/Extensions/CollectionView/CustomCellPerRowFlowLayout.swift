//
//  CustomCellPerRowFlowLayout.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 02/02/2025.
//

import UIKit

class CustomCellPerRowFlowLayout: UICollectionViewFlowLayout {
    
    var numberOfItemsPerRow: Int = 2 {
        didSet {
            invalidateLayout()
        }
    }
    
    var itemHeight: CGFloat = 100 {
        didSet {
            invalidateLayout()
        }
    }
    
    override func prepare(forCollectionViewUpdates: [UICollectionViewUpdateItem]) {
        super.prepare(forCollectionViewUpdates: forCollectionViewUpdates)
        calculateItemSize()
    }
    
    private func calculateItemSize() {
        guard let collectionView = collectionView else { return }
        
        let totalSpacing = minimumInteritemSpacing * CGFloat(numberOfItemsPerRow - 1)
        let availableWidth = collectionView.bounds.width - sectionInset.left - sectionInset.right - totalSpacing
        
        let itemWidth = availableWidth / CGFloat(numberOfItemsPerRow)
        itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        // Adjust the item size dynamically based on the number of items per row
        calculateItemSize()
        
        return attributes
    }
    
    override func shouldInvalidateLayout(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> Bool {
        return preferredAttributes.frame.size != originalAttributes.frame.size
    }
}
