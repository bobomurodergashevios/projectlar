//
//  ViewController.swift
//  extensionandvahokazooo
//
//  Created by Bobomurod Ergashev on 02/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(test(key: "A"))

    }

    func test(key: String)->[String]{
        var arr = [String]()
        var newarr = [String]()
        let list = ["Abdulla Qahhor",
                            "Shukur Burxonov",
                            "Abdulla oripov",
                            "Otkir Muhammadiy",
                            "Muhammad Yusuf",
                            "Yunus Rajabiy",
                            "Alisher Navoiy",
                            "Leonardo da-Vinchi"]
        
        
        for item in list{
            if item.lowercased().starts(with: key){
                arr.append(item)
            }else{
                newarr.append(item)
            }
            
        }
        arr.append(contentsOf: newarr)
        return arr
        
    }
}





