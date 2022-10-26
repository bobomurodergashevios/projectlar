//
//  FavouritosViewController.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 08/08/22.
//

import UIKit

class FavouritosViewController: UIViewController{

    static var favarr = [Mcontact]()

    static var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favouritos"
        view.backgroundColor = .white
        initviewss()
    }
 
    func initviewss(){
        
        initTable()
        
        
    }
    func initTable(){
        FavouritosViewController.tableview = UITableView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight))
        FavouritosViewController.tableview.delegate = self
        FavouritosViewController.tableview.dataSource = self
        view.addSubview(FavouritosViewController.tableview)
    }
    
}
