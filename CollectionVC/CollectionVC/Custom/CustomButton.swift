
import UIKit


class CustomButton: UIView {
    
    
    var model : ButtonModel!
    var onPress : ((Int)->Void)?
    
    
    init(frame: CGRect,model: ButtonModel) {
        super.init(frame: frame)
        self.model = model
        self.initviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initviews(){
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        button.backgroundColor = model.bacColor
        button.setTitleColor(model.textColor, for: .normal)
        button.setTitle(model.text, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button.layer.cornerRadius = 10
        button.tag = Int.random(in: 0 ... 10)
        button.addTarget(self, action: #selector(onButtonPressed(_:)), for: .touchUpInside)
        self.addSubview(button)
//        let imgv = UIImageView()
//        imgv.clipsToBounds = true
//        imgv.contentMode = .scaleAspectFit
        
//        imgv.image = UI
    }
    
    
    @objc func onButtonPressed(_ sender : UIButton){
        self.onPress?(sender.tag)
    }
    
}


struct ButtonModel {
    
    var mode : BtnMode
    var text : String
    
    var textColor: UIColor{
        switch mode {
        case .qushish:
            return .white
        case .ayirish:
            return .black
        case .bolish:
            return .red
        case .kopaytirish:
            return .yellow
        }
    }
    var bacColor : UIColor{
        switch mode {
        case .qushish:
            return .black
        case .ayirish:
            return .white
        case .bolish:
            return .yellow
        case .kopaytirish:
            return .red
        }
    }
    
    
    
}

enum BtnMode {
    case qushish
    case ayirish
    case bolish
    case kopaytirish
}

