//
//  RememberViewController.swift
//  takrorlash
//
//  Created by Bobomurod Ergashev on 30/07/22.
//

import UIKit
let windowwidth = UIScreen.main.bounds.width
let windowheight = UIScreen.main.bounds.height

class RememberViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
  
    private var x = 0
    private var tableview : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .magenta
        
        self.initviews()
        setNavigationBar()
        self.navigationItem.title = "Contact" // navigationbarni titlei
//        self.navigationController?.isNavigationBarHidden = true // nvigationbarni yuq qiladi
        
    }
    
    func initviews(){
      tableview = UITableView(frame: CGRect(x: 0, y: 0, width: windowwidth, height: windowheight))
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(CustomTVC.self, forCellReuseIdentifier: "CustomTVC")
        
    
        view.addSubview(tableview)
        
        
        let vc1 = BIRViewController()
        let vc2 = IKKIViewController()
        
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTVC(name: "Bobomurod", phone: "055")
        return cell

    }
    
    
    
    // MARK: SetNavigationBar
    func setNavigationBar(){
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .red
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
            self.navigationController?.navigationBar.compactAppearance = appearance
        }
        
    }

    
    
 
    
}


class CustomTVC:UITableViewCell{
    var name: String
    var phone: String
    
    init(name: String,phone:String) {
       
        self.name = name
        self.phone = phone
        super.init(style: .default, reuseIdentifier: "CustomTVC")
        self.initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews(){
        let baseview = UIView(frame: CGRect(x: 0, y: 0, width: windowwidth, height: 80))
//        baseview.backgroundColor = .red
        contentView.backgroundColor = .clear
        
        self.contentView.addSubview(baseview)
        let lbl = UILabel(frame: CGRect(x: 20, y: 0, width: 80, height: 40))
        lbl.text = self.name
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 21)
        baseview.addSubview(lbl)
        
    }
   
    
}
