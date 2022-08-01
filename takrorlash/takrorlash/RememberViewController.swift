//
//  RememberViewController.swift
//  takrorlash
//
//  Created by Bobomurod Ergashev on 30/07/22.
//

import UIKit
let windowwidth = UIScreen.main.bounds.width
let windowheight = UIScreen.main.bounds.height

class RememberViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private var tableview : UITableView!
    private var cellarr = [UITableViewCell]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .magenta
        
        self.initviews()

    }
    
    func initviews(){
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: windowwidth, height: windowheight))
        tableview.separatorStyle = .none
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {1}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell")
        cell.accessoryType = .checkmark
        cell.selectionStyle = .blue
        cell.textLabel?.text = "Apple"
        cell.textLabel?.textColor = .black
        cell.detailTextLabel?.text = "Olma"
        cellarr.append(cell)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delaction = UITableViewRowAction(style: .destructive, title: "delete") { action, path in
            self.cellarr.remove(at: indexPath.row)
            print(self.cellarr.remove(at: indexPath.row))
        }
        return [delaction]
    }
}


class CustomTVC:UITableViewCell{
    var name: String
    var phone: String
    
    init(name: String,) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
