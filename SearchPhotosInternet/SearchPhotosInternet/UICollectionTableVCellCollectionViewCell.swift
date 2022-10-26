//
//  UICollectionTableVCellCollectionViewCell.swift
//  SearchPhotosInternet
//
//  Created by Bobomurod Ergashev on 02/10/22.
//

import UIKit

class UICollectionTableVCellCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "UICollectionTableVCellCollectionViewCell"
    static var imgview : UIImageView!
    private var daytitle : UILabel!
    private var temperatureCountLABEL : UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initcvc()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initcvc(){
        daytitle = UILabel(frame: CGRect(x: 5, y: 2, width: self.frame.width-10, height: 20))
        daytitle.text = "10:00"
        daytitle.textColor = .white
        daytitle.font = .systemFont(ofSize: 11, weight: .bold)
        self.addSubview(daytitle)
        
        
        UICollectionTableVCellCollectionViewCell.imgview = UIImageView(frame: CGRect(x: 5, y: daytitle.frame.maxY+4, width: self.frame.width - 10, height: 30))
        if #available(iOS 13.0, *) {
            UICollectionTableVCellCollectionViewCell.imgview.image = UIImage(systemName: "sun.max.fill")
        } else {
            // Fallback on earlier versions
        }
        UICollectionTableVCellCollectionViewCell.imgview.contentMode = .scaleAspectFill
        UICollectionTableVCellCollectionViewCell.imgview.clipsToBounds = true
        
        self.addSubview(UICollectionTableVCellCollectionViewCell.imgview)
        
        temperatureCountLABEL = UILabel(frame: CGRect(x: 14, y: UICollectionTableVCellCollectionViewCell.imgview.frame.maxY+2, width: self.frame.width-16, height: 20))
        temperatureCountLABEL.text = "76°"
        temperatureCountLABEL.textColor = .white
        temperatureCountLABEL.font = .systemFont(ofSize: 13, weight: .medium)
        self.addSubview(temperatureCountLABEL)
updatingAllProps()
    }
    

    
    func updatingAllProps(){
        APIClient.getCurrentWeather() { response in
            if let data = response {
                guard let iconstring = data.weather?[0].icon else{return}
                UICollectionTableVCellCollectionViewCell.imgview.pin_setImage(from: URL(string: "https://openweathermap.org/img/wn/\(iconstring)@2x.png"))
            }
            
        }
    }
}
