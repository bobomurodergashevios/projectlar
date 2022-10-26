//
//  MButton.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 15/08/22.
//

import UIKit

class MButton: UIButton {

    private var model : MButtonModel!
    
    init(frame: CGRect,model: MButtonModel) {
        self.model = model
        super.init(frame: frame)
        self.initSelf()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initSelf(){
        self.backgroundColor = self.model.bacColor
        self.setTitle(self.model.mode.title, for: .normal)
        self.setTitleColor(self.model.titleColor, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 26)
        self.layer.cornerRadius = 8
        self.tag = self.model.mode.rawValue
    }
    func update(with model : MButtonModel){
        self.model = model
        
    }
    
    func updateUI(){
        self.backgroundColor = self.model.bacColor
        self.setTitleColor(self.model.titleColor, for: .normal)
    }
    
    enum Mode: Int {
        case addition = 100
        case subtraction
        case multipication
        case division
        
        
        var title : String {
            switch self {
                case .addition: return "+"
                case .subtraction: return "-"
                case .multipication: return "*"
                case .division: return "/"
            }
            
        }
        
        var index : Int{
            switch self {
            case .addition:
                return 0
            case .subtraction:
                return 1
            case .multipication:
                return 2
            case .division:
                return 3
            }
        }
   
        
        
    }
    
    
    struct MButtonModel{
        var mode: Mode
        var isSelected: Bool
        
        
        var bacColor: UIColor{
            return self.isSelected ? .btnColor : .white
        }
        
        var titleColor: UIColor{
            return isSelected ? .white : .black
            
        }
    }
    

}


extension Int{
    func getButtonType() -> MButton.Mode{
        switch self{
            case 0 : return .addition
            case 1: return .subtraction
            case 2: return .multipication
            case 3: return .division
        default:
            return .addition
        }
    }
}
extension Array where Element == MButton.MButtonModel{
    mutating func select(index: Int) {
        for i in 0 ... self.count-1{
            self[i].isSelected = false
            if i == index{
                self[i].isSelected = true
            }
        }
        
    }
}
