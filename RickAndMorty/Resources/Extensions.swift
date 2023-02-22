//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Ole Hagemann on 20/02/2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
