//
//  CustomTableViewVidjetCell.swift
//  RickandMortyAPI_Project
//
//  Created by Bobomurod Ergashev on 07/10/22.
//

import UIKit

class CustomTableViewVidjetCell: UITableViewCell {

    var dataList : [ModelVidjet]
    private var img : UIImageView!
    var index : IndexPath
    init(data: [ModelVidjet],index: IndexPath,style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.dataList = data
        self.index = index
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.inittable()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func inittable(){
        self.backgroundColor = .clear
        
        self.img = UIImageView(frame: CGRect(x: 2, y: dataList[index.row].mode == .faol ? 10 : 0, width: dataList[index.row].mode == .faol ? 40 : 0, height: self.frame.height-20))
        self.img.image = UIImage(named:  "\(dataList[index.row].leftImage.img)")
            self.img.contentMode = .scaleAspectFit
            self.img.clipsToBounds = true
            self.addSubview(self.img)
        
        
        
        let label = UILabel(frame: CGRect(x: (img.frame.maxX) + 10, y: 5, width: self.frame.width / 1.5, height: self.frame.height-10))
        label.text = dataList[index.row].title
        label.textColor = dataList[index.row].mode == .faol ? .black : .blue
        self.addSubview(label)
        
        
        let btn = UIButton(frame: CGRect(x: dataList[index.row].mode == .faol ? label.frame.maxX+60 : label.frame.maxX+100, y: 5, width: 60, height: self.frame.height-10))
        btn.setImage(UIImage(named: dataList[index.row].rightbtn.btn)?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
        self.contentView.addSubview(btn)
        
        
        
    }
    @objc func btnTapped(_ sender : UIButton){
        if self.index.section == 0 {
         
        }
    }
}
