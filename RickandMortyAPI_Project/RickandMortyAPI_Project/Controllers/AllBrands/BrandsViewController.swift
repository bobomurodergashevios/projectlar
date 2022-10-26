//
//  BrandsViewController.swift
//  RickandMortyAPI_Project
//
//  Created by Bobomurod Ergashev on 08/10/22.
//

import UIKit

//AIzaSyAxbPtQosk3slfwpno7PIq6c2CEbVHstaM

class BrandsViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    let searchcontroller = UISearchController(searchResultsController: SearchResultsViewController())
    private var layout : UICollectionViewFlowLayout!
    private var collectionview : UICollectionView!
    private var  viewwww : KeyboardView!
    
   
    private var DATALIST = ["Adidas","Nike","Puma","Sello","Korzinka","Havas","Makro","Cupra","Mercedes","BMW","Daewoo","TUNE","Microsoft","Apple","Amazon","Netflix","Google","Facebook","Youtube","TikTok","Nokia","Samsung","Xiaomi","Artel","Roison","Lg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchConfigure()
        initCollections()
        view.backgroundColor = .white
//        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.barTintColor = .lightGray
    }
    
   
    func initCollections(){
     
//        viewwww = KeyboardView(frame: CGRect(x: 10, y: (navigationController?.navigationBar.frame.maxY ?? 90)+50, width: view.frame.width-20, height: 130))
//        viewwww.backgroundColor = .lightGray
//        view.addSubview(viewwww)
        
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 0, left: 10, bottom: 10, right: 10)
    
        self.collectionview = UICollectionView(frame: CGRect(x: 0, y: ((navigationController?.navigationBar.frame.maxY ?? 80)+40), width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collectionview.delegate = self
        collectionview.dataSource = self
        view.addSubview(collectionview)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        
//        self.collectionview.frame = view.bounds
    }
    
    func searchConfigure(){
        title = "Search"
        navigationItem.searchController = searchcontroller
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        searchcontroller.searchBar.placeholder = "Search for a Brands"
        searchcontroller.searchBar.searchBarStyle = .minimal
        searchcontroller.searchBar.delegate = self
        searchcontroller.searchResultsUpdater = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        let vc = searchController.searchResultsController as? SearchResultsViewController
        vc?.view.backgroundColor = .yellow
        var newarr : [String] = [String]()
        for i in 0 ..< DATALIST.count {
            if DATALIST[i].lowercased().contains(text.lowercased()){
                newarr.append(DATALIST[i])
            }
        }
        vc?.update(newarr)
        print(text)
    }
    
    
}


extension BrandsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return DATALIST.count
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        
        for subview in cell.contentView.subviews {
         subview.removeFromSuperview()
        }
        
        cell.backgroundColor = .red
       
        let lab = UILabel(frame: CGRect(x: 10, y: 10, width: cell.frame.width-20, height: cell.frame.height-20))
        lab.text = DATALIST[indexPath.row]
        
        cell.contentView.addSubview(lab)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsize = CGSize(width: 90, height: 90)
        print("itemsuze")
        return itemsize
    }

}
