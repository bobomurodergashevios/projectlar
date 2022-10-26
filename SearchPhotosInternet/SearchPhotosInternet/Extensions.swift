//
//  Extensions.swift
//  SearchPhotosInternet
//
//  Created by Bobomurod Ergashev on 02/10/22.
//

import Foundation
import UIKit

let sectionTitles : [String] = ["Today's weather information ","6 - day forecast"]

extension UIImage {
    var originalmode: UIImage {
        return withRenderingMode(.alwaysTemplate)
        }
}


extension TestViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 6
        }else if section == 0{
            return 1
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section != 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath)
            cell.backgroundColor = .blue.withAlphaComponent(0.2)
            cell.selectionStyle = .none
            return cell
//            return UITableViewCell()
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Section2TableviewcellTableViewCell.identifier, for: indexPath)
            cell.backgroundColor = .blue.withAlphaComponent(0.2)
            cell.selectionStyle = .none
            return cell
        }
     
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return sectionTitles[section].uppercased()
        }else{
            return sectionTitles[section].lowercased()
        }
        
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else{return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x+20, y: header.bounds.origin.y, width: 400, height: header.bounds.height)
        header.textLabel?.textColor = .black
        header.backgroundColor = .red
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 40
        }else{
            return 100
        }
        
    }
    
   
}

