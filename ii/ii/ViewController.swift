//
//  ViewController.swift
//  ii
//
//  Created by kamyr on 04.03.2024.
//

import UIKit

class ViewController: UIViewController {
    private var contentView = UIView()
    private let build =  ViewBuilder.shered
    private let emailTextFeild =  UITextField()
    private let passwordTextFeild =  UITextField()
    override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "appPurple")
        setContentView()
        setEmailTextView()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func setContentView(){
        contentView = build.contentView
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor ),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor ),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
        private func setEmailTextView(){
            let emailStack = build.getTextFild(textFild: emailTextFeild, placeholder: "Email Adress")
            let passwordStack = build.getTextFild(textFild: passwordTextFeild, placeholder: "Password")
            contentView.addSubview(emailStack)
            contentView.addSubview(passwordStack)
            NSLayoutConstraint.activate([
                emailStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
                emailStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
                emailStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
                
                passwordStack.topAnchor.constraint(equalTo: emailStack.bottomAnchor, constant: 20),
                passwordStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
                passwordStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35)
            ])
    
    }
 
    
}




