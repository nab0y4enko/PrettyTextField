//
//  PrettyPasswordTextField.swift
//  PrettyTextField
//
//  Created by Oleksii Naboichenko on 12/27/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit

@IBDesignable public final class PrettyPasswordTextField: PrettyTextField {

    // MARK: - Public Properties
    @IBInspectable public var spySecureText: Bool = false {
        didSet {
            updateSpySecureTextButton()
        }
    }
    
    @IBInspectable public var showSecureTextIcon: UIImage? = nil {
        didSet {
            updateSpySecureTextButton()
        }
    }
    
    @IBInspectable public var hideSecureTextIcon: UIImage? = nil {
        didSet {
            updateSpySecureTextButton()
        }
    }
    
    public var spySecureTextButtonLeftInset: CGFloat = 8 {
        didSet {
            updateSpySecureTextButton()
        }
    }

    // MARK: - Private Properties
    private var spySecureTextButton: UIButton?
    
    // MARK: - Computed Properties
    
    private var defaultShowSecureTextIcon: UIImage? = {
        let bundle = Bundle(for: PrettyPasswordTextField.self)
        return UIImage(named: "show-secure-text-icon", in: bundle, compatibleWith: nil)
    }()
    
    private var defaultHideSecureTextIcon: UIImage? = {
        let bundle = Bundle(for: PrettyPasswordTextField.self)
        return UIImage(named: "hide-secure-text-icon", in: bundle, compatibleWith: nil)
    }()
    
    // MARK: - UIView
    override public func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        updateSpySecureTextButton()
    }
    
    // MARK: - Private Instance Methods
    private func updateSpySecureTextButton() {
        guard spySecureText else {
            rightViewMode = .never
            rightView = nil
            return
        }
        
        guard let showSecureTextIcon = showSecureTextIcon ?? defaultShowSecureTextIcon, let hideSecureTextIcon = hideSecureTextIcon ?? defaultHideSecureTextIcon else {
            return
        }
        
        if spySecureTextButton == nil || rightView != spySecureTextButton {
            spySecureTextButton = UIButton(type: .custom)
            let buttonWight = max(showSecureTextIcon.size.width, hideSecureTextIcon.size.width)
            let buttonHeight = max(showSecureTextIcon.size.height, hideSecureTextIcon.size.height)
            spySecureTextButton?.frame = CGRect(x: 0, y: 0, width: buttonWight, height: buttonHeight)
            spySecureTextButton?.addTarget(self, action: #selector(didPress(_:)), for: .touchUpInside)
            rightViewMode = .always
            rightView = spySecureTextButton
        }
        
        if isSecureTextEntry {
            spySecureTextButton?.setImage(showSecureTextIcon, for: .normal)
        } else {
            spySecureTextButton?.setImage(hideSecureTextIcon, for: .normal)
        }
    }
    
    private dynamic func didPress(_ spySecureTextButton: UIButton) {
        let savedText = text
        isSecureTextEntry = !isSecureTextEntry
        text = savedText
        
        updateSpySecureTextButton()
    }
    
    // MARK: - UITextField
    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rightViewRect = super.rightViewRect(forBounds: bounds)
        
        if spySecureTextButton != nil {
            rightViewRect.origin.x -= spySecureTextButtonLeftInset
        }
        
        return rightViewRect
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.textRect(forBounds: bounds)
        
        if spySecureTextButton != nil {
            textRect.size.width -= spySecureTextButtonLeftInset
        }
        
        return textRect
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var editingRect = super.editingRect(forBounds: bounds)
        
        if spySecureTextButton != nil {
            editingRect.size.width -= spySecureTextButtonLeftInset
        }
        
        return editingRect
    }
}
