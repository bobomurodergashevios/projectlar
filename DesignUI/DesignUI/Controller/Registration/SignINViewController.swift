//
//  SignINViewController.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 18/09/22.
//
//
//  RegistrationViewController.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 18/09/22.
//

import UIKit

class SignINViewController: UIViewController {

    
    let imgview : UIImageView = {
        let imgview = UIImageView()
        imgview.image = UIImage(named: "apple")
        imgview.clipsToBounds = true
        imgview.layer.masksToBounds = true
        imgview.contentMode = .scaleAspectFit
        
        return imgview
    }()
    
    
   
    
    
    
    let mailTextFieldView : UIView = {
        let vieww = UIView()
        vieww.backgroundColor = .clear
        return vieww
    }()
    let mailTextField : UITextField = {
        let mailtxtfield = UITextField()
        mailtxtfield.backgroundColor = .white
        mailtxtfield.textColor = .black
        mailtxtfield.font = .systemFont(ofSize: 19)
        mailtxtfield.placeholder = "Email"
        return mailtxtfield
    }()
    
    
    
    let passwordTextFieldView : UIView = {
        let vieww = UIView()
        vieww.backgroundColor = .clear
        return vieww
    }()
    let passwordTextField : UITextField = {
        let passwordtxtfield = UITextField()
        passwordtxtfield.backgroundColor = .white
        passwordtxtfield.textColor = .black
        passwordtxtfield.font = .systemFont(ofSize: 19)
        passwordtxtfield.placeholder = "Password"
        return passwordtxtfield
    }()
    
    
    
    
    let signupbtn : UIButton = {
        let btn = UIButton()
//        btn.backgroundColor = .clear
        btn.setTitle("Logn In ", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 19)
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = UIColor.twitterBlue.cgColor
        btn.layer.borderWidth = 2
        
        return btn
    }()
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .twitterBlue
        // Do any additional setup after loading the view.
//        self.navigationController?.isNavigationBarHidden = true
        
        view.addSubview(imgview)
        imgview.translatesAutoresizingMaskIntoConstraints = false
        imgview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        imgview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        imgview.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
        imgview.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imgview.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        
        
       
        
        
        
      
        
        
        
        view.addSubview(mailTextFieldView)

        mailTextFieldView.backgroundColor = .white
        mailTextFieldView.layer.cornerRadius = 8
        mailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        mailTextFieldView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        mailTextFieldView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        mailTextFieldView.topAnchor.constraint(equalTo: imgview.bottomAnchor, constant: 50).isActive = true
        mailTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        
        mailTextFieldView.addSubview(mailTextField)
        mailTextField.translatesAutoresizingMaskIntoConstraints = false
        mailTextField.leftAnchor.constraint(equalTo: mailTextFieldView.leftAnchor, constant: 10).isActive = true
        mailTextField.rightAnchor.constraint(equalTo: mailTextFieldView.rightAnchor, constant: -10).isActive = true
        mailTextField.topAnchor.constraint(equalTo: mailTextFieldView.topAnchor, constant: 5).isActive = true
        mailTextField.bottomAnchor.constraint(equalTo: mailTextFieldView.bottomAnchor, constant: -5).isActive = true

        
        
        
        
        
        view.addSubview(passwordTextFieldView)

       passwordTextFieldView.backgroundColor = .white
       passwordTextFieldView.layer.cornerRadius = 8
       passwordTextFieldView.translatesAutoresizingMaskIntoConstraints = false
       passwordTextFieldView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        passwordTextFieldView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        passwordTextFieldView.topAnchor.constraint(equalTo: mailTextFieldView.bottomAnchor, constant: 20).isActive = true
        passwordTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        
        passwordTextFieldView.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.leftAnchor.constraint(equalTo: mailTextFieldView.leftAnchor, constant: 10).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: passwordTextFieldView.rightAnchor, constant: -10).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 5).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -5).isActive = true

        
        
        view.addSubview(signupbtn)
        signupbtn.backgroundColor = UIColor.init(red: 0/255, green: 215/255, blue: 255/255, alpha: 1.0)
        
        signupbtn.addTarget(self, action: #selector(loginIntapped(_:)), for: .touchUpInside)
        
        signupbtn.translatesAutoresizingMaskIntoConstraints = false
        
        signupbtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true

        signupbtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        signupbtn.topAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 50).isActive = true
        signupbtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        signupbtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    
    @objc func loginIntapped(_ sender: UIButton ) {
        SharedManager.saveState(.registered)
        appdelegate.route(.main)
    }

   

}
