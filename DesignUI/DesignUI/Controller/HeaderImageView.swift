//
//  HeaderImageView.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 20/09/22.
//

import UIKit

class HeaderImageView: UIView {
    var vc = RegistrationViewController()
    
    private let headerimg : UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.clipsToBounds = true
        
        imgview.image = UIImage(named: "robo")
        return imgview
    }()

    private func addgradient(){
        let gradientlayer = CAGradientLayer()
        gradientlayer.colors = [
            UIColor.black.cgColor,
            UIColor.white.cgColor
        ]
        gradientlayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientlayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientlayer.frame = bounds
        gradientlayer.opacity = 0.4
        layer.addSublayer(gradientlayer)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerimg)
        
        let namelabel = UILabel(frame: CGRect(x: 16, y: 160, width: winw/2, height: 40))
        namelabel.text = "jjiiijijijijij"


        namelabel.text = self.getConflik()
        
        namelabel.textColor = .white
        namelabel.font = .systemFont(ofSize: 19)
        headerimg.addSubview(namelabel)
        addgradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerimg.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func getConflik() -> String{
        var res : String = ""
        self.vc.conflik = { str in
            res = str
        }
        return res
    }
    
}
