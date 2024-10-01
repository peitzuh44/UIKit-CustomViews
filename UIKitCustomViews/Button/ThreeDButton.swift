//
//  ThreeDButton.swift
//  UIKitCustomViews
//
//  Created by Pei-Tzu Huang on 2024/10/1.
//

import UIKit

class ThreeDButton: UIButton {
    private let shadowView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    
    init(title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureButton() {
        
        // Background
        layer.cornerRadius = 10
        clipsToBounds = true
        
        // Text
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
        addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        addTarget(self, action: #selector(buttonReleased), for: [.touchUpInside, .touchUpOutside])
       
    }
    

    @objc private func buttonPressed() {
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(translationX: 0, y: 5)
        }
    }
    
    @objc private func buttonReleased() {
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let superview = self.superview {
            
            // Define how the shadow should look like
            shadowView.backgroundColor = UIColor.darkGray
            shadowView.layer.cornerRadius = 10
            shadowView.translatesAutoresizingMaskIntoConstraints = false
            
            // add shadow to the superview
            superview.insertSubview(shadowView, belowSubview: self)
            
            
            // Constraints of the shadow
            NSLayoutConstraint.activate([
                shadowView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                shadowView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 5),
                shadowView.widthAnchor.constraint(equalTo: self.widthAnchor),
                shadowView.heightAnchor.constraint(equalTo: self.heightAnchor)
            ])
        }
    }
    
   
}
