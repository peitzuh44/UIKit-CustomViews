//
//  ThreeDIconButton.swift
//  UIKitCustomViews
//
//  Created by Pei-Tzu Huang on 2024/10/1.
//

import UIKit

class ThreeDIconButton: UIButton {
    
    let shadowView = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(icon: UIImage, iconColor: UIColor, backgroundColor: UIColor) {
        super.init(frame: .zero)
        setImage(icon.withRenderingMode(.alwaysTemplate), for: .normal)
        tintColor = iconColor
        self.backgroundColor = backgroundColor
        configureButton()
    }
    
    private func configureButton() {
        // background style
        layer.cornerRadius = 10
        clipsToBounds = true

        addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        addTarget(self, action: #selector(buttonReleased), for: [.touchUpInside, .touchUpOutside])
    }
    
    @objc func buttonPressed() {
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(translationX: 0, y: 5)
        }
    }
    
    @objc func buttonReleased() {
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
        }
    }
    
    override func didMoveToSuperview() {
        if let superview = self.superview {
            
            // Shadow view style
            shadowView.translatesAutoresizingMaskIntoConstraints = false
            shadowView.layer.backgroundColor = UIColor.darkGray.cgColor
            shadowView.layer.cornerRadius = 10
            clipsToBounds = true
            
            // Constaints
            NSLayoutConstraint.activate([
                shadowView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                shadowView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 5),
                shadowView.widthAnchor.constraint(equalTo: self.widthAnchor),
                shadowView.heightAnchor.constraint(equalTo: self.heightAnchor)
            ])
        }
    }

}
