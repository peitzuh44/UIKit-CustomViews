//
//  CustomTextField.swift
//  UIKitCustomViews
//
//  Created by Pei-Tzu Huang on 2024/10/1.
//

import UIKit

class CustomTextField: UITextField {
    
    var textPadding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Configure function
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        // background
        backgroundColor = .tertiarySystemBackground
        layer.cornerRadius = 10
        clipsToBounds = true
        
        // border
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.borderWidth = 2
        
        // text
        textColor = .darkGray
        tintColor = .systemMint
        textAlignment = .left
        font = UIFont.preferredFont(forTextStyle: .body)
        
        // placeholder
        placeholder = "Email"
        
        //keyboard setting
        keyboardType = .emailAddress
        autocorrectionType = .no
        returnKeyType = .done
        autocapitalizationType = .none
        
        setLeadingIcon()
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    // MARK: Set icon
    private func setLeadingIcon() {
        let iconView = UIImageView(image: UIImage(systemName: "checkmark"))
        iconView.contentMode = .scaleAspectFit
        iconView.frame = CGRect(x: 0, y: 0, width: 24, height: 24) // setting icon size
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 24))
        iconContainerView.addSubview(iconView)
        
        iconView.center = CGPoint(x: iconContainerView.frame.width / 2, y: iconContainerView.frame.height / 2) // center the icon in the middle of icon container view.
        
        leftView = iconContainerView
        leftViewMode = .always
        
    }
    
}
