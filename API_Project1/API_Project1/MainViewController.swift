//
//  MainViewController.swift
//  API_Project1
//
//  Created by Bobomurod Ergashev on 14/09/22.
//

import UIKit
import Alamofire
import SwiftyJSON
let windowwidth : CGFloat = UIScreen.main.bounds.width
let windowheight : CGFloat = UIScreen.main.bounds.height

class MainViewController: UIViewController {

    let url : String = "https://rickandmortyapi.com/api/character"
    
    private var tableview : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        initviews()
        getData()
    }
    
    func initviews(){
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: windowwidth, height: windowheight))
        tableview.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
    }
    var characters = [CharacterDM]()
    
    func getData(){
        AF.request(url, method: .get).response { response in
            if let data = response.data {
                let json = JSON(data)
                for d in json["results"].arrayValue{
                    self.characters.append(CharacterDM(json: d))
                }
            }
            self.tableview.reloadData()
        }
    }
}
extension MainViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else{return UITableViewCell()}
        
//        return CustomTableViewCell(frame: CGRect(x: 0, y: 0, width: windowwidth, height: windowheight))
        cell.updateCell(character: characters[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
