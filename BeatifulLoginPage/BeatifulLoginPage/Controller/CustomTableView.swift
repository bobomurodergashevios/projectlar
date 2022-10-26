//
//  CustomTableView.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 12/08/22.
//

import UIKit




class CustomTableViewCell : UITableViewCell{
    private var model: Model
    
    init(frame: CGRect,model: Model) {
        self.model = model
        super.init(style: .default, reuseIdentifier: "CustomTableViewCell")

        
        self.initTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initTableViewCell(){
        
        let tblView = UIView()
        tblView.backgroundColor = .white
        tblView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tblView)
        
        tblView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        tblView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        tblView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        tblView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        
        
        let titleLabel = UILabel()
        titleLabel.text = self.model.titleLabel
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        tblView.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: tblView.topAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: tblView.leftAnchor, constant: 20).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: tblView.bottomAnchor, constant: -20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        let titleImage = UIImageView()
        titleImage.image = self.model.image
        titleImage.contentMode = .scaleAspectFit
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        tblView.addSubview(titleImage)
        
        titleImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        titleImage.leftAnchor.constraint(equalTo: tblView.leftAnchor, constant: 20).isActive = true
        titleImage.bottomAnchor.constraint(equalTo: tblView.bottomAnchor, constant: -5).isActive = true
        titleImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        titleImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }
    
    
    struct Model{
        var titleLabel: String
        var detailedLabel: String?
        
        var image: UIImage?
        
        
    }
    
}
