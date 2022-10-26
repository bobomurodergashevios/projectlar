//
//  AllCustomViewController.swift
//  CollectionVC
//
//  Created by Bobomurod Ergashev on 24/08/22.
//

import UIKit

class AllCustomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        
        self.initviewssss()

    }
    

    func initviewssss(){
        let input = CustomTField(frame: CGRect(x: 10, y: 60, width: windowWidth-20, height: 60), model: MyTXTFieldModel(title: "Marhamat !", mode: .phone))
        view.addSubview(input)
        
        let input2 = CustomTField(frame: CGRect(x: 10, y: input.frame.maxY+60, width: windowWidth-20, height: 60), model: MyTXTFieldModel(title: "Napishite !", mode: .email))
        view.addSubview(input2)
        
        
        let btn = CustomButton(frame: CGRect(x: 20, y: input2.frame.maxY+10, width: 70, height: 40), model: ButtonModel(mode: .qushish, text: "+"))
        btn.onPress = { tag in
            print(tag)
            
        }
        view.addSubview(btn)
        
        let btn2 = CustomButton(frame: CGRect(x: btn.frame.maxX + 20, y: input2.frame.maxY+10, width: 70, height: 40), model: ButtonModel(mode: .ayirish, text: "-"))
        btn2.isUserInteractionEnabled = true
        view.addSubview(btn2)
        btn2.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(onbtnPress(_:))))
//        btn2.onPress = { tag in
//            print(tag)
//        }
       
        
        let btn3 = CustomButton(frame: CGRect(x: btn2.frame.maxX + 20, y: input2.frame.maxY+10, width: 70, height: 40), model: ButtonModel(mode: .kopaytirish, text: "*"))
        btn3.onPress = { tag in
            print(tag)
            
        }
        view.addSubview(btn3)
        
        let btn4 = CustomButton(frame: CGRect(x:btn3.frame.maxX + 20, y: input2.frame.maxY+10, width: 70, height: 40), model: ButtonModel(mode: .bolish, text: "/"))
        view.addSubview(btn4)
        
        
        
    }
    
    @objc func onbtnPress(_ button : CustomButton){
        button.onPress = { tag in
            print( tag)
            
        }
    }

}
