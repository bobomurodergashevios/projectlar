//
//  MyModel.swift
//  CollectionVC
//
//  Created by Bobomurod Ergashev on 24/08/22.
//

import UIKit

struct MyTXTFieldModel{
    
    var title: String
    var mode : Mode
    var image : UIImage?
    
    
    var bacColor : UIColor{
        switch mode {
        case .text:
            return .green
        case .phone:
            return .orange
        case .email:
            return .gray
        }
    }
    
    var labelColor : UIColor{
        switch mode {
        case .text:
            return .white
        case .phone:
            return .yellow
        case .email:
            return .red
        }
    }
    
}
enum Mode {
    
    case text
    case phone
    case email
    
    
    
    
    
}
