//
//  RegistrationController.swift
//  Twitter Clone
//
//  Created by Bobomurod Ergashev on 25/08/22.
//



import UIKit


class RegistrationViewController : UIViewController {
    //MARK: PROP
    
    //MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: SELECTORS
    //MARK: HELPERS
    
    func configureUI(){
        self.view.backgroundColor = .twitterBlue
    }
}
