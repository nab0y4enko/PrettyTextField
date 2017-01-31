//
//  PrettyTextField.swift
//  PrettyTextField
//
//  Created by Oleksii Naboichenko on 12/26/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit

@IBDesignable open class PrettyTextField: UITextField {
    
    // MARK: - Properties for Interface Builder
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'textInset' instead.")
    @IBInspectable public var textTopInset: CGFloat {
        get {
            return textInset.top
        }
        set {
            textInset.top = newValue
        }
    }
    
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'textInset' instead.")
    @IBInspectable public var textLeftInset: CGFloat {
        get {
            return textInset.left
        }
        set {
            textInset.left = newValue
        }
    }
    
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'textInset' instead.")
    @IBInspectable public var textBottomInset: CGFloat {
        get {
            return textInset.bottom
        }
        set {
            textInset.bottom = newValue
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'textInset' instead.")
    @IBInspectable public var textRightInset: CGFloat {
        get {
            return textInset.right
        }
        set {
            textInset.right = newValue
        }
    }
    
    // MARK: - Public Properties
    var textInset: UIEdgeInsets = UIEdgeInsets()
    
    // MARK: - UITextField
    
    /// Placeholder position
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        let textRect = super.textRect(forBounds: bounds)
        return UIEdgeInsetsInsetRect(textRect, textInset)
    }
    
    /// Text position
    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let editingRect = super.editingRect(forBounds: bounds)
        return UIEdgeInsetsInsetRect(editingRect, textInset)
    }
}
