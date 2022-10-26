//
//  CustomTableviewCellTableViewCell.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 25/09/22.
//

import UIKit

import Lottie

class CustomTableviewCellTableViewCell: UITableViewCell {

    var indexPath : IndexPath!
 
   
    var animationView : AnimationView!
    var anims : [String] = ["privacy","lowinternet","language","setting","info","logout"]
    var datalist: [Model] = [
        Model(name: "Privacy and Security", mode: .right, anim: "privacy"),
        Model(name: "Notifications", mode: .right,anim: "lowinternet"),
        Model(name: "Languages", mode: .right, anim: "language"),
        Model(name: "Settings", mode: .info, anim: "setting"),
        Model(name: "App Info", mode: .info,anim: "info"),
        Model(name: "Log out", mode: .right,anim: "logout")
    ]
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?,indexPath: IndexPath) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.indexPath = indexPath
        self.initviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func initviews(){
        
//        for anim in self.anims {
//
//            self.animationView = AnimationView(name: "language")
//
//            animationView.frame = CGRect(x: 3, y: 5, width: 30, height: self.frame.height - 10)
//            animationView.loopMode = .loop
//            animationView.play()
//    //        animationView.backgroundColor = .red
//            self.addSubview(animationView)
//            
//        }
       
        
        self.animationView = AnimationView(name: "language")
       
        animationView.frame = CGRect(x: 3, y: 5, width: 30, height: self.frame.height - 10)
        animationView.loopMode = .loop
        animationView.play()
           //        animationView.backgroundColor = .red
        self.addSubview(animationView)
        
        let labelSetting = UILabel(frame: CGRect(x: animationView.frame.maxX + 6, y: 5, width: 200, height: self.frame.height - 10))
        labelSetting.text = datalist[self.indexPath.row].name
        labelSetting.textColor = .black
        labelSetting.font = .systemFont(ofSize: 19)
        self.addSubview(labelSetting)
        
        
        
        
        
        
    }
    
}
