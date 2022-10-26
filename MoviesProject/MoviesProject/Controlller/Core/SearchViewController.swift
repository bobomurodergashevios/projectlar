//
//  SearchViewController.swift
//  MoviesProject
//
//  Created by Bobomurod Ergashev on 26/09/22.
//

import UIKit

class SearchViewController: UIViewController {

    private var titles : [Title] = [Title]()

    private let discoverTable : UITableView = {
       let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    
    private let searchcontroller : UISearchController = {
        let searchController = UISearchController(searchResultsController: SearchResultViewController())
        searchController.searchBar.placeholder = "Search for a Movie"
        searchController.searchBar.searchBarStyle = .minimal
        return searchController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.initviews()

        
        navigationItem.searchController = searchcontroller
        searchcontroller.searchResultsUpdater = self
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTable.frame = view.bounds
    }

    func initviews(){
        self.view.backgroundColor = .white
        self.view.addSubview(discoverTable)
        discoverTable.delegate = self
        discoverTable.dataSource = self
        
        fetchDiscoverMovies()
    }

    
    func fetchDiscoverMovies(){
        APICaller.shared.getDiscoverMovies { result in
            switch result {
            case .success(let titles):
                self.titles = titles
                DispatchQueue.main.async {
                    self.discoverTable.reloadData()
                }
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}

extension SearchViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(with: TitleViewModel(titleName: titles[indexPath.row].original_name ?? titles[indexPath.row].original_title ?? "Unknown title", posterURL: titles[indexPath.row].poster_path ?? ""))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchcontroller.searchBar
        
        guard let query = searchBar.text ,
              !query.trimmingCharacters(in: .whitespaces).isEmpty ,
              query.trimmingCharacters(in: .whitespaces).count >= 3 ,
        let resultController = searchcontroller.searchResultsController as? SearchResultViewController else {
            return
        }
    
        APICaller.shared.search(with: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let titles) :
                    resultController.titles = titles
                    resultController.searchCollection.reloadData()
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            }
        }
        
        
    }
    
    
    
}
