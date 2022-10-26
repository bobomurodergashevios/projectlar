//
//  BaseViewController.swift
//  RickandMortyAPI_Project
//
//  Created by Bobomurod Ergashev on 05/10/22.
//

import UIKit
import SwiftyJSON
import ExpandableCell

class BaseViewController: UIViewController {
   
    
    
    
    
    
    var allVidjets : [ModelVidjet] = [ModelVidjet]()
     var faolVidjetlar : [ModelVidjet] = [
        ModelVidjet(mode: .faol, title: "Mobil aloqa uchun tulovlar", rightbtn: .faol, leftImage: .faol),
        ModelVidjet(mode: .faol, title: "Servislar", rightbtn: .faol, leftImage: .faol),
        ModelVidjet(mode: .faol, title: "Saqlangan tulovlar", rightbtn: .faol, leftImage: .faol),
        ModelVidjet(mode: .faol, title: "Amaliyotlarim ", rightbtn: .faol, leftImage: .faol)
    ]
    
    var mavjudVidjetlar : [ModelVidjet] = [
        ModelVidjet(mode: .mavjud, title: "Takliflar", rightbtn: .mavjud, leftImage: .mavjud),
        ModelVidjet(mode: .mavjud, title: "Lifehacklar", rightbtn: .mavjud, leftImage: .mavjud),
    ]
    
    
    var label : UILabel!
    private var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        self.allVidjets.append(contentsOf: faolVidjetlar)
        self.allVidjets.append(contentsOf: mavjudVidjetlar)
        initviews()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    


    
    func initviews() {
        
        label = UILabel(frame: CGRect(x: 20, y: 150, width: view.frame.width, height: 50))
        label.text = "Ilova asosiy oynasidagi vidjetlarni tartiblash"
        view.addSubview(label)
        self.tableView = UITableView(frame: CGRect(x: 0, y: label.frame.maxY+1, width: self.view.frame.width, height: self.view.frame.height), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        tableView.tableHeaderView = header
            
        
       
        
        
        
    }


}
extension BaseViewController : UITableViewDelegate,UITableViewDataSource {
//    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
////    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        <#code#>
////    }
//    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
//        <#code#>
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return faolVidjetlar.count
        }else{
            return mavjudVidjetlar.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = CustomTableViewVidjetCell(data: faolVidjetlar,index: indexPath, style: .default, reuseIdentifier: "CustomTableViewVidjetCell")
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = CustomTableViewVidjetCell(data: mavjudVidjetlar,index: indexPath, style: .default, reuseIdentifier: "CustomTableViewVidjetCell")
            return cell
        }
       
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Faol Vidjetlar"
        }else{
            return "Mavjud Videjetlar"
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0{
        if indexPath.section == 0{
            var q = self.faolVidjetlar.remove(at: indexPath.row)
            q.leftImage = .mavjud
            q.rightbtn = .mavjud
            q.mode = .mavjud
            self.mavjudVidjetlar.append(q)
            
            tableView.reloadData()
        }else{
            var q = self.mavjudVidjetlar.remove(at: indexPath.row)
            q.leftImage = .faol
            q.rightbtn = .faol
            q.mode = .faol
            self.faolVidjetlar.append(q)
            
            tableView.reloadData()
        }
           
//        }
    }
}




struct ModelVidjet {
    var mode : Mode
    var title : String
    var rightbtn : btnMode
    
    var leftImage : imageMode
    enum Mode {
        case faol
        case mavjud
    }
    enum btnMode {
        case faol
        case mavjud
        
        var btn : String {
            switch self {
            case .faol:
                return "iks"
            case .mavjud:
                return "minus"
            }
        }
        
    }
    enum imageMode{
        case faol
        case mavjud
        var img : String {
            switch self {
            case .faol:
                return "bor"
            case .mavjud:
                return ""
            }
        }
    }
}
