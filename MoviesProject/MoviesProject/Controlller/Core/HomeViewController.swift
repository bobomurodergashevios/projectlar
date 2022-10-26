//
//  HomeViewController.swift
//  MoviesProject
//
//  Created by Bobomurod Ergashev on 26/09/22.
//

import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTV
    case Popular
    case Upcoming
    case TopRated
}

class HomeViewController: UIViewController {

    let sectionTitles : [String] = ["Trending Movies","Popular","Trending TV","Upcoming soon","Top rated"]
    
    
    private let homeFeedTable : UITableView = {
        let table = UITableView(frame: .zero,style: .grouped)
        table.register(CollectionviewTableViewCell.self, forCellReuseIdentifier: CollectionviewTableViewCell.identifier)
//        table.backgroundColor = .clear
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
//        self.navigationController?.isNavigationBarHidden = true
        self.initviews()

        APICaller.shared.getMovie(with: "Harry Potter") { result in
            
        }

    }
    

    private func fetchData(){
//        APICaller.shared.getTrendingMovies { results in
//            switch results {
//            case .success(let movies):
//                print(movies)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
//
//        APICaller.shared.getTrendingTVs { results in
//            switch results {
//            case .success(let tv):
//                print(tv)
//
//            case .failure(let error):
//                print(error)
//            }
//        }
        
//        APICaller.shared.getUpcomingMovies { results in
//            switch results {
//            case .success(let movies):
//                print(movies)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        
//        APICaller.shared.getPopular { results in
//            switch results {
//                case .success(let popular):
//                    print(popular)
//
//                case .failure(let error):
//                    print(error)
//            }
//        }
        
        
        APICaller.shared.getTopRated { results in
            switch results {
            case .success(let trend):
                print(trend)
            case .failure(let error):
                print(error)
            }
        }
    }
    func initviews(){
        self.view.backgroundColor = .black
        homeFeedTable.frame = view.bounds
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        self.view.addSubview(homeFeedTable)
      
        
        
        self.homeFeedTable.tableHeaderView = HeroHeaderUIView(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: self.homeFeedTable.bounds.height - 400))
        
        
        
    }
    
    
//    func configureNavbar(){
//        var imagev = UIImageView(frame: .zero)
//        imagev.image = UIImage(named: "netflix")
//
//        imagev.backgroundColor = .clear
//        imagev.image?.withRenderingMode(.alwaysOriginal)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: imagev.image, style: .done, target: self, action: nil)
//
//    }

}






extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionviewTableViewCell.identifier, for: indexPath) as? CollectionviewTableViewCell else{
            return UITableViewCell()
        }
        
        cell.delegate = self
                
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            APICaller.shared.getTrendingMovies { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case Sections.TrendingTV.rawValue:
            APICaller.shared.getTrendingTVs { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
            
        case Sections.Popular.rawValue :
            APICaller.shared.getPopular { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
            
        case Sections.Upcoming.rawValue :
            APICaller.shared.getUpcomingMovies { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
            
        case Sections.TopRated.rawValue :
            APICaller.shared.getTopRated { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
            
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultoffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultoffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else{return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x+20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .black
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
        
    }
}


extension HomeViewController : CollectionViewTableViewCellDelegate {
    func collectionviewTableViewDidTapCell(_ cell: CollectionviewTableViewCell, viewModel: TitlePreviewModel) {
        DispatchQueue.main.async { [weak self] in
            let vc = TitlePreviewViewController()
            vc.configure(with: viewModel)
            self?.navigationController?.pushViewController(vc, animated: true)
            
        }
       
    }
}
