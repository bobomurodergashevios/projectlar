//
//  TableviewControllerTableViewController.swift
//  CollectionVC
//
//  Created by Bobomurod Ergashev on 21/08/22.
//

import UIKit

class TableviewControllerTableViewController: UIViewController {
    var tableView : UITableView!
    var contactlist = [Mcontact]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TableViewController"
        initContacts()
        self.initviews()
    }
    func initContacts(){
        contactlist.append(Mcontact(name: "Bobomurod Ergashev", phone: "+998991332232"))
        contactlist.append(Mcontact(name: "Ilhomjon Akramov", phone: "+998912334888"))
        contactlist.append(Mcontact(name: "Abdulla Bardiyev", phone: "+9989909889988"))
        contactlist.append(Mcontact(name: "Mamat Sultonov", phone: "+998991330032"))
        contactlist.append(Mcontact(name: "Jamshid Kattayev", phone: "+9989974992302"))
        contactlist.append(Mcontact(name: "Feruz Jurayev", phone: "+9989932009900"))
        contactlist.append(Mcontact(name: "Elmurod Javlonov", phone: "+998901234567"))
        contactlist.append(Mcontact(name: "Qosim Nazarov", phone: "+998943443434"))

    }
    func initviews(){
        
        self.inittable()
    }
    
    
    func inittable(){
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        view.addSubview(tableView)
    }
}

extension TableviewControllerTableViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactlist.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.initView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: 100), contact: contactlist[indexPath.row])
        cell.selectionStyle = .none
        cell.backgroundColor = .cyan
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

struct Mcontact{
    var name: String
    var phone:String
}
