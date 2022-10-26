//
//  TestViewController.swift
//  SearchPhotosInternet
//
//  Created by Bobomurod Ergashev on 01/10/22.
//

import UIKit
import PINRemoteImage
class TestViewController: UIViewController {
    
    
    private let grlayer : CAGradientLayer = {
        let grLayer = CAGradientLayer()
//        grLayer.frame = view.bounds
        grLayer.colors = [UIColor.white.cgColor,UIColor.blue.cgColor]
        grLayer.opacity = 1.0
        return grLayer
    }()
    private let cityNameLabel : UILabel = {
      let lbl = UILabel()
        lbl.text = "Cupertino"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 28, weight: .medium)
        return lbl
    }()
    
    private let temperatureLabel : UILabel = {
        let lbl = UILabel()
          lbl.text = "76°"
          lbl.textColor = .white
          lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
          lbl.font = .systemFont(ofSize: 34, weight: .medium)
          return lbl
    }()
    private let weatherImage : UIImageView = {
        let img = UIImageView()
//        "cloud.sun.rain.fill"
        if #available(iOS 13.0, *) {
            img.image = UIImage(systemName:
                                    "square.and.arrow.up")?.withRenderingMode(.alwaysOriginal)
        } else {
            // Fallback on earlier versions
        }
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    private let verticalStack1 : UIStackView = {
       let stc = UIStackView()
        stc.spacing = 9
        stc.axis = .vertical
        stc.translatesAutoresizingMaskIntoConstraints = false
        stc.alignment = .center
        stc.distribution = .fillEqually
        return stc
    }()
    private let verticalStack2 : UIStackView = {
       let stc = UIStackView()
        stc.spacing = 0
        stc.axis = .vertical
        stc.translatesAutoresizingMaskIntoConstraints = false
        stc.alignment = .center
        stc.distribution = .fillEqually
        return stc
    }()

    
    private let tableview : UITableView = {
        let table = UITableView()
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        table.register(Section2TableviewcellTableViewCell.self, forCellReuseIdentifier: Section2TableviewcellTableViewCell.identifier)
        return table
    }()
    
    
    
   

    
   
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(grlayer)
        initViews()
        
        
      con()
    }
    
    func con(){
        APIClient.getCurrentWeather() { response in
            if let data = response {
                self.updating(data: data)
                print(data)
            }
            
        }
    }
    func initViews(){
        view.addSubview(verticalStack1)
        verticalStack1.addArrangedSubview(verticalStack2)
        verticalStack2.addArrangedSubview(cityNameLabel)
        verticalStack2.addArrangedSubview(temperatureLabel)
        verticalStack1.addArrangedSubview(weatherImage)
       
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.layer.cornerRadius = 9
        tableview.separatorStyle = .none
        tableview.backgroundColor = .blue.withAlphaComponent(0.1)
        tableview.isScrollEnabled = false
        view.addSubview(tableview)

    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        grlayer.frame = view.bounds
        tableview.frame = CGRect(x: 10, y: verticalStack1.frame.maxY+50, width: UIScreen.main.bounds.width-20, height: view.bounds.height-verticalStack1.frame.height-100)
        
        configureConstraints()
    }

 
    
    
    func configureConstraints(){
        verticalStack1.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        verticalStack1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        verticalStack1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        verticalStack1.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        verticalStack1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        verticalStack2.topAnchor.constraint(equalTo: verticalStack1.topAnchor, constant: 0).isActive = true
        verticalStack2.leftAnchor.constraint(equalTo: verticalStack1.leftAnchor, constant: 50).isActive = true
        verticalStack2.rightAnchor.constraint(equalTo: verticalStack1.rightAnchor, constant: -50).isActive = true
        verticalStack2.widthAnchor.constraint(equalToConstant: verticalStack1.frame.width - 100).isActive = true
        verticalStack2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        cityNameLabel.topAnchor.constraint(equalTo: verticalStack1.topAnchor, constant: 0).isActive = true
        cityNameLabel.leftAnchor.constraint(equalTo: verticalStack1.leftAnchor, constant: 50).isActive = true
        cityNameLabel.rightAnchor.constraint(equalTo: verticalStack1.rightAnchor, constant: -50).isActive = true
        cityNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        temperatureLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 6).isActive = true
        temperatureLabel.leftAnchor.constraint(equalTo: verticalStack1.leftAnchor, constant: 50).isActive = true
        temperatureLabel.rightAnchor.constraint(equalTo: verticalStack1.rightAnchor, constant: -50).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        weatherImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    
    func updating(data : WeatherModel?){
        self.cityNameLabel.text = data?.name
        guard let temp = data?.main?.temp?.rounded() else {
            return
        }
        self.temperatureLabel.text = "\(temp)"
        guard let iconstring = data?.weather?[0].icon else{return}
        print("temperatura --- \(iconstring)")

        self.weatherImage.pin_setImage(from: URL(string: "https://openweathermap.org/img/wn/\(iconstring)@2x.png"))
        self.weatherImage.image?.withRenderingMode(.alwaysOriginal)
    }
}
