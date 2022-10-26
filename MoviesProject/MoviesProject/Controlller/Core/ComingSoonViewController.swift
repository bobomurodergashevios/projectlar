//
//  ComingSoonViewController.swift
//  MoviesProject
//
//  Created by Bobomurod Ergashev on 26/09/22.
//

import UIKit

class ComingSoonViewController: UIViewController {

    private var titles : [Title] = [Title]()
    private let upcomingtable : UITableView = {
       let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "UPComing"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.initviews()
        fetchUpComing()


    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingtable.frame = view.bounds
    }
    

    func initviews(){
        
        view.addSubview(upcomingtable)
        upcomingtable.delegate = self
        upcomingtable.dataSource = self
    }
    
    
    func fetchUpComing(){
        APICaller.shared.getUpcomingMovies { result in
            switch result {
            case .success(let titles):
                self.titles = titles
                DispatchQueue.main.async {
                    self.upcomingtable.reloadData()
                }
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }

}

extension ComingSoonViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return TitleTableViewCell()
        }
//        cell.accessoryType = .checkmark
        cell.configure(with: TitleViewModel(titleName: (titles[indexPath.row].original_title ?? titles[indexPath.row].original_name) ?? "Unknown title", posterURL: titles[indexPath.row].poster_path!))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
