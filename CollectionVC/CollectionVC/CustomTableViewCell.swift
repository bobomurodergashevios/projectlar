//
//  CustomTableViewCell.swift
//  CollectionVC
//
//  Created by Bobomurod Ergashev on 21/08/22.
//

import UIKit



class CustomTableViewCell : UITableViewCell{
    
    static let identifier = "CustomTableViewCell"
//
//    init() {
//        super.init(style: .default, reuseIdentifier: "CustomTableViewCell")
//        self.initView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func initView(frame: CGRect, contact : Mcontact){
        let image = UIImageView(frame: CGRect(x: 5, y: 5, width: 70 , height: frame.height - 10))
        image.pin_setImage(from: URL(string: "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg"))
        self.contentView.addSubview(image)
    }
    
    
}
