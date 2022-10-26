//
//  SignInViewController.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 03/08/22.
//

import UIKit


let windowWidth: CGFloat = UIScreen.main.bounds.width
let windowHeight: CGFloat = UIScreen.main.bounds.height

class SignInViewController: UIViewController {

    //MARK: Properties:
    private var userNameInput: UITextField!
    private var passwordInput: UITextField!
    private var signInBtn: UIButton!
    private var passwordvalidLabel : UILabel!
    private var uservalidLabel : UILabel!
    private var imgviewhideshow : UIView!
    private var flag : Bool = true
    private var passwordInputimghideshow : UIImageView!
    
    // MARK: Life Cycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.initViews()

       
    }
    
    
    // MARK: Functions:
    
    func initViews(){
        
        let logoview = UIView(frame: CGRect(x: 180, y: 80, width: windowWidth - 360 , height: 120))
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
        
        let label1 = UILabel(frame: CGRect(x: 80, y: logoview.frame.maxY + 20, width: windowWidth - 160, height: 50))
        label1.text = "Welcome back!"
        label1.textColor = .labelTextColor
        label1.font = .systemFont(ofSize: 30)
        label1.textAlignment = .center
        view.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect(x: 80, y: label1.frame.maxY + 5, width: windowWidth - 160, height: 30))
        label2.text = "Login to your account!"
        label2.textColor = .labelTextColor
        label2.textAlignment = .center
        label2.font = .systemFont(ofSize: 16)
        view.addSubview(label2)
        
        
        
        let userView = UIView(frame: CGRect(x: 60, y: label2.frame.maxY + 40, width: windowWidth - 100, height: 40))
        userView.backgroundColor = .white
        userView.layer.cornerRadius = 20
        userView.layer.shadowColor = UIColor(red: 10/255, green: 19/255, blue: 100/255, alpha: 1.0).cgColor
        userView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        userView.layer.shadowRadius = 6
        userView.layer.shadowOpacity = 0.6
        view.addSubview(userView)
//
        
        userNameInput = UITextField(frame: CGRect(x: 30, y: 0, width: userView.frame.width - 40, height: 40))
        userNameInput.backgroundColor = .cyan
        userNameInput.isUserInteractionEnabled = true
        userNameInput.layer.cornerRadius = 20
        userNameInput.backgroundColor = .white
        userNameInput.font = .systemFont(ofSize: 18)
        userNameInput.textColor = .navbarColor
//        userNameInput.placeholder = "Username: "
//        userNameInput.layer.shadowColor = UIColor(red: 10/255, green: 19/255, blue: 100/255, alpha: 1.0).cgColor
//        userNameInput.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        userNameInput.layer.shadowRadius = 6
//        userNameInput.layer.shadowOpacity = 0.6
//
        userNameInput.addTarget(self, action: #selector(onUsernameInput(_:)), for: .editingChanged)
        userView.addSubview(userNameInput)
        
        uservalidLabel = UILabel(frame: CGRect(x: 50, y: userView.frame.maxY + 15, width: windowWidth - 100, height: 20))
        uservalidLabel.text = "Please min length 2 and tolka alphabet!"
        uservalidLabel.textColor = .red
        uservalidLabel.textAlignment = .center
        uservalidLabel.font = .systemFont(ofSize: 14)
        uservalidLabel.isHidden = true
        view.addSubview(uservalidLabel)
        
        
        let imgview = UIView(frame: CGRect(x: -36, y: -10, width: 60 , height: 60))
        imgview.layer.cornerRadius = 30
        imgview.layer.shadowColor = UIColor(red: 20/255, green: 19/255, blue: 40/255, alpha: 1.0).cgColor
        imgview.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        imgview.layer.shadowRadius = 10
        imgview.backgroundColor = .mainColor
        imgview.layer.shadowOpacity = 0.4
        userView.addSubview(imgview)
        
        let userInputimg = UIImageView(frame: CGRect(x: 10, y: 10, width: imgview.frame.width - 20, height: imgview.frame.height - 20))
        userInputimg.image = UIImage(named: "peerson")
//        userInputimg.backgroundColor = .white
        userInputimg.layer.cornerRadius = 15
//        userInputimg.layer.shadowColor = UIColor(red: 10/255, green: 19/255, blue: 100/255, alpha: 1.0).cgColor
        //        userInputimg.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        //        userInputimg.layer.shadowRadius = 4
        //        userInputimg.layer.shadowOpacity = 0.6
        imgview.addSubview(userInputimg)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        let userView2 = UIView(frame: CGRect(x: 60, y: userView.frame.maxY + 40, width: windowWidth - 100, height: 40))
        userView2.backgroundColor = .white
        userView2.layer.cornerRadius = 20
        userView2.layer.shadowColor = UIColor(red: 10/255, green: 19/255, blue: 100/255, alpha: 1.0).cgColor
        userView2.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        userView2.layer.shadowRadius = 6
        userView2.layer.shadowOpacity = 0.6
        view.addSubview(userView2)
        
        
        passwordInput = UITextField(frame: CGRect(x: 30, y: 0, width: userView2.frame.width - 40, height: 40))
                                    
        passwordInput.backgroundColor = .cyan
        passwordInput.isUserInteractionEnabled = true
        passwordInput.layer.cornerRadius = 20
        passwordInput.backgroundColor = .white
        passwordInput.font = .systemFont(ofSize: 18)
        passwordInput.textColor = .navbarColor
//        passwordInput.placeholder = "Password:"
        passwordInput.isSecureTextEntry = false
        passwordInput.addTarget(self, action: #selector(onPasswordInput(_:)), for: .editingChanged)
        
        
        userView2.addSubview(passwordInput)
        
        
        passwordvalidLabel = UILabel(frame: CGRect(x: 50, y: userView2.frame.maxY + 15, width: windowWidth - 100, height: 40))
        passwordvalidLabel.text = "Please min length 6,ONE Symbol,min one char!"
        passwordvalidLabel.textColor = .red
        passwordvalidLabel.numberOfLines = 3
        passwordvalidLabel.lineBreakMode = .byWordWrapping
        passwordvalidLabel.textAlignment = .left
        passwordvalidLabel.font = .systemFont(ofSize: 14)
        passwordvalidLabel.isHidden = true
        view.addSubview(passwordvalidLabel)
        
        
        let imgview2 = UIView(frame: CGRect(x: -36, y: -10, width: 60 , height: 60))
        imgview2.layer.cornerRadius = 30
        imgview2.layer.shadowColor = UIColor(red: 20/255, green: 19/255, blue: 40/255, alpha: 1.0).cgColor
        imgview2.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        imgview2.layer.shadowRadius = 10
        imgview2.backgroundColor = .mainColor
        imgview2.layer.shadowOpacity = 0.4
        userView2.addSubview(imgview2)
        
        let passwordInputimg = UIImageView(frame: CGRect(x: 15, y: 15, width: imgview2.frame.width - 30, height: imgview.frame.height - 30))
        passwordInputimg.image = UIImage(named: "password")
//        userInputimg.backgroundColor = .white
        passwordInputimg.layer.cornerRadius = 15
        imgview2.addSubview(passwordInputimg)
        

        
        
        
        
        
        
        
        
        
         imgviewhideshow = UIView(frame: CGRect(x: passwordInput.frame.maxX - 30, y: 5, width: 30 , height: 30))
        imgviewhideshow.layer.cornerRadius = 15
//        imgviewhideshow.layer.shadowColor = UIColor(red: 20/255, green: 19/255, blue: 40/255, alpha: 1.0).cgColor
//        imgviewhideshow.layer.shadowOffset = CGSize(width: 0, height: 1.75)
//        imgviewhideshow.layer.shadowRadius = 10
//        imgviewhideshow.backgroundColor = .mainColor
//        imgviewhideshow.layer.shadowOpacity = 0.4
        imgviewhideshow.layer.borderWidth = 1
        if #available(iOS 13.0, *) {
            imgviewhideshow.layer.borderColor = CGColor(red: 100/255, green: 200/255, blue: 30/255, alpha: 1.0)
        } else {
            // Fallback on earlier versions
        }
        userView2.addSubview(imgviewhideshow)
        imgviewhideshow.isHidden = false
        imgviewhideshow.isUserInteractionEnabled = true
        imgviewhideshow.layer.cornerRadius = 15
        imgviewhideshow.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onPressHideShow(_:))))
        
        passwordInputimghideshow = UIImageView(frame: CGRect(x: 5, y: 3, width: imgviewhideshow.frame.width - 10, height: imgviewhideshow.frame.height - 10))
        passwordInputimghideshow.image = UIImage(named: "password")
//        userInputimg.backgroundColor = .white
        imgviewhideshow.addSubview(passwordInputimghideshow)
    
        
        
        
        
        
        
        
        
        
        
        
        
        signInBtn = UIButton(frame: CGRect(x: 120, y: userView2.frame.maxY + 50, width: windowWidth - 240, height: 50))
        signInBtn.setTitle("Sign in", for: .normal)
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.backgroundColor = .btnColor
        signInBtn.layer.cornerRadius = 26
        signInBtn.addTarget(self, action: #selector(onSignInButtonPressed), for: .touchUpInside)
        view.addSubview(signInBtn)
        
        
        let label = UILabel(frame: CGRect(x: 30, y: signInBtn.frame.maxY + 40, width: windowWidth - 40, height: 30))
        label.text = "--------- Or sign in with ----------"
        label.textColor = .labelTextColor
        label.textAlignment = .center
        
        label.font = .systemFont(ofSize: 17)
        view.addSubview(label)
       
        
        
        let googleview : UIView = UIView(frame: CGRect(x: 40, y: label.frame.maxY + 20, width: 80, height: 50))
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
        
        
        let facebook : UIView = UIView(frame: CGRect(x: googleview.frame.maxX + 34, y: label.frame.maxY + 20, width: 80, height: 50))
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
        
        
        let twitter : UIView = UIView(frame: CGRect(x: facebook.frame.maxX + 34, y: label.frame.maxY + 20, width: 80, height: 50))
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
        
        
        let donthaveLabel = UILabel(frame: CGRect(x: 40, y: googleview.frame.maxY + 30, width: 200, height: 30))
        donthaveLabel.text = "Don't have an account?"
        donthaveLabel.textColor = .labelTextColor
//        donthaveLabel.backgroundColor = .blue
        donthaveLabel.font = .systemFont(ofSize: 17)
        donthaveLabel.textAlignment = .center
        view.addSubview(donthaveLabel)
        
        
        let signuphereLabel = UILabel(frame: CGRect(x: donthaveLabel.frame.maxX + 1, y: googleview.frame.maxY + 30, width: 100, height: 30))
        signuphereLabel.text = "Sign up here"
        signuphereLabel.textColor = .blue
        signuphereLabel.font = .systemFont(ofSize: 16)
        signuphereLabel.backgroundColor = .red
        signuphereLabel.isUserInteractionEnabled = true
        signuphereLabel.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(onPressSignUp(_:))))
        view.addSubview(signuphereLabel)
        
       
        
        
    }

    @objc func onPressSignUp(_ gesture: UIGestureRecognizer){
        print("jfuuf")
        navigationController?.pushViewController(SignUpViewController(), animated: true)
        print("ishladi")
    }
    
    @objc func onPressHideShow(_ gesture: UITapGestureRecognizer){
       flag =  (flag) ? false : true
        passwordInput.isSecureTextEntry = flag
        print("gesturedd")
    }

    func navbar(){
        let nav = UINavigationController(rootViewController: SignInViewController())
        if #available(iOS 13.0, *) {
            nav.navigationBar.standardAppearance = UINavigationBarAppearance()
            nav.navigationBar.compactAppearance = UINavigationBarAppearance()
            nav.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        } else {
            // Fallback on earlier versions
        }
     
    }
    
    @objc func onUsernameInput(_ textfield: UITextField) -> Bool{
       var text = textfield.text
     return isValid(name: text ?? "")
    }
    
    @objc func onPasswordInput(_ number: UITextField)->Bool{
       var text = number.text
       
        return isValidPassword(password: text ?? "")
       
    }
    
    func isValid(name: String) -> Bool {
          //Declaring the rule of characters to be used. Applying rule to current state. Verifying the result.
          let regex = "[A-Za-z]{2,}"
          let test = NSPredicate(format: "SELF MATCHES %@", regex)
          let result = test.evaluate(with: name)
          
          return result
      }
    
    func isValidPassword(password: String) -> Bool {
           let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,16}"
           let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
           let result = passwordTest.evaluate(with: password)
           return result
       }
       
    @objc func onSignInButtonPressed(){
        if isValid(name: userNameInput.text ?? "") && isValidPassword(password: passwordInput.text ?? ""){
            let vc = SignUpViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        if !isValid(name: userNameInput.text ?? ""){
            
            self.uservalidLabel.isHidden = false
        }else if !isValidPassword(password: passwordInput.text ?? ""){
            self.passwordvalidLabel.isHidden = false
        }
       
    }
}
