//
//  CusomTXTField.swift
//  CollectionVC
//
//  Created by Bobomurod Ergashev on 24/08/22.
//

import UIKit




class CustomTField: UIView {
    var model : MyTXTFieldModel!
    
    init(frame: CGRect, model : MyTXTFieldModel){
        self.model = model
        super.init(frame: frame)
        self.initviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func initviews(){
        let baseview = UIView(frame: CGRect(x: 10, y: 0, width: self.frame.width-20, height: self.frame.height))
        baseview.backgroundColor = model.bacColor
        self.addSubview(baseview)
        
        let textlabel = UILabel(frame: CGRect(x: 0, y: -30, width: 100, height: 23))
        textlabel.text = model.title
        textlabel.textColor = model.labelColor
        textlabel.font = .systemFont(ofSize: 19)
        baseview.addSubview(textlabel)
        
        
        let input = UITextField(frame: CGRect(x: 10, y: 10, width: baseview.frame.width-20, height: baseview.frame.height-20))
        input.isUserInteractionEnabled = true
        input.textColor = .black
        input.font = .systemFont(ofSize: 20)
        baseview.addSubview(input)
        
        
        switch self.model.mode{
                case .text : input.keyboardType = .default
                case .email : input.keyboardType = .emailAddress
                case .phone : input.keyboardType = .numberPad
            
            default : input.keyboardType = .default
        }
        
        
    }
}

