//
//  FavouritosViewController+Extension.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 08/08/22.
//

import Foundation
import UIKit


extension FavouritosViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return FavouritosViewController.favarr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.text = FavouritosViewController.favarr[indexPath.row].name
        cell.detailTextLabel?.text = FavouritosViewController.favarr[indexPath.row].phone
        cell.accessoryType = .detailButton
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: onTrailingAction(indexPath))
    }
    
    func onTrailingAction(_ indexPath: IndexPath) -> [UIContextualAction]{
        let delete = UIContextualAction(style: .destructive, title: "delete") { _, _, _ in
            FavouritosViewController.favarr.remove(at: indexPath.row)
            FavouritosViewController.tableview.reloadData()
        }
        return [delete]
    }
    
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: onLeadingAction(indexPath))
    }
    
    func onLeadingAction(_ indexPat: IndexPath) -> [UIContextualAction]{
        let editAction = UIContextualAction(style: .normal, title: "edit") { _, _, _ in
            let alert = UIAlertController(title: "Edit", message: "Contact", preferredStyle: .alert)
            alert.addTextField { nametxt in
                nametxt.placeholder = "Name: "
            }
            alert.addTextField { phonetxt in
                phonetxt.placeholder = "Phone: "
            }
            
            self.present(alert, animated: true)
            
            
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                FavouritosViewController.favarr[indexPat.row].name = alert.textFields?[0].text ?? ""
                FavouritosViewController.favarr[indexPat.row].phone = alert.textFields?[1].text ?? ""
                FavouritosViewController.tableview.reloadData()
                
            }
            let cancelBtn = UIAlertAction(title: "Cancel", style: .default) { _ in
                
            }
            alert.addAction(okAction)
            alert.addAction(cancelBtn)
        }
        return [editAction]
    }
    
}
