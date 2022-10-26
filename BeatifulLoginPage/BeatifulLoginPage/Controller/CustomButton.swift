//
//  CustommView.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 12/08/22.
//

import UIKit








class MyButton:UIButton{
    private var model: Model
    
    init(frame: CGRect,model: Model) {
        self.model = model
        super.init(frame: frame)
        self.initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews(){
        
        
        let button = UIButton()
        button.setTitle(self.model.text, for: .normal)
        button.setTitleColor(self.model.textColor, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 18)
       
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        
        button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        button.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        button.rightAnchor.constraint(equalTo:  self.rightAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        button.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        button.addTarget(self, action: #selector(onButtonPress(_:)), for: .touchUpInside)
        
        
    }
    
    @objc func onButtonPress(_ sender: UIButton){
        
    }
    struct Model{
        var text: String
        var textColor: UIColor
        var backgroundColor: UIColor?
    }
    
  
}

