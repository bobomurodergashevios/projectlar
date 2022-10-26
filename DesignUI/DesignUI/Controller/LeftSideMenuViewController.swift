//
//  LeftSideMenuViewController.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 18/09/22.
//

import UIKit
let winw : CGFloat = UIScreen.main.bounds.width
class LeftSideMenuViewController: UIViewController {
    private var tableview : UITableView!
    var vc = RegistrationViewController()
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle  {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.initViews()
        
//        APICaller.shared.getTrendingMovies { result in
//            
//        }
//        fetchData()
    }
    
//    func fetchData(){
//        APICaller.shared.getTrendingMovies { results in
//                   switch results {
//                   case .success(let movies):
//                       print(movies)
//                   case .failure(let error):
//                       print(error)
//                   }
//               }
//    }
    func initViews(){
        
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: winw, height: 200))
//        topView.backgroundColor = UIColor.rgb(red: 37, green: 49, blue: 109)
        view.addSubview(topView)
    
//        let grad = CAGradientLayer()
//        grad.frame = topView.bounds
//        grad.colors = [UIColor.blue.cgColor,UIColor.red.cgColor]
//        grad.startPoint = CGPoint(x: 0.0, y: 0.5)
//        grad.endPoint = CGPoint(x: 0.9, y: 0.5)
//        topView.layer.addSublayer(grad)
        
        let topViewLogo = HeaderImageView(frame: CGRect(x: 0, y: 0, width: topView.frame.width, height: topView.frame.height))
        
                                          
        
            topView.addSubview(topViewLogo)
        
        
        

        
        let darkModeImg = UIImageView(frame: CGRect(x: topViewLogo.frame.maxX + 150, y: 50, width: 30, height: 30))
        darkModeImg.image = UIImage(named: "sun")
        darkModeImg.clipsToBounds = true
        darkModeImg.contentMode = .scaleAspectFit
        topView.addSubview(darkModeImg)
        
        let namelabel = UILabel(frame: CGRect(x: 16, y: topViewLogo.frame.maxY + 10, width: winw/2, height: 40))
        namelabel.text = "Unknown user"
        namelabel.textColor = .white
        namelabel.font = .systemFont(ofSize: 19)
        topViewLogo.addSubview(namelabel)
//        
        
        let signupbtn = UIButton(frame: CGRect(x: namelabel.frame.maxX + 15, y: 163, width: 80, height: 30))
        signupbtn.setTitle("SignUp", for: .normal)
//        signupbtn.backgroundColor = .white
        signupbtn.layer.borderColor = UIColor.white.cgColor
        signupbtn.layer.borderWidth = 2
        signupbtn.setTitleColor(.white, for: .normal)
        signupbtn.layer.cornerRadius = 8
        signupbtn.titleLabel?.font = .systemFont(ofSize: 16)
        topViewLogo.addSubview(signupbtn)
        signupbtn.addTarget(self, action: #selector(onSignup), for: .touchUpInside)
        
        
        
        tableview = UITableView(frame: CGRect(x: 0, y: topViewLogo.frame.height, width: winw-80, height: view.frame.height-100))
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(CustomTableviewCellTableViewCell.self, forCellReuseIdentifier: "CustomTableviewCellTableViewCell")

        view.addSubview(tableview)
        
        
        
//        let viewww = UIView(frame: CGRect(x: 0, y: 0, width: self.tableview.frame.width, height: self.tableview.frame.height))
//        viewww.backgroundColor = .yellow
//        tableview.tableHeaderView = viewww
        
//        let footerview = UIView(frame: CGRect(x: 0, y: self.tableview.frame.maxY + 170 , width: winw+10, height: 100))
//        footerview.backgroundColor = .yellow
//
//        tableview.tableFooterView = footerview
//
        let lab = UILabel(frame: CGRect(x: 20, y: 220, width: winw-40, height: 30))
        lab.text = "Version  1.0.3"
        lab.font = .systemFont(ofSize: 12)
        lab.textColor = .black
//        footerview.addSubview(lab)
                          
        
        
    }

    @objc func onSignup(){
        self.navigationController?.pushViewController(RegistrationViewController(), animated: true)
//        vc.conflik = { strr in
//            print(strr)
//
//        }
//        print("Ddddd")
    }

    

}


