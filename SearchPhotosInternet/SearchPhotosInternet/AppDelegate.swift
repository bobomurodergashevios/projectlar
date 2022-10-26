//
//  AppDelegate.swift
//  SearchPhotosInternet
//
//  Created by Bobomurod Ergashev on 01/10/22.
//

import UIKit
let appdelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var navigationController : UINavigationController!
    
    
    var window: UIWindow?
    
    
    var reachability : Reachability?
    private var hostIndex = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
      
        self.route(.main)
        self.startHost(at: 0)
        
        return true
    }

    
    
    func route(_ destination : ApplicationRoute){
        switch destination {
        case .main:
            self.navigationController = UINavigationController(rootViewController: TestViewController())
            window?.rootViewController = navigationController
        case .login:
            break
        case .lostInternet:
            if !self.navigationController.hasOpenedLostConnection() {

               
                self.navigationController.pushViewController(LostInternet(), animated: true)

            }
        }
    }


}


enum ApplicationRoute {
    case main
    case login
    case lostInternet
}


extension AppDelegate{
    func startHost(at index:Int){
        self.stopNotifier()
        self.setupReachability(HOST_NAMES[index],useClosures: true)
        self.startNotifier()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
            self.startHost(at: (index+1)%3)
        }
    }
    func setupReachability(_ hostName: String?, useClosures: Bool) {
          
          if let hostName = hostName {
              reachability = Reachability(hostname: hostName)
              
          } else {
                       reachability = Reachability()
             
                   }
                   
                   if useClosures {
                       reachability?.whenReachable = { reachability in
                           self.updateLabelColourWhenReachable(reachability)
                           //close
                         
                           NotificationCenter.default.post(.init(name: .onConnectedToInternet))
                       }
                       reachability?.whenUnreachable = { reachability in
                           self.updateLabelColourWhenNotReachable(reachability)
                           //open
                           //                self.stopNotifier()
                           self.route(.lostInternet)
                                          // NotificationCenter.default.post(name: .onLostConnectToInternet, object: nil)
                                       }
                                   } else {
                                       NotificationCenter.default.addObserver(
                                           self,
                                           selector: #selector(reachabilityChanged(_:)),
                                                            name: .reachabilityChanged,
                                                            object: reachability
                                                        )
                                                    }
                                                }

    func startNotifier(){
           do {try reachability?.startNotifier()}
           catch{print("Unable to start")
               return
           }
       }
       func stopNotifier() {
               //        print("--- stop notifier")
               reachability?.stopNotifier()
               NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
               self.reachability = nil
           }
    func updateLabelColourWhenReachable(_ reachability: Reachability) {
                //        print("\(reachability.description) - \(reachability.connection)")
                if reachability.connection == .wifi {
                                print(reachability.connection)
                } else {
                    print(reachability.connection)
                }
            }
            
    func updateLabelColourWhenNotReachable(_ reachability: Reachability) {
                    
                    print(reachability.connection)
        }
        
        @objc func reachabilityChanged(_ note: Notification) {
            let reachability = note.object as! Reachability
            if reachability.connection != .none {
                updateLabelColourWhenReachable(reachability)
            } else {
                updateLabelColourWhenNotReachable(reachability)
            }
        }
        
    }



extension UINavigationController {
    
    func hasOpenedLostConnection() -> Bool {
        var has: Bool = false
        for controller in self.viewControllers {
            if nil != controller as? LostInternet {
                has = true
            }
        }
        return has
    }
    
}
