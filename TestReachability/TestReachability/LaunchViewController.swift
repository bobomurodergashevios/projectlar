//
//  LaunchViewController.swift
//  TestReachability
//
//  Created by Bobomurod Ergashev on 04/10/22.
//
import UIKit
class LaunchViewController: UIViewController {
    let network: NetworkManager = NetworkManager.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.isUnreachable { _ in
            self.showOfflinePage()
        }
        NetworkManager.isReachable { _ in
            self.showMainPage()
        }
    }
    private func showOfflinePage() -> Void {
        DispatchQueue.main.async {
            self.performSegue(
                withIdentifier: "NetworkUnavailable",
                sender: self
            )
        }
    }
    
    private func showMainPage() -> Void {
        DispatchQueue.main.async {
            self.performSegue(
                withIdentifier: "MainController",
                sender: self
            )
        }
    }
}
