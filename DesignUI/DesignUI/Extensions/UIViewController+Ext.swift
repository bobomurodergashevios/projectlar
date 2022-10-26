//
//  UIViewController+Ext.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 19/09/22.
//

import UIKit



extension LeftSideMenuViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = CustomTableviewCellTableViewCell(style: .value1, reuseIdentifier: "CustomTableviewCellTableViewCell", indexPath: indexPath)
        cell.accessoryType = .disclosureIndicator
        if indexPath.row == 2{
            let switchview = UISwitch()
            switchview.isOn = true

//            switchview.addTarget(self, action: #selector(onOffSwitch), for: .allEvents)
            cell.accessoryView = switchview
        }
       
        return cell
       
        
    }
    
   
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        30
//    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Hello"
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 5 {
            SharedManager.logout()
            appdelegate.route(.login)
        }
    }
    
}



