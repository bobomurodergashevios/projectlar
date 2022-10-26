//
//  SearchResultViewController.swift
//  MoviesProject
//
//  Created by Bobomurod Ergashev on 28/09/22.
//

import UIKit
//import WebKit
class SearchResultViewController: UIViewController {
    public var titles : [Title] = [Title]()
    public let searchCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        
        let collview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collview.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.backgroundColor = .green
        
        view.addSubview(self.searchCollection)
        self.searchCollection.delegate = self
        self.searchCollection.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchCollection.frame = view.bounds
    }


    
}
extension SearchResultViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else{return UICollectionViewCell()}
//        cell.configure(with: <#T##String#>)
        cell.backgroundColor = .blue
        cell.configure(with: titles[indexPath.row].poster_path ?? "")
        return cell
    }
    
    
}
