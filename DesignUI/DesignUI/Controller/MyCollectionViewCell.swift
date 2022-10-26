//
//  MyCollectionViewCell.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 26/09/22.
//

import UIKit
import PINRemoteImage
let dataList : [cellDataModel] = [
   cellDataModel(image: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80", description: "Ko'z haqida"),
   cellDataModel(image: "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000", description: "Kosmonavtlar haqida"),
   cellDataModel(image: "https://www.w3schools.com/w3css/img_lights.jpg", description: "Qutb yog'dusi"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu_fpPmbK-bebEeX036y7frmW06amtCkG1ew&usqp=CAU", description: "To'tiqushlar haqida"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiIBCGW_Kh4itNM5MTgT_110NcxnyoSnkS4g&usqp=CAU", description: "Maymunlar haqida"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnZc4nu61fo87fwxBfVNGokRj1TP8t6IrdEQ&usqp=CAU", description: "Kitoblar dunyosi"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfyNtCM2SBewRilvmRiBDM5uPsXV7jb6KeBw&usqp=CAU", description: "Kuz haqida bir chimdim"),
   cellDataModel(image: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80", description: "Ko'z haqida"),
   cellDataModel(image: "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000", description: "Kosmonavtlar haqida"),
   cellDataModel(image: "https://www.w3schools.com/w3css/img_lights.jpg", description: "Qutb yog'dusi"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu_fpPmbK-bebEeX036y7frmW06amtCkG1ew&usqp=CAU", description: "To'tiqushlar haqida"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiIBCGW_Kh4itNM5MTgT_110NcxnyoSnkS4g&usqp=CAU", description: "Maymunlar haqida"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnZc4nu61fo87fwxBfVNGokRj1TP8t6IrdEQ&usqp=CAU", description: "Kitoblar dunyosi"),
   cellDataModel(image: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80", description: "Ko'z haqida"),
   cellDataModel(image: "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000", description: "Kosmonavtlar haqida"),
   cellDataModel(image: "https://www.w3schools.com/w3css/img_lights.jpg", description: "Qutb yog'dusi"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu_fpPmbK-bebEeX036y7frmW06amtCkG1ew&usqp=CAU", description: "To'tiqushlar haqida"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiIBCGW_Kh4itNM5MTgT_110NcxnyoSnkS4g&usqp=CAU", description: "Maymunlar haqida"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnZc4nu61fo87fwxBfVNGokRj1TP8t6IrdEQ&usqp=CAU", description: "Kitoblar dunyosi"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfyNtCM2SBewRilvmRiBDM5uPsXV7jb6KeBw&usqp=CAU", description: "Kuz haqida bir chimdim"),
   cellDataModel(image: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80", description: "Ko'z haqida"),
   cellDataModel(image: "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000", description: "Kosmonavtlar haqida"),
   cellDataModel(image: "https://www.w3schools.com/w3css/img_lights.jpg", description: "Qutb yog'dusi"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu_fpPmbK-bebEeX036y7frmW06amtCkG1ew&usqp=CAU", description: "To'tiqushlar haqida"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiIBCGW_Kh4itNM5MTgT_110NcxnyoSnkS4g&usqp=CAU", description: "Maymunlar haqida"),
   cellDataModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnZc4nu61fo87fwxBfVNGokRj1TP8t6IrdEQ&usqp=CAU", description: "Kitoblar dunyosi")
   
]
class MyCollectionViewCell: UICollectionViewCell {
    var indexpath : IndexPath!
  
    
    
    
 
    
    func initviews(frame: CGRect,indexpath: IndexPath){
//        contentView.backgroundColor = .yellow
        for subview in self.contentView.subviews {
         subview.removeFromSuperview()
        }
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height-20))
        imageview.pin_setImage(from: URL(string: dataList[indexpath.row].image))
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.layer.masksToBounds = true
        self.contentView.addSubview(imageview)
     
        self.contentView.backgroundColor = .clear
        let lab = UILabel(frame: CGRect(x: 5, y: 117, width: self.frame.width, height: 50))
        lab.text = dataList[indexpath.row].description
        lab.textColor = .black
        lab.numberOfLines = 10
        lab.font = .systemFont(ofSize: 12)
//        self.backgroundColor = .yellow
//        for subview in self.subviews {
//            subview.removeFromSuperview()
//        }
        self.contentView.addSubview(lab)
        
        
        
        
    }
}


struct cellDataModel {
    var image : String
    var description : String
    
}
