//
//  LeftMenuViewController.swift
//  RickandMortyAPI_Project
//
//  Created by Bobomurod Ergashev on 07/10/22.
//

import UIKit

let winw : CGFloat = UIScreen.main.bounds.width
class LeftMenuViewController: UIViewController {

    
    private var tableview : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        initviews()
    }
    

    func initviews(){
        var topViewLogo = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        topViewLogo.backgroundColor = .purple
        tableview = UITableView(frame: CGRect(x: 0, y: topViewLogo.frame.height, width: winw, height: view.frame.height-100))
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")

        view.addSubview(tableview)
    }

}

extension LeftMenuViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        if indexPath.row == 2{
            let switchview = UISwitch()
            switchview.isOn = true

            cell.textLabel?.text = "Vidjet setting"
//            switchview.addTarget(self, action: #selector(onOffSwitch), for: .allEvents)
            cell.accessoryView = switchview
            return cell
        }else if indexPath.row == 1{
            cell.textLabel?.text = "Brendlar"
            return cell
        }
        else{
            cell.textLabel?.text = "Setting"
            return cell
        }
      
       
        
    }
    
   
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            self.navigationController?.pushViewController(BaseViewController(), animated: true)
        }else if indexPath.row == 1{
            self.navigationController?.pushViewController(BrandsViewController(), animated: true)
        }else{
            self.navigationController?.pushViewController(MapViewController(), animated: true)
        }
    }


/*
 //
 //  CustomTableviewCellTableViewCell.swift
 //  DesignUI
 //
 //  Created by Bobomurod Ergashev on 25/09/22.
 //

 import UIKit

 import Lottie

 class CustomTableviewCellTableViewCell: UITableViewCell {

     var indexPath : IndexPath!
  
    
     var animationView : AnimationView!
     var anims : [String] = ["privacy","lowinternet","language","setting","info","logout"]
     var datalist: [Model] = [
         Model(name: "Privacy and Security", mode: .right, anim: "privacy"),
         Model(name: "Notifications", mode: .right,anim: "lowinternet"),
         Model(name: "Languages", mode: .right, anim: "language"),
         Model(name: "Settings", mode: .info, anim: "setting"),
         Model(name: "App Info", mode: .info,anim: "info"),
         Model(name: "Log out", mode: .right,anim: "logout")
     ]
     

     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)
     }
     
     
     init(style: UITableViewCell.CellStyle, reuseIdentifier: String?,indexPath: IndexPath) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         self.indexPath = indexPath
         self.initviews()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     
     
     func initviews(){
         
 //        for anim in self.anims {
 //
 //            self.animationView = AnimationView(name: "language")
 //
 //            animationView.frame = CGRect(x: 3, y: 5, width: 30, height: self.frame.height - 10)
 //            animationView.loopMode = .loop
 //            animationView.play()
 //    //        animationView.backgroundColor = .red
 //            self.addSubview(animationView)
 //
 //        }
        
         
         self.animationView = AnimationView(name: "language")
        
         animationView.frame = CGRect(x: 3, y: 5, width: 30, height: self.frame.height - 10)
         animationView.loopMode = .loop
         animationView.play()
            //        animationView.backgroundColor = .red
         self.addSubview(animationView)
         
         let labelSetting = UILabel(frame: CGRect(x: animationView.frame.maxX + 6, y: 5, width: 200, height: self.frame.height - 10))
         labelSetting.text = datalist[self.indexPath.row].name
         labelSetting.textColor = .black
         labelSetting.font = .systemFont(ofSize: 19)
         self.addSubview(labelSetting)
         
         
         
         
         
         
     }
     
 }

 */
}
