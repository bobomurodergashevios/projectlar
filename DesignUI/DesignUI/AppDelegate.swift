//
//  AppDelegate.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 17/09/22.
//

import UIKit
import AKSideMenu
let winwidth : CGFloat = UIScreen.main.bounds.width
let appdelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
@main
class AppDelegate: UIResponder, UIApplicationDelegate, AKSideMenuDelegate {

    var window: UIWindow?
    var navigationController : UINavigationController!
//    var reachability:Reachability?
    var hostIndex = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.route(.main)
        
        if SharedManager.getState() == .registered{
            self.navigationController = UINavigationController(rootViewController: LeftMenuControllerViewController())
        }else{
            self.navigationController = UINavigationController(rootViewController: SignINViewController())
        }
        return true
    }
    
    private func configureSideMenu() {
        let sideMenu = AKSideMenu(contentViewController: LeftMenuControllerViewController(), leftMenuViewController: LeftSideMenuViewController(), rightMenuViewController: nil)
        sideMenu.delegate = self
        sideMenu.contentViewShadowEnabled = true
        sideMenu.scaleContentView = false
        sideMenu.contentViewShadowColor = UIColor.rgb(red: 37, green: 49, blue: 109)
        sideMenu.contentViewShadowOffset = CGSize(width: 0, height: 0)
        sideMenu.contentViewShadowRadius = 5
        sideMenu.contentViewShadowOpacity = 0.9
        sideMenu.scaleMenuView = true
        sideMenu.scaleBackgroundImageView = true
        sideMenu.contentViewInPortraitOffsetCenterX = 120
        window?.rootViewController = UINavigationController(rootViewController: sideMenu)
        
    }
    
    func route(_ destination : ApplicationRoute){
        switch destination {
        case .main:
            self.configureSideMenu()
        case .login:
            self.navigationController = UINavigationController(rootViewController: SignINViewController())
            window?.rootViewController = navigationController
        case .lostInternet:
            break
        }
        
    }
    
    

}
//
//extension AppDelegate{
//    func startHost(at index:Int){
//        self.stopNotifier()
//        self.setupReachability(HOST_NAMES[index],useClosures: true)
//        self.startNotifier()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
//            self.startHost(at: (index+1)%3)
//        }
//    }
//    func setupReachability(_ hostName: String?, useClosures: Bool) {
//
//          if let hostName = hostName {
//              reachability = Reachability(hostname: hostName)
//          } else {
//                       reachability = Reachability()
//                   }
//
//                   if useClosures {
//                       reachability?.whenReachable = { reachability in
//                           self.updateLabelColourWhenReachable(reachability)
//                           //close
//
//                         //  NotificationCenter.default.post(.onConnectedToInternet)
//                       }
//                       reachability?.whenUnreachable = { reachability in
//                           self.updateLabelColourWhenNotReachable(reachability)
//                           //open
//                           //                self.stopNotifier()
//                                           self.route(to: .lostInternet)
//                                          // NotificationCenter.default.post(name: .onLostConnectToInternet, object: nil)
//                                       }
//                                   } else {
//                                       NotificationCenter.default.addObserver(
//                                           self,
//                                           selector: #selector(reachabilityChanged(_:)),
//                                                            name: .reachabilityChanged,
//                                                            object: reachability
//                                                        )
//                                                    }
//                                                }
//
//    func startNotifier(){
//           do {try reachability?.startNotifier()}
//           catch{print("Unable to start")
//               return
//           }
//       }
//       func stopNotifier() {
//               //        print("--- stop notifier")
//               reachability?.stopNotifier()
//               NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
//               self.reachability = nil
//           }
//    func updateLabelColourWhenReachable(_ reachability: Reachability) {
//                //        print("\(reachability.description) - \(reachability.connection)")
//                if reachability.connection == .wifi {
//                    //            print(reachability.connection)
//                } else {
//                    print(reachability.connection)
//                }
//            }
//
//    func updateLabelColourWhenNotReachable(_ reachability: Reachability) {
//            //        print("\(reachability.description) - \(reachability.connection) - \(reachability)")
//            //        print(reachability.connection)
//        }
//
//        @objc func reachabilityChanged(_ note: Notification) {
//            let reachability = note.object as! Reachability
//            if reachability.connection != .none {
//                updateLabelColourWhenReachable(reachability)
//            } else {
//                updateLabelColourWhenNotReachable(reachability)
//            }
//        }
//
//    }
//
//
//



enum ApplicationRoute {
    case main
    case login
    case lostInternet
}
