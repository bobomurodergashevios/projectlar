//
//  HeroHeaderUIView.swift
//  MoviesProject
//
//  Created by Bobomurod Ergashev on 26/09/22.
//

import Foundation
import UIKit



class HeroHeaderUIView : UIView {
    
    
    private let playButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Play", for: .normal)
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        btn.layer.cornerRadius = 5
        return btn
        
    }()
    
    private let downloadButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Download", for: .normal)
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        btn.layer.cornerRadius = 5
        return btn
        
    }()
    
    
    private let imgview : UIImageView = {
       let imgv = UIImageView()
        imgv.contentMode = .scaleAspectFill
        imgv.image = UIImage(named: "forsaj")
        imgv.clipsToBounds = true
        imgv.layer.masksToBounds = true
        
        return imgv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imgview)
        self.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(downloadButton)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        applyContstraints()
   
        
//        addGradient()
    }
  
    
    
    func applyContstraints(){
        self.playButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 80).isActive = true
        self.playButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -200).isActive = true
        self.playButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -70).isActive = true
        
        
        
//        self.downloadButton.leftAnchor.constraint(equalTo: self.rightAnchor, constant: -98).isActive = true
//        self.downloadButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        self.downloadButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -70).isActive = true
        downloadButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -80).isActive = true
        self.downloadButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imgview.frame = CGRect(x: 7, y: 10, width: self.frame.width-14, height: self.frame.height-20)
       
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor]
        gradientLayer.frame = imgview.bounds
        gradientLayer.opacity = 0.9
//        gradientLayer.contents = imgview.image?.cgImage
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        imgview.layer.addSublayer(gradientLayer)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

