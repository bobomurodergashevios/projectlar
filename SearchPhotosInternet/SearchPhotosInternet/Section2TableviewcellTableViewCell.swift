//
//  Section2TableviewcellTableViewCell.swift
//  SearchPhotosInternet
//
//  Created by Bobomurod Ergashev on 02/10/22.
//

import UIKit

class Section2TableviewcellTableViewCell: UITableViewCell {

    static let identifier = "Section2TableviewcellTableViewCell"
    private var daylabel : UILabel!
    private var namlik : UILabel!
    private var temperaturaicon : UIImageView!
    private var temperaturaCount : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.inittableviewcell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var title = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    
    func inittableviewcell(){
        daylabel = UILabel(frame: CGRect(x: 25, y: 3, width: 90, height: self.frame.height-6))
        daylabel.text = title.randomElement()
        daylabel.textColor = .white
        daylabel.font = .systemFont(ofSize: 14, weight: .medium)
        self.addSubview(daylabel)
        
        namlik = UILabel(frame: CGRect(x: daylabel.frame.maxX + 20, y: 3, width: 30, height: self.frame.height-6))
        namlik.text = "22%"
        namlik.textColor = .white
        namlik.font = .systemFont(ofSize: 11, weight: .thin)
        self.addSubview(namlik)
        
        temperaturaicon = UIImageView(frame: CGRect(x: namlik.frame.maxX + 30, y: 3, width: 30, height: self.frame.height - 6))
        if #available(iOS 13.0, *) {
            temperaturaicon.image = UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal)
        } else {
            // Fallback on earlier versions
        }
        temperaturaicon.contentMode = .scaleAspectFill
        temperaturaicon.clipsToBounds = true
        self.addSubview(temperaturaicon)
        
        temperaturaCount = UILabel(frame: CGRect(x: temperaturaicon.frame.maxX + 50, y: 3, width: 30, height: self.frame.height-6))
        temperaturaCount.text = "22°"
        temperaturaCount.textColor = .white
        temperaturaCount.font = .systemFont(ofSize: 16, weight: .medium)
        self.addSubview(temperaturaCount)
        
        
        
        
        
        
    }
}
