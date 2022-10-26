//
//  CustomRemember2.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 15/08/22.
//

import UIKit

class CustomRemember2: UIView {

    private var model: Model!

    
    init(frame: CGRect,model: Model) {
        self.model = model
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        
        
        let titleLabel = UILabel(frame: CGRect(x: 24, y: -28, width: 200, height: 40))
        titleLabel.text = self.model.title
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 19)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        
        
        let cardView = UIView(frame: CGRect(x: 20, y: 10, width: windowWidth - 40, height: self.frame.height - 40))
        cardView.layer.cornerRadius = 9
        cardView.layer.shadowColor = UIColor(red: 220/255, green: 20/255, blue: 200/255, alpha: 1.0).cgColor
        cardView.layer.shadowRadius = 20
        cardView.layer.shadowOffset = CGSize(width: 9.0, height: 9.0)
        cardView.backgroundColor = .white
        cardView.layer.shadowOpacity = 0.4
        self.addSubview(cardView)
        
        
        
        let input1 = UITextField(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 60))

        input1.textColor = self.model.titleColor
        input1.font = .systemFont(ofSize: 18)
        input1.textAlignment = .left
        cardView.addSubview(input1)
        
        switch model.mode {
            case .phone :  input1.keyboardType = .decimalPad
            case .email :  input1.keyboardType = .emailAddress
            case .text : input1.keyboardType = .default
        }
        
        
        
    }
    
    enum Mode{
        case text
        case phone
        case email
    }
    
    struct Model{
        var mode : Mode
        var title: String
        var titleColor: UIColor?
        var image: UIImage?
        var placeHolderText: String?
        var bacColor: UIColor
    }
}

