//
//  SignUpViewController.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 03/08/22.
//

import UIKit

class SignUpViewController: UIViewController {
    private var userNameInput: UITextField!
    private var passwordInput: UITextField!
    private var mailInput : UITextField!
    private var signInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
   
//        vc.initViews()
        self.initViews()
        
    }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            navigationController?.setNavigationBarHidden(true, animated: true)
            print("willappear")
        }
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            navigationController?.setNavigationBarHidden(false, animated: true)
            print("diddisappear")
        }
    // MARK: Functions:
    
    func initViews(){
        let logoview = UIView(frame: CGRect(x: 180, y: 70, width: windowWidth - 360 , height: 120))
        logoview.layer.shadowColor = UIColor(red: 20/255, green: 19/255, blue: 240/255, alpha: 1.0).cgColor
        logoview.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        logoview.layer.shadowRadius = 20
        logoview.layer.shadowOpacity = 0.6
        view.addSubview(logoview)

        let logoImage: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: logoview.frame.width - 5 , height: logoview.frame.height - 5))
        logoImage.image = UIImage(named: "vue")
        logoImage.tintColor = .blue
        logoImage.contentMode = .scaleAspectFill
        logoview.addSubview(logoImage)
        
        let label1 = UILabel(frame: CGRect(x: 82, y: logoview.frame.maxY + 20, width: windowWidth - 160, height: 50))
        label1.text = "Welcome !"
        label1.textColor = .labelTextColor
        label1.font = .systemFont(ofSize: 30)
        label1.textAlignment = .center
        view.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect(x: 80, y: label1.frame.maxY + 5, width: windowWidth - 160, height: 30))
        label2.text = "Create your account!"
        label2.textColor = .labelTextColor
        label2.textAlignment = .center
        label2.font = .systemFont(ofSize: 16)
        view.addSubview(label2)
        
        
        
        userNameInput = UITextField(frame: CGRect(x: 50, y: label2.frame.maxY + 40, width: windowWidth - 80, height: 40))
        userNameInput.backgroundColor = .cyan
        userNameInput.isUserInteractionEnabled = true
        userNameInput.layer.cornerRadius = 20
        userNameInput.backgroundColor = .white
        userNameInput.font = .systemFont(ofSize: 18)
        userNameInput.textColor = .navbarColor
//        userNameInput.placeholder = "Username: "
        userNameInput.layer.shadowColor = UIColor(red: 10/255, green: 19/255, blue: 100/255, alpha: 1.0).cgColor
        userNameInput.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        userNameInput.layer.shadowRadius = 6
        userNameInput.layer.shadowOpacity = 0.6
        
//        userNameInput.addTarget(self, action: #selector(onUsernameInput(_:)), for: .editingChanged)
        view.addSubview(userNameInput)
        
        let imgview = UIView(frame: CGRect(x: -20, y: -10, width: 60 , height: 60))
        imgview.layer.cornerRadius = 30
        imgview.layer.shadowColor = UIColor(red: 20/255, green: 19/255, blue: 40/255, alpha: 1.0).cgColor
        imgview.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        imgview.layer.shadowRadius = 10
        imgview.backgroundColor = .mainColor
        imgview.layer.shadowOpacity = 0.4
        userNameInput.addSubview(imgview)
        
        let userInputimg = UIImageView(frame: CGRect(x: 10, y: 10, width: imgview.frame.width - 20, height: imgview.frame.height - 20))
        userInputimg.image = UIImage(named: "peerson")
//        userInputimg.backgroundColor = .white
        userInputimg.layer.cornerRadius = 15
//        userInputimg.layer.shadowColor = UIColor(red: 10/255, green: 19/255, blue: 100/255, alpha: 1.0).cgColor
//        userInputimg.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        userInputimg.layer.shadowRadius = 4
//        userInputimg.layer.shadowOpacity = 0.6
        imgview.addSubview(userInputimg)
        
        
        
        
        
        
        
        
        
        mailInput = UITextField(frame: CGRect(x: 50, y: userNameInput.frame.maxY + 30, width: windowWidth - 80, height: 40))
        mailInput.backgroundColor = .cyan
        mailInput.isUserInteractionEnabled = true
        mailInput.layer.cornerRadius = 20
        mailInput.backgroundColor = .white
        mailInput.font = .systemFont(ofSize: 18)
        mailInput.textColor = .navbarColor
//        mailInput.placeholder = "Username: "
        mailInput.layer.shadowColor = UIColor(red: 10/255, green: 19/255, blue: 100/255, alpha: 1.0).cgColor
        mailInput.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        mailInput.layer.shadowRadius = 6
        mailInput.layer.shadowOpacity = 0.6
        
//        mailInput.addTarget(self, action: #selector(onUsernameInput(_:)), for: .editingChanged)
        view.addSubview(mailInput)
        
        let imgview2 = UIView(frame: CGRect(x: -20, y: -10, width: 60 , height: 60))
        imgview2.layer.cornerRadius = 30
        imgview2.layer.shadowColor = UIColor(red: 20/255, green: 19/255, blue: 40/255, alpha: 1.0).cgColor
        imgview2.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        imgview2.layer.shadowRadius = 10
        imgview2.backgroundColor = .mainColor
        imgview2.layer.shadowOpacity = 0.4
        mailInput.addSubview(imgview2)
        
        let mailInputimg = UIImageView(frame: CGRect(x: 15, y: 15, width: imgview2.frame.width - 30, height: imgview2.frame.height - 30))
        mailInputimg.image = UIImage(named: "gmail")
//        mailInputimg.backgroundColor = .white
        mailInputimg.layer.cornerRadius = 15
        mailInputimg.contentMode = .scaleAspectFit
//        mailInputimg.layer.shadowColor = UIColor(red: 10/255, green: 19/255, blue: 100/255, alpha: 1.0).cgColor
//        mailInputimg.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        mailInputimg.layer.shadowRadius = 4
//        mailInputimg.layer.shadowOpacity = 0.6
        imgview2.addSubview(mailInputimg)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        passwordInput = UITextField(frame: CGRect(x: 50, y: mailInput.frame.maxY + 30, width: windowWidth - 80, height: 40))
        passwordInput.backgroundColor = .cyan
        passwordInput.isUserInteractionEnabled = true
        passwordInput.layer.cornerRadius = 20
        passwordInput.backgroundColor = .white
        passwordInput.font = .systemFont(ofSize: 18)
        passwordInput.textColor = .navbarColor
//        passwordInput.placeholder = "Password: "
        passwordInput.layer.shadowColor = UIColor(red: 10/255, green: 19/255, blue: 100/255, alpha: 1.0).cgColor
        passwordInput.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        passwordInput.layer.shadowRadius = 6
        passwordInput.layer.shadowOpacity = 0.6
//        passwordInput.addTarget(self, action: #selector(onPasswordInput(_:)), for: .editingChanged)
        
        
        view.addSubview(passwordInput)
        
        let imgview3 = UIView(frame: CGRect(x: -20, y: -10, width: 60 , height: 60))
        imgview3.layer.cornerRadius = 30
        imgview3.layer.shadowColor = UIColor(red: 20/255, green: 19/255, blue: 40/255, alpha: 1.0).cgColor
        imgview3.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        imgview3.layer.shadowRadius = 10
        imgview3.backgroundColor = .mainColor
        imgview3.layer.shadowOpacity = 0.4
        passwordInput.addSubview(imgview3)
        
        let passwordInputimg = UIImageView(frame: CGRect(x: 15, y: 12, width: imgview3.frame.width - 30, height: imgview.frame.height - 24))
        passwordInputimg.image = UIImage(named: "password")
        passwordInputimg.contentMode = .scaleAspectFit
//        userInputimg.backgroundColor = .white
        passwordInputimg.layer.cornerRadius = 15
//        userInputimg.layer.shadowColor = UIColor(red: 10/255, green: 19/255, blue: 100/255, alpha: 1.0).cgColor
//        userInputimg.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        userInputimg.layer.shadowRadius = 4
//        userInputimg.layer.shadowOpacity = 0.6
        imgview3.addSubview(passwordInputimg)
        

        signInBtn = UIButton(frame: CGRect(x: 120, y: passwordInput.frame.maxY + 30, width: windowWidth - 240, height: 50))
        signInBtn.setTitle("Sign up", for: .normal)
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.backgroundColor = .btnColor
        signInBtn.layer.cornerRadius = 26
//        signInBtn.addTarget(self, action: #selector(onSignInButtonPressed), for: .touchUpInside)
        view.addSubview(signInBtn)
        
        
        let label = UILabel(frame: CGRect(x: 30, y: signInBtn.frame.maxY + 40, width: windowWidth - 40, height: 30))
        label.text = "--------- Or sign up with ----------"
        label.textColor = .labelTextColor
        label.textAlignment = .center
        
        label.font = .systemFont(ofSize: 17)
        view.addSubview(label)
       
        
        
        let googleview : UIView = UIView(frame: CGRect(x: 40, y: label.frame.maxY + 30, width: 80, height: 50))
        googleview.backgroundColor = .mainColor
        googleview.layer.cornerRadius = 9
        googleview.layer.shadowColor = UIColor(red: 20/255, green: 10/255, blue: 40/255, alpha: 1.0).cgColor
        googleview.layer.shadowRadius = 10
        googleview.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        googleview.layer.shadowOpacity = 0.3
        view.addSubview(googleview)
        
        let googleLogo = UIImageView(frame: CGRect(x: 10, y: 10, width: googleview.frame.width - 20, height: googleview.frame.height - 20))
        googleLogo.image = UIImage(named: "google")
        googleLogo.contentMode = .scaleAspectFit
        googleview.addSubview(googleLogo)
        
        
        let facebook : UIView = UIView(frame: CGRect(x: googleview.frame.maxX + 34, y: label.frame.maxY + 30, width: 80, height: 50))
        facebook.backgroundColor = .mainColor
        facebook.layer.cornerRadius = 9
        facebook.layer.shadowColor = UIColor(red: 20/255, green: 10/255, blue: 40/255, alpha: 1.0).cgColor
        facebook.layer.shadowRadius = 10
        facebook.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        facebook.layer.shadowOpacity = 0.3
        view.addSubview(facebook)
        
        let facebooklogo = UIImageView(frame: CGRect(x: 10, y: 10, width: facebook.frame.width - 20, height: facebook.frame.height - 20))
        facebooklogo.image = UIImage(named: "facebook")
        facebooklogo.contentMode = .scaleAspectFit
        facebook.addSubview(facebooklogo)
        
        
        let twitter : UIView = UIView(frame: CGRect(x: facebook.frame.maxX + 34, y: label.frame.maxY + 30, width: 80, height: 50))
        twitter.backgroundColor = .mainColor
        twitter.layer.cornerRadius = 9
        twitter.layer.shadowColor = UIColor(red: 20/255, green: 10/255, blue: 40/255, alpha: 1.0).cgColor
        twitter.layer.shadowRadius = 10
        twitter.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        twitter.layer.shadowOpacity = 0.3
        view.addSubview(twitter)
        
        let twitlogo = UIImageView(frame: CGRect(x: 10, y: 10, width: twitter.frame.width - 20, height: twitter.frame.height - 20))
        twitlogo.image = UIImage(named: "twitter")
        twitlogo.contentMode = .scaleAspectFit
        twitter.addSubview(twitlogo)
        
        

        
        
        
        
        
    }

   

}
