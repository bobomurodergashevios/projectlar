//
//  CustomView.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 11/08/22.
//

import UIKit

class CustomView: UIViewController {
    private var inputName: CustommView!
    private var inputPhone: CustommView!
    private var inputEmail: CustommView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        
        
        let logoview = UIView(frame: CGRect(x: windowWidth/4, y: windowWidth/4, width: windowWidth / 2, height: windowWidth / 4))
        view.addSubview(logoview)
        
        
        let logImage = UIImageView(frame: CGRect(x: 30, y: 30, width: logoview.frame.width-60, height: logoview.frame.height-60))
        logImage.image = UIImage(named: "vue")
        logImage.contentMode = .scaleAspectFill
        logoview.addSubview(logImage)

        
         inputName = CustommView(frame: CGRect(x: 20, y: logoview.frame.maxY + 30, width: windowWidth-40, height: 90), model: CustommView.Model(mode: .text, title: "Name"))
        view.addSubview(inputName)

//
         inputPhone = CustommView(frame: CGRect(x: 20, y: inputName.frame.maxY + 20, width: windowWidth-40, height: 90), model: CustommView.Model(mode: .phone, title: "Phone Number", image: UIImage(named: "peerson"),placeholderText: "+998"))
        view.addSubview(inputPhone)




         inputEmail = CustommView(frame: CGRect(x: 20, y: inputPhone.frame.maxY + 20, width: windowWidth-40, height: 90), model: CustommView.Model(mode: .email, title: "Email", image: UIImage(named: "gmail")))
        
        inputEmail.isUserInteractionEnabled = true
        
        view.addSubview(inputEmail)


        let buttonview = MyButton(frame: CGRect(x: 120, y: inputEmail.frame.maxY + 60, width: windowWidth - 240, height: 40), model: MyButton.Model(text: "MyButton", textColor: .white, backgroundColor: UIColor.btnColor))
        
        view.addSubview(buttonview)


       
    }
    
    
    @objc func onButtonPress(_ sender: UIButton){
       
    
    }
    
    @objc func onEmail(){
        print("jjj")
    }
    
}

