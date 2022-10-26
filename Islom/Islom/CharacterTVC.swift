//
//  CharacterTVC.swift
//  Islom
//
//  Created by Bobomurod Ergashev on 12/09/22.
//

import UIKit
import SDWebImage

class CharacterTVC: UITableViewCell {
    
    static let identifier: String = "CharacterTVC"
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 23, weight: .bold)
        return lbl
    }()
    
    let statusLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    let colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    let hStack: UIStackView = {
        let hs = UIStackView()
        hs.translatesAutoresizingMaskIntoConstraints = false
        hs.axis = .horizontal
        hs.alignment = .fill
        hs.distribution = .fillEqually
        hs.spacing = 5
        return hs
    }()
    
    let vStack: UIStackView = {
        let vs = UIStackView()
        vs.translatesAutoresizingMaskIntoConstraints = false
        vs.axis = .vertical
        vs.alignment = .fill
        vs.distribution = .equalSpacing
        vs.spacing = 5
        return vs
    }()
    
    let hStack_1: UIStackView = {
        let vs = UIStackView()
        vs.translatesAutoresizingMaskIntoConstraints = false
        vs.axis = .horizontal
        vs.alignment = .fill
        vs.distribution = .fillEqually
        vs.spacing = 5
        return vs
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(containerView)
        containerView.addSubview(hStack)
        hStack.addArrangedSubview(imgView)
        hStack.addArrangedSubview(vStack)
        hStack_1.addArrangedSubview(colorView)
        hStack_1.addArrangedSubview(statusLabel)
        vStack.addArrangedSubview(nameLabel)
        vStack.addArrangedSubview(hStack_1)
        
        colorView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        colorView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            hStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            hStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 5),
            hStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 5)
        ])
       
    }
    
    func updateCell(character: CharacterDM) {
        imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imgView.sd_setImage(with: character.imageUrl)
        nameLabel.text = character.name
        statusLabel.text = character.statusSpecies
        
        if character.status == "Dead" {
            colorView.backgroundColor = .systemRed
        } else if character.status == "Alive" {
            colorView.backgroundColor = .systemGreen
        } else {
            colorView.backgroundColor = .darkGray
        }
    }

}
