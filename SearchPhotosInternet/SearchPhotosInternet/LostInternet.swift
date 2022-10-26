
//  LostInternet.swift
//  SearchPhotosInternet

//  Created by Bobomurod Ergashev on 03/10/22.


import UIKit
import Lottie

let windowWidth = UIScreen.main.bounds.width
let windowHeight = UIScreen.main.bounds.height

class LostInternet: UIViewController {
    var mode: Mode = .noInternet

    var animationView : AnimationView!
     
     var button : UIButton!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         self.initViews()
     }
     
    
    
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         NotificationCenter.default.addObserver(self, selector: #selector(onConnected), name: .onConnectedToInternet, object: nil)
         
         NotificationCenter.default.addObserver(self, selector: #selector(onNotConnected), name: .onLostConnectedToInternet, object: nil)
         
         self.navigationController?.setNavigationBarHidden(true, animated: true)
         
     }
    
   
    
    func initViews(){
        
        self.updateAnimation()
                
                button = UIButton(frame: CGRect(x: 30, y: self.animationView.frame.maxY + 50, width: windowWidth - 60, height: 48))
                button.backgroundColor = .blue
                button.addTarget(self, action: #selector(onButton(_ :)), for: .touchUpInside)
                button.setTitle("Go back", for: .normal)
                button.layer.cornerRadius = 12
                
                self.view.addSubview(button)
                
        
    }

    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         self.animationView.play()
     }
    
    
    func updateAnimation() {
           if let anim = self.animationView, nil != anim.superview {
               self.animationView.removeFromSuperview()
           }
           self.animationView = AnimationView(name: self.mode == .noInternet ? "no-internet" : "connected")
        self.animationView.frame = CGRect(x: 0, y: (windowHeight - windowWidth)/2, width: windowWidth, height: windowWidth)
               self.animationView.loopMode = .loop
               self.view.addSubview(self.animationView)
               self.animationView.play()
           
    }

    @objc func onButton(_ sender: UIButton) {
        print("tapped \(self.mode)")
        if self.mode == .connected {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        
    @objc func onConnected() {
            self.mode = .connected
            self.updateAnimation()
            self.button.backgroundColor = .yellow
       
    }

    @objc func onNotConnected() {
           self.mode = .noInternet
           self.updateAnimation()
           self.button.backgroundColor = .red
       }


}
enum Mode {
        case noInternet
        case connected
    }


extension Notification.Name {
    static let onConnectedToInternet = Notification.Name("on_connected_internet")
    static let onLostConnectedToInternet =  Notification.Name("on_not_connected_internet")
}
