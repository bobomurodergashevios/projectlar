//
//  MainViewController.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 18/09/22.
//

import UIKit

class MainViewController: UIViewController {
    var flag : Bool = false
    let imgview : UIImageView = {
        let imgview = UIImageView()
        imgview.image = UIImage(named: "apple")
        imgview.clipsToBounds = true
        imgview.layer.masksToBounds = true
        imgview.contentMode = .scaleAspectFit
        
        return imgview
    }()
    
    let signlabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "See what's happening in the world right now"
        lbl.textColor = .white
        if #available(iOS 13.0, *) {
            lbl.font = .monospacedSystemFont(ofSize: 22, weight: .bold)
        } else {
            // Fallback on earlier versions
        }
        
        lbl.numberOfLines = 13
        return lbl
    }()
    
    let signinbtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .twitterBlue
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 19)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    
    let signupbtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("Log in ", for: .normal)
        btn.setTitleColor(UIColor.twitterBlue, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 19)
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = UIColor.twitterBlue.cgColor
        btn.layer.borderWidth = 2
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = .black
        self.view.backgroundColor = UIColor.init(red: 51/255, green: 24/255, blue: 50/255, alpha: 1.0)
        
        view.addSubview(imgview)
        imgview.translatesAutoresizingMaskIntoConstraints = false
        imgview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        imgview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        imgview.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        imgview.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imgview.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        

        view.addSubview(signlabel)
        signlabel.translatesAutoresizingMaskIntoConstraints = false
        
        signlabel.translatesAutoresizingMaskIntoConstraints = false
        signlabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true

        signlabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        signlabel.topAnchor.constraint(equalTo: imgview.bottomAnchor, constant: 70).isActive = true
        
        
        
        
        view.addSubview(signinbtn)
        signinbtn.addTarget(self, action: #selector(signUptapped(_:)), for: .touchUpInside)
        signinbtn.translatesAutoresizingMaskIntoConstraints = false
        
        signinbtn.translatesAutoresizingMaskIntoConstraints = false
        signinbtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true

        signinbtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        signinbtn.topAnchor.constraint(equalTo: signlabel.bottomAnchor, constant: 50).isActive = true
        signinbtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        signinbtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        view.addSubview(signupbtn)
        signupbtn.addTarget(self, action: #selector(loginIntapped(_:)), for: .touchUpInside)
        signupbtn.translatesAutoresizingMaskIntoConstraints = false
        
        signupbtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true

        signupbtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        signupbtn.topAnchor.constraint(equalTo: signinbtn.bottomAnchor, constant: 10).isActive = true
        signupbtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        signupbtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        
        
        
        
        
        
    }
    
    
    
    @objc func signUptapped(_ sender: UIButton) {
       
        self.navigationController?.pushViewController(RegistrationViewController(), animated: true)
        
    }
    
    @objc func loginIntapped(_ sender : UIButton) {
        flag = !flag
        if flag {
            signupbtn.backgroundColor = .twitterBlue
            signupbtn.setTitleColor(.white, for: .normal)
            signupbtn.layer.borderColor = UIColor.white.cgColor
            signupbtn.layer.borderWidth = 2
            signinbtn.backgroundColor = .clear
            signinbtn.setTitleColor(.twitterBlue, for: .normal)
            signinbtn.layer.borderColor = UIColor.twitterBlue.cgColor
            signinbtn.layer.borderWidth = 2
          
        }else{
            signupbtn.backgroundColor = .clear
            signupbtn.setTitleColor(.twitterBlue, for: .normal)
            signupbtn.layer.borderColor = UIColor.twitterBlue.cgColor
            signupbtn.layer.borderWidth = 2
            
            signinbtn.backgroundColor = .twitterBlue
            signinbtn.setTitleColor(.white, for: .normal)
            signinbtn.layer.borderColor = UIColor.white.cgColor
            signinbtn.layer.borderWidth = 2
           
        }
        
        self.navigationController?.pushViewController(SignINViewController(), animated: true)
        
    }

}
