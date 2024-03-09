//
//  ViewBuilder.swift
//  ii
//
//  Created by kamyr on 04.03.2024.
//

import UIKit

class ViewBuilder {
    static let shered = ViewBuilder()
    private init() {}
    lazy var contentView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
   
        
    func getTextFild (textFild: UITextField, placeholder: String, isPassword: Bool = false) -> UIStackView {
        lazy var hidePassword: UIButton = {
            let button = UIButton(primaryAction: action)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage (systemName: "eyes"), for: .normal)
            button.tintColor = .black
            return button
        }()
        lazy var action = UIAction { _ in
            textFild.isSecureTextEntry.toggle()
            
            if  textFild.isSecureTextEntry{
                hidePassword.setImage(UIImage (systemName: "eyes.inverse"), for: .normal)
            } else {
                hidePassword.setImage(UIImage (systemName: "eyes"), for: .normal)
                                    
        }
        }
        lazy var placeholderText: UIView = {
            let text = UILabel()
            text.text = placeholder
            text.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            text.textColor = .gray
            text.translatesAutoresizingMaskIntoConstraints = false
            
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(text)
            view.heightAnchor.constraint(equalToConstant: 15).isActive = true
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
            
            
           
            return view
        }()
        lazy var fieldView: UIView = {
            
            let view = UIView()
            view.backgroundColor = UIColor (named: "appGrey")
            view.layer.cornerRadius = 15
            textFild.isSecureTextEntry = isPassword
            view.translatesAutoresizingMaskIntoConstraints = false
            textFild.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(textFild)
       
            
            if isPassword{
                view.addSubview(hidePassword)
                hidePassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
                hidePassword.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            }
                
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 52),
                textFild.topAnchor.constraint(equalTo: view.topAnchor),
                textFild.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                textFild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                textFild.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                
            ])
            return view
            
        }()
        
        lazy var hStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 7
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(placeholderText)
            stack.addArrangedSubview(fieldView)
            return stack
        }()
        return hStack
    }
    
}
