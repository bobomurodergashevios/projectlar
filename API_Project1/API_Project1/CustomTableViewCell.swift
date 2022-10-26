//
//  CustomTableViewCell.swift
//  API_Project1
//
//  Created by Bobomurod Ergashev on 14/09/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    private var nameLabel : UILabel!
    private var locationLabel : UILabel!
    private var locationStreetLabel : UILabel!
    private var seenLabel : UILabel!
    private var seenId : UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initviews()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initviews(){
        let containerView = UIView()
        containerView.layer.cornerRadius = 8
//        containerView.backgroundColor = .blue
        contentView.addSubview(containerView)
        containerView.frame = contentView.frame

        
         nameLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 150, height: 30))
        nameLabel.font = .boldSystemFont(ofSize: 23)
        nameLabel.textColor = .red
        containerView.addSubview(nameLabel)
        
        
        
         locationLabel = UILabel(frame: CGRect(x: 10, y: nameLabel.frame.maxY + 10, width: 170, height: 30))
        locationLabel.font = .systemFont(ofSize: 21)
        locationLabel.textColor = .gray
        containerView.addSubview(locationLabel)

        
         locationStreetLabel = UILabel(frame: CGRect(x: 10, y: locationLabel.frame.maxY + 10, width: 170, height: 30))
        locationStreetLabel.font = .systemFont(ofSize: 22)
        locationStreetLabel.textColor = .white

         seenLabel = UILabel(frame: CGRect(x: 10, y: locationStreetLabel.frame.maxY + 10, width: 170, height: 30))
        seenLabel.font = .systemFont(ofSize: 21)
        seenLabel.textColor = .gray
        containerView.addSubview(seenLabel)
        
         seenId = UILabel(frame: CGRect(x: 10, y: seenLabel.frame.maxY + 10, width: 70, height: 30))
        seenId.font = .systemFont(ofSize: 22)
        seenId.textColor = .black
        containerView.addSubview(seenId)
        
               
        
//
//
//        let imgview = UIImageView(frame: CGRect(x: 0, y: 0, width: horizontalStack.frame.width, height: horizontalStack.frame.height))
//        imgview.backgroundColor = .brown
//        horizontalStack.addArrangedSubview(imgview)
//
//        let verticalStack = UIStackView()
//        verticalStack.axis = .vertical
//        verticalStack.spacing = 10
//        verticalStack.alignment = .fill
//        verticalStack.distribution = .fillEqually
//        verticalStack.backgroundColor = .red
//        horizontalStack.addArrangedSubview(verticalStack)
//
//        let verticalStack2 = UIStackView()
//        verticalStack2.axis = .horizontal
//        verticalStack2.spacing = 10
//        verticalStack2.alignment = .fill
//        verticalStack2.distribution = .fillEqually
//        verticalStack.addSubview(verticalStack2)
//
//        let nameLabel = UILabel()
//        nameLabel.frame = verticalStack2.frame
//        nameLabel.font = .boldSystemFont(ofSize: 23)
//        nameLabel.textColor = .white
//        verticalStack2.addArrangedSubview(nameLabel)
//
//        let statuslabel = UILabel()
//        statuslabel.frame = verticalStack2.frame
//        statuslabel.font = .boldSystemFont(ofSize: 20)
//        statuslabel.textColor = .white
//        verticalStack2.addArrangedSubview(statuslabel)
//
//        let verticalStack3 = UIStackView()
//        verticalStack3.axis = .horizontal
//        verticalStack3.spacing = 10
//        verticalStack3.alignment = .fill
//        verticalStack3.distribution = .fillEqually
//        verticalStack.addSubview(verticalStack3)
//
//        let locationLabel = UILabel()
//        locationLabel.frame = verticalStack3.frame
//        statuslabel.font = .systemFont(ofSize: 21)
//        statuslabel.textColor = .gray
//        verticalStack3.addArrangedSubview(locationLabel)
//
//        let locationStreetLabel = UILabel()
//        locationStreetLabel.frame = verticalStack3.frame
//        locationStreetLabel.font = .systemFont(ofSize: 22)
//        locationStreetLabel.textColor = .white
//        verticalStack3.addArrangedSubview(locationStreetLabel)
//
//
//
//        let verticalStack4 = UIStackView()
//        verticalStack4.axis = .horizontal
//        verticalStack4.spacing = 10
//        verticalStack4.alignment = .fill
//        verticalStack4.distribution = .fillEqually
//        verticalStack.addSubview(verticalStack4)
//
//        let seenLabel = UILabel()
//        seenLabel.frame = verticalStack4.frame
//        seenLabel.font = .systemFont(ofSize: 21)
//        seenLabel.textColor = .gray
//        verticalStack4.addArrangedSubview(seenLabel)
//
//        let seenId = UILabel()
//        seenId.frame = verticalStack4.frame
//        seenId.font = .systemFont(ofSize: 22)
//        seenId.textColor = .white
//        verticalStack4.addArrangedSubview(seenId)
        
        
    }
    func updateCell(character: CharacterDM){
        self.nameLabel.text = character.name
        self.seenLabel.text = character.status
        self.seenId.text = "\(character.id)"
        self.locationLabel.text = character.location
        self.locationStreetLabel.text = character.species
    }
}
