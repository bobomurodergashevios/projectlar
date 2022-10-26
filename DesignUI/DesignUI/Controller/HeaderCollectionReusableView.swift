//
//  HeaderCollectionReusableView.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 26/09/22.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    private let lbl : UILabel = {
        let lab = UILabel()
        lab.text = "Header"
        lab.textColor = .white
        lab.font = .boldSystemFont(ofSize: 23)
        return lab
    }()
    public func configure(){
        self.backgroundColor = .red
        lbl.frame = bounds
        self.addSubview(lbl)
    }
}





