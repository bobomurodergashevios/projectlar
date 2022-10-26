//
//  TableViewCell.swift
//  Islom
//
//  Created by Bobomurod Ergashev on 12/09/22.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {
    
    static let identifier: String = "TableViewCell"
    static func uinib()-> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.shadowColor = UIColor.gray.cgColor
            containerView.layer.shadowRadius = 4
            containerView.layer.shadowOpacity = 0.7
            containerView.layer.shadowOffset = CGSize(width: 3, height: 2)
        }
    }
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var statusLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func updateCell(character: CharacterDM) {
        imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imgView.sd_setImage(with: character.imageUrl)
        nameLbl.text = character.name
        statusLbl.text = character.statusSpecies
        
        if character.status == "Dead"{
            colorView.backgroundColor = .systemRed
        } else if character.status == "Alive"{
            colorView.backgroundColor = .systemGreen
        } else{
            colorView.backgroundColor = .darkGray
        }
    }
    
}
