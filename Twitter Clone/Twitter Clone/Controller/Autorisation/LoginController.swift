//
//  LoginController.swift
//  Twitter Clone
//
//  Created by Bobomurod Ergashev on 25/08/22.
//

import UIKit


class LoginViewController : UIViewController {
    //MARK: PROP
    private lazy var logoimageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "TwitterLogo")
        return iv
    }()
    private let emailTextfield : UITextField = {
        let tf = UITextField()
//        tf.isUserInteractionEnabled = true
        tf.placeholder = "Email"
        return tf
    }()
    
    private let passwordTextfield : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.textColor = .white
        return tf
    }()
    
    private lazy var emailContainerView : UIView = {
        let view = Utilies().inputContaionerView(withImage: UIImage(named: "ic_mail_outline_white_2x-1")!, textField: emailTextfield)
        return view
    }()
    
    
    
    private lazy var passwordContainerView : UIView = {
        let view = Utilies().inputContaionerView(withImage: UIImage(named: "ic_lock_outline_white_2x")!, textField: passwordTextfield)
        return view
    }()
    
   
    //MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
     
    }
    
    //MARK: SELECTORS
    //MARK: HELPERS
    
    func configureUI(){
        self.view.backgroundColor = .twitterBlue
        self.navigationController?.navigationBar.barStyle = .default
        
        view.addSubview(logoimageView)
        logoimageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoimageView.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: logoimageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
    }
}
