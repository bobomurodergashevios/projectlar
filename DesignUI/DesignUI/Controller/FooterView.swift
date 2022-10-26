//
//  FooterView.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 26/09/22.
//

import Foundation
import UIKit
class FooterCollectionResuableView : UICollectionReusableView{
    
    private let lbl : UILabel = {
        let lab = UILabel()
        lab.font = .boldSystemFont(ofSize: 25)
        lab.text = "FOOTERVIEW"
        lab.textColor = .white
        return lab
    }()
    
    
    
    public func configure(){
        self.backgroundColor = .blue
        lbl.frame = bounds
        self.addSubview(lbl)
        
    }
}
