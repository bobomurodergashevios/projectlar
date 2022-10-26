//
//  TitleTableViewCell.swift
//  MoviesProject
//
//  Created by Bobomurod Ergashev on 28/09/22.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

   static let identifier = "TitleTableViewCell"
    private let playtitleButton : UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "play.circle"), for: .normal)
        return btn
        
    }()
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
        
    }()
    private let titlesPosterUiImageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.translatesAutoresizingMaskIntoConstraints = false
//        imageview.clipsToBounds = true
        return imageview
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterUiImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playtitleButton)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model : TitleViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
    
        titlesPosterUiImageView.sd_setImage(with: url,completed: nil)
        titleLabel.text = model.titleName
    }
    func applyConstraints(){
        titlesPosterUiImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titlesPosterUiImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15).isActive = true
        titlesPosterUiImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        titlesPosterUiImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        titleLabel.leadingAnchor.constraint(equalTo: titlesPosterUiImageView.trailingAnchor, constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        
        playtitleButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0).isActive = true
        playtitleButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        playtitleButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        playtitleButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        playtitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    }
    
    
    
}
