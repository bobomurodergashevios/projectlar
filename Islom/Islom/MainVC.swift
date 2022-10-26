//
//  MainVC.swift
//  Islom
//
//  Created by Bobomurod Ergashev on 12/09/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainVC: UIViewController {
    
    var characters:[CharacterDM] = []
    
    let tableView : UITableView = {
        let table = UITableView()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.uinib(), forCellReuseIdentifier: TableViewCell.identifier)
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        
        tableView.backgroundView?.backgroundColor = .red
        getCharacters()
    }
    
    func getCharacters() {
            AF.request("https://rickandmortyapi.com/api/character", method: .get).response { response in
                if let data = response.data {
                    let json = JSON(data)
                    for d in json["results"].arrayValue {
                        self.characters.append(CharacterDM(json: d))
                    }
                    print("------>", self.characters)
                    self.tableView.reloadData()
                }
            }
        }
}

//MARK: - Table View
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(character: characters[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
