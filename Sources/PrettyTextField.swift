//
//  PrettyTextField.swift
//  PrettyTextField
//
//  Created by Oleksii Naboichenko on 12/26/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit

@IBDesignable public class PrettyTextField: UITextField {
    
    // MARK: - Public Properties
    @IBInspectable public var textTopPadding: CGFloat = 0
    @IBInspectable public var textLeftPadding: CGFloat = 0
    @IBInspectable public var textBottomPadding: CGFloat = 0
    @IBInspectable public var textRightPadding: CGFloat = 0
    
    // MARK: - Computed Properties
    private var textPaddings: UIEdgeInsets {
        return UIEdgeInsets(top: textTopPadding, left: textLeftPadding, bottom: textBottomPadding, right: textRightPadding)
    }
    
    // MARK: - UITextField
    /// Placeholder position
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, textPaddings)
    }
    
    /// Text position
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, textPaddings)
    }
}
