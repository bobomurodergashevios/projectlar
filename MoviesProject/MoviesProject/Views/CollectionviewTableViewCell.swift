//
//  CollectionviewTableViewCell.swift
//  MoviesProject
//
//  Created by Bobomurod Ergashev on 26/09/22.
//

import UIKit


protocol CollectionViewTableViewCellDelegate: AnyObject  {
    func collectionviewTableViewDidTapCell(_ cell : CollectionviewTableViewCell , viewModel : TitlePreviewModel)
}
class CollectionviewTableViewCell: UITableViewCell {

    
   static let identifier = "CollectionviewTableViewCell"
    weak var delegate : CollectionViewTableViewCellDelegate?
    
    private var titles : [Title] = [Title]()
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.sectionInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.collectionView.frame = contentView.frame

        contentView.backgroundColor = .purple
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.frame
        
       
    }
    public func configure(with titles : [Title]){
        self.titles = titles
        
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }

}



extension CollectionviewTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let model = titles[indexPath.row].poster_path else {
            return UICollectionViewCell()
        }
        cell.configure(with: model)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let title = titles[indexPath.row]
        guard let titleName = title.original_title ?? title.original_name else {
            return
        }
        
        APICaller.shared.getMovie(with: titleName + " trailer") { result in
            switch result {
            case .success(let videoElement) :
                
                let title = self.titles[indexPath.row]
                guard let titleOverView = title.overview else {
                    return
                }
//                guard let strongSelf = self else {
//                    return
//                }
                let viewModel = TitlePreviewModel(title: titleName, youtubeView: videoElement, titleOverView: titleOverView)
                self.delegate?.collectionviewTableViewDidTapCell(self, viewModel: viewModel)
                
                
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
}
