//
//  MyClassVC+Extension.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 05/08/22.
//

import UIKit




extension ContactsViewController: UITableViewDelegate,UITableViewDataSource{
   
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactsViewController.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "UITableViewCell")
        cell.contentView.backgroundColor = .clear
        cell.selectionStyle = .default
     
        cell.textLabel?.text = ContactsViewController.arr[indexPath.row].name
            cell.detailTextLabel?.text = ContactsViewController.arr[indexPath.row].phone
       
     
//
       
        cell.selectionStyle = .default
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    // MARK: SYSTEM EDIT BEGIN
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let delAction = UITableViewRowAction(style: .default, title: "delete") { action, path in
//            self.contactlist.remove(at: indexPath.row)
//            tableView.reloadData()
//        }
//        let editAction = UITableViewRowAction(style: .normal, title: "edit") {action, path in
//
//
//            let alert = UIAlertController(title: "nima", message: "vfbhj", preferredStyle: .alert)
//            alert.addTextField { nametx in
//                nametx.placeholder = "Username:"
//            }
//            alert.addTextField{ phoneTx in
//              phoneTx.placeholder = "PhoneNumber:"
//            }
//            let act = UIAlertAction(title: "OK", style: .default) { action in
//                self.contactlist[indexPath.row].name = alert.textFields![0].text ?? ""
//                self.contactlist[indexPath.row].phone = alert.textFields![1].text ?? ""
//                self.tableview.reloadData()
//            }
//            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
//                print("cancel")
//            }
//            alert.addAction(act)
//            alert.addAction(cancel)
//            self.present(alert, animated: true)
//
//
//        }
//        return [delAction,editAction]
//    }
    // MARK: SYSTEM EDIT END
    
    
    
    
    // MARK: CUSTOM EDIT BEGIN
    // MARK: CHAPDAN UNGGA:
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: listOfLeadingActions(indexPath))
    }
    
    func listOfLeadingActions(_ indexPath: IndexPath) -> [UIContextualAction]{
        let call = UIContextualAction(style: .destructive, title: "call") { action, view, callback in
            self.callTo(ContactsViewController.arr[indexPath.row].phone)
        }
        call.backgroundColor = .purple
        call.image = UIImage(named: "call")
        
        
        let addFav = UIContextualAction(style: .destructive, title: "add") { _, _, _ in
            if FavouritosViewController.favarr.sear(Mcontact(name: ContactsViewController.arr[indexPath.row].name, phone: ContactsViewController.arr[indexPath.row].phone)){
                FavouritosViewController.favarr.append(Mcontact(name: ContactsViewController.arr[indexPath.row].name, phone: ContactsViewController.arr[indexPath.row].phone))
                FavouritosViewController.tableview?.reloadData()
            }else{
             return
            }
   
            
//            print(FavouritosViewController.favarr)
        }
        addFav.image = UIImage(named: "star")
        return [call,addFav]
    }
    
    
    
    
    
    
    func callTo(_ phone: String){
        if let url = URL(string: "tel://\(phone)"),
           UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
    
    
    
    
    
    
    // MARK: UNGDAN CHAPGA
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: trailingOfLeadingActions(indexPath))
    }
    
    
    func trailingOfLeadingActions(_ indexpath: IndexPath)->[UIContextualAction]{
        let delete = UIContextualAction(style: .destructive, title: "delete") { action, view, callback in
            ContactsViewController.arr.remove(at: indexpath.row)
            self.tableview.reloadData()
            print(indexpath.row)
        }
        delete.backgroundColor = .purple
        let edit = UIContextualAction(style: .normal, title: "edit") { act, view, callback in
            let alert = UIAlertController(title: "edit", message: "Contact", preferredStyle: .alert)
            alert.addTextField { name in
                name.placeholder = "Name: "
            }
            alert.addTextField { phone in
                phone.placeholder = "Phone: "
            }
            let okBtn = UIAlertAction(title: "OK", style: .default) { act in
                ContactsViewController.arr[indexpath.row].name = alert.textFields?[0].text ?? ""
                ContactsViewController.arr[indexpath.row].phone = alert.textFields?[1].text ?? ""
                self.tableview.reloadData()
            }
            self.present(alert, animated: true)
            let cancelBtn = UIAlertAction(title: "CANCEL", style: .cancel) { _ in
                
            }
            alert.addAction(cancelBtn)
            alert.addAction(okBtn)

        }
        return [delete,edit]
    }
    //MARK: CUSTOM EDIT END
    
    
    
    
    
    
    @objc func onPlusBtnPressed(){
        let alert = UIAlertController(title: "Add", message: "Contact", preferredStyle: .alert)
        
        alert.addTextField { userTxtfd in
            userTxtfd.placeholder = "User:"
        }
        alert.addTextField { phone in
            phone.placeholder = "Phone:"
        }
        present(alert, animated: true)
        let addContactAction = UIAlertAction(title: "Add", style: .default) { action in

            ContactsViewController.arr.append(Mcontact(name: alert.textFields![0].text ?? "", phone: alert.textFields![1].text ?? ""))
            self.tableview.reloadData()

        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print("cancel")
        }
        alert.addAction(addContactAction)
        alert.addAction(cancel)
    }
    
    
    @objc func onTextChanged(_ textfield: UITextField){

        var text = textfield.text ?? ""
        ContactsViewController.arr = self.contactlist.search(key: text)
        self.tableview.reloadData()
        
    }
}


