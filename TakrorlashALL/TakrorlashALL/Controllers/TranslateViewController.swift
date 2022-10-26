//
//  TranslateViewController.swift
//  TakrorlashALL
//
//  Created by Bobomurod Ergashev on 23/10/22.


import UIKit

class TranslateViewController: UIViewController {

    private let gorizontalstack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fill
        return stack
    }()
    
    
    private let imgv : UIImageView = {
        let imgvi = UIImageView()
        imgvi.image = UIImage(named: "tr")
        imgvi.contentMode = .scaleAspectFill
        return imgvi
    }()
    
    private let verticalstack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }()
    
    private let label : UILabel = {
       let lbl = UILabel()
        lbl.text = "Google"
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 23)
        return lbl
    }()
    
    private let label2 : UILabel = {
       let lbl = UILabel()
        lbl.text = "Translate"
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 20)
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainColor
        
        initvc()
        
    }
    
    func initvc(){
        view.addSubview(gorizontalstack)
//        gorizontalstack.backgroundColor = .red
        gorizontalstack.addArrangedSubview(imgv)
        gorizontalstack.addArrangedSubview(verticalstack)
        verticalstack.addArrangedSubview(label)
        verticalstack.addArrangedSubview(label2)
        
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        gorizontalstack.frame = CGRect(x: 80, y: 120, width: view.frame.width-160, height: 120)
        
        verticalstack.frame = CGRect(x: 0, y: 0, width: gorizontalstack.frame.width/3, height: 120)

    }
}


extension UIColor {
    static let mainColor = UIColor(red: 244/255, green: 245/255, blue: 247/255, alpha: 1.0)
}

