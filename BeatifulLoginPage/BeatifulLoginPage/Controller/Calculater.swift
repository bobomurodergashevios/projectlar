//
//  Calculater.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 15/08/22.
//

import UIKit

class Calculater: UIViewController {

//    private var model:
    var mButtons = [MButton]()
    var mButtonsModel = [
        MButton.MButtonModel(mode: .addition,isSelected: true),
        MButton.MButtonModel(mode: .subtraction,isSelected: false),
        MButton.MButtonModel(mode: .multipication,isSelected: false),
        MButton.MButtonModel(mode: .division,isSelected: false)
    ]
    override func viewDidLoad() {
        self.view.backgroundColor = .cyan
        self.initviews()
    }
    
    func initviews(){
        let input = CustomRemember2(frame: CGRect(x: 0, y: 100, width: windowWidth, height: 100), model: CustomRemember2.Model(mode: .phone, title: "Sonni kiriting!", titleColor: .black, bacColor: .white))
        view.addSubview(input)
        
        var leftSpace: CGFloat = 30
        var buttonWidth: CGFloat = 48
        var spacing : CGFloat = (windowWidth - 4 * buttonWidth - 2 * leftSpace) / 3
        for i in 0 ... 3{
            let button = MButton(frame: CGRect(x: leftSpace + CGFloat(i)*(spacing+buttonWidth), y: input.frame.maxY + 10, width: buttonWidth, height: buttonWidth), model: mButtonsModel[i])
            button.addTarget(self, action: #selector(onpressedbtn(_:)), for: .touchUpInside)

            self.view.addSubview(button)
            mButtons.append(button)
            
        }
      
        
        
        let input2 = CustomRemember2(frame: CGRect(x: 0, y: 300, width: windowWidth, height: 100), model: CustomRemember2.Model(mode: .phone, title: "Sonni kiriting!", titleColor: .black, bacColor: .white))
        view.addSubview(input2)
        
    }
    
    @objc func onpressedbtn(_ sender: UIButton) {
        let tag = sender.tag
        let mode = MButton.Mode(rawValue: tag) ?? .addition
        self.mButtonsModel.select(index: mode.index)
    }

}
