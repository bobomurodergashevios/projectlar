
import UIKit
import PINRemoteImage

let windowWidth : CGFloat = UIScreen.main.bounds.width
let windowHeight: CGFloat = UIScreen.main.bounds.height

class CollectioonViewController: UIViewController {
    var  layout = UICollectionViewFlowLayout()
    var collectionView: UICollectionView!
    private var model : Model!
    var timer : Timer?
    var current = 0
    var pageControl : UIPageControl!
    private var modelList = [
        Model(),
        Model(),
        Model(),
        Model(),
        Model(),
        Model(),
        Model(),
        Model(),
        Model()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CollectionViewController"
        view.backgroundColor = .red
      
        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 40, width: windowWidth, height: 2*windowWidth-150), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onSlide), userInfo: nil, repeats: true)
    
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register( CustomCollectionCollectionViewController.self, forCellWithReuseIdentifier: CustomCollectionCollectionViewController.identifier)
        view.addSubview(collectionView)
        
        pageControl = UIPageControl(frame: CGRect(x: 10, y: 2*windowWidth-150, width: view.frame.width-20, height: 70))
        pageControl.backgroundColor = .gray
        pageControl.numberOfPages = modelList.count
        view.addSubview(pageControl)
        
    }
    
    
    @objc func onSlide(){
//        if current < modelList.count-1{
//            current += 1
//        }else{
//            current = 0
//        }
//        collectionView.scrollToItem(at: IndexPath(row: current, section: 0), at: .right, animated: true)
    }
    
}

extension CollectioonViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCollectionViewController.identifier, for: indexPath) as! CustomCollectionCollectionViewController
            cell.initCollectionViewCell(frame: CGRect(x: 0, y: 10, width: Int(windowWidth), height: Int(2*windowWidth)), model: modelList[Int.random(in: 0 ... 8)])
        return cell
    }
}

extension CollectioonViewController: UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth: CGFloat = windowWidth
        
        return CGSize(width: itemWidth, height: 2*itemWidth)
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}


struct Model{
    var image : String
    var imglist : [String] = [
        "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg",
        "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg",
        "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg",
        "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg",
        "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg",

        "https://media.cntraveller.com/photos/611bf0b8f6bd8f17556db5e4/1:1/w_2000,h_2000,c_limit/gettyimages-1146431497.jpg",
        "https://media.cntraveller.com/photos/611bf0b8f6bd8f17556db5e4/1:1/w_2000,h_2000,c_limit/gettyimages-1146431497.jpg",
        "https://media.cntraveller.com/photos/611bf0b8f6bd8f17556db5e4/1:1/w_2000,h_2000,c_limit/gettyimages-1146431497.jpg",
        "https://media.cntraveller.com/photos/611bf0b8f6bd8f17556db5e4/1:1/w_2000,h_2000,c_limit/gettyimages-1146431497.jpg"
    ]
    
    init(){
        self.image = imglist[Int.random(in: 0 ... 8)]
    }
}
