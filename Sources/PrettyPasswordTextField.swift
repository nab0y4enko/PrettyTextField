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
    
    @IBInspectable public var showSecureTextIcon: UIImage? {
        get {
            let showSecureTextButtonImage = self.showSecureTextButtonImage ?? self.defaultShowSecureTextIcon
            
            if tintColorForSecureTextIcon != nil {
                return showSecureTextButtonImage?.withRenderingMode(.alwaysTemplate)
            }
            
            return showSecureTextButtonImage
        }
        set {
            self.showSecureTextButtonImage = newValue
            updateSpySecureTextButton()
        }
    }
    
    @IBInspectable public var hideSecureTextIcon: UIImage? {
        get {
            hideSecureTextButtonImage = self.hideSecureTextButtonImage ?? self.defaultHideSecureTextIcon
            
            if tintColorForSecureTextIcon != nil {
                return hideSecureTextButtonImage?.withRenderingMode(.alwaysTemplate)
            }
            
            return hideSecureTextButtonImage
        }
        set {
            self.hideSecureTextButtonImage = newValue
            updateSpySecureTextButton()
        }
    }
    
    @IBInspectable public var tintColorForSecureTextIcon: UIColor? = nil {
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
    private lazy var defaultShowSecureTextIcon: UIImage? = {
        let bundle = Bundle(for: PrettyPasswordTextField.self)
        return UIImage(named: "show-secure-text-icon", in: bundle, compatibleWith: nil)
    }()
    
    private var showSecureTextButtonImage: UIImage?

    private lazy var defaultHideSecureTextIcon: UIImage? = {
        let bundle = Bundle(for: PrettyPasswordTextField.self)
        return UIImage(named: "hide-secure-text-icon", in: bundle, compatibleWith: nil)
    }()

    private var hideSecureTextButtonImage: UIImage?
    
    private var spySecureTextButton: UIButton?
    
    // MARK: - UIView
    override public func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        updateSpySecureTextButton()
    }
    
    // MARK: - Private Instance Methods
    private func updateSpySecureTextButton() {
        guard spySecureText, let showSecureTextIcon = showSecureTextIcon, let hideSecureTextIcon = hideSecureTextIcon else {
            rightViewMode = .never
            rightView = nil
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
        
        spySecureTextButton?.tintColor = tintColorForSecureTextIcon ?? self.tintColor
    
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
