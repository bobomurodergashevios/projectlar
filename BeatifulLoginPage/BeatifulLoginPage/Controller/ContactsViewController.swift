//
//  MyClassViewController.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 04/08/22.
//

import UIKit

class ContactsViewController: UIViewController {

    var tableview : UITableView!
    
    private var searchhgh : CGFloat = 110
    
    private var floatingbtn : UIButton!
    
     var newcontactlist = [Mcontact]()

//    private var editContact : ((Mcontact) -> Void?)
     var contactlist = [
        Mcontact(name: "Muhriddinbek", phone: "+999999999"),
        Mcontact(name: "Bobomurod", phone: "+998947849492"),
        Mcontact(name: "Abdulla", phone: "+54677674383"),
        Mcontact(name: "Polvon", phone: "+123223424"),
        Mcontact(name: "Abdulaziz", phone: "+438988903"),
        Mcontact(name: "Muhammadamin", phone: "+9885938981"),
        Mcontact(name: "Fozil", phone: "+99378479492"),
        Mcontact(name: "Madina", phone: "+9091029290"),
        Mcontact(name: "Samandar", phone: "+984398894"),
        Mcontact(name: "Amirbek", phone: "+123122111"),
        Mcontact(name: "Yulduz", phone: "+920129020")
    ]
    static var arr = [Mcontact]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.initViews()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func initViews(){
        ContactsViewController.arr.append(contentsOf: contactlist)
        let searchbar = UIView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: 110))
        searchbar.backgroundColor = .purple
        let inputview = UIView(frame: CGRect(x: 20, y:searchbar.frame.height - 54, width: windowWidth - 40, height: 44))
        inputview.backgroundColor = .white
        inputview.layer.cornerRadius = 22
        searchbar.addSubview(inputview)
        
        
        let textfield = UITextField(frame: CGRect(x: 16, y: 0, width: inputview.frame.width - 48, height: inputview.frame.height))
        textfield.textColor = .black
        textfield.font = .systemFont(ofSize: 18)
        inputview.addSubview(textfield)
        textfield.addTarget(self, action: #selector(onTextChanged(_:)), for: .allEditingEvents)
        
        
        let searchBtn = UIButton(frame: CGRect(x: textfield.frame.maxX - 10 , y: 0, width: 20, height: inputview.frame.height))
        searchBtn.setImage(UIImage(named: "search"), for: .normal)
        inputview.addSubview(searchBtn)
        
        inputview.addSubview(searchBtn)
        view.addSubview(searchbar)
        
        self.initTable()
        
        let button = UIButton(frame: CGRect(x: windowWidth - 95, y: windowHeight - 100, width: 70, height: 70))
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 35
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .btnColor
        button.addTarget(self, action: #selector(onPlusBtnPressed), for: .touchUpInside)
        view.addSubview(button)
        
        
        
    }

    
    private func initTable(){
        self.tableview = UITableView(frame: CGRect(x: 0, y: searchhgh + 10, width: windowWidth, height: windowHeight - searchhgh))
        self.tableview.delegate = self
        self.tableview.dataSource = self
        tableview.separatorStyle = .none
        view.addSubview(tableview)
    }
}



struct Mcontact{
    var name: String
    var phone: String
//    var state: SelectionStyle = .unselected
   
}



enum SelectionStyle{
    
    case selected
    case unselected

    
    
    
    var bacColor: UIColor{
        switch self {
        case .selected: return .btnColor
        case .unselected: return .clear
        }
        
        
        var titleColor: UIColor{
            switch self {
            case .selected: return .white
            case .unselected: return .labelTextColor
            }
    }
}
}
