//
//  TitlePreviewViewController.swift
//  MoviesProject
//
//  Created by Bobomurod Ergashev on 29/09/22.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
   
    
    private let titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry Potter"
        return label
    }()
    
    
    private let overViewLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "This is best movie in the world!"
        label.numberOfLines = 0
        return label
        
    }()
    
    
    private let downloadButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .red
        btn.setTitle("Download", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.cornerRadius = 10
        return btn
        
    }()
    
    private let webView : WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .orange
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overViewLabel)
        view.addSubview(downloadButton)

        configureConstraints()
        
    }
    
    
    func configureConstraints(){
        let webViewCons = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 250),
        ]
        let titleLabelCons = [
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let overViewLabelCons = [
            overViewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overViewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let downloadButtonCons = [
            downloadButton.topAnchor.constraint(equalTo: overViewLabel.bottomAnchor, constant: 30),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 100),
            
        ]
        
        
        NSLayoutConstraint.activate(webViewCons)
        NSLayoutConstraint.activate(titleLabelCons)
        NSLayoutConstraint.activate(overViewLabelCons)
        NSLayoutConstraint.activate(downloadButtonCons)
        
        
    }


    
    func configure(with model : TitlePreviewModel){
        titleLabel.text = model.title
        overViewLabel.text = model.titleOverView
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        webView.load(URLRequest(url: url))
    }
}
