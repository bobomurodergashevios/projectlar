//
//  MapViewController.swift
//  RickandMortyAPI_Project
//
//  Created by Bobomurod Ergashev on 08/10/22.
//

import UIKit
import GoogleMaps

//AIzaSyAxbPtQosk3slfwpno7PIq6c2CEbVHstaM
class MapViewController: UIViewController {

   static var conflik : ((Double,Double) -> Void)?
    
    public var coordinata : CLLocationCoordinate2D!
    private var currentMarker : GMSMarker!
    private var counter = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapv = GMSMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        mapv.settings.myLocationButton = true
        mapv.delegate = self
        self.view.addSubview(mapv)
        
//        addMarkerto()
        
    }
    


    func addMarkerto(_ position : CLLocationCoordinate2D){
        
        self.currentMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 64.0, longitude: 65.0))
        self.currentMarker.icon = UIImage(named: "minus")
        self.currentMarker.title = "ME"
        self.currentMarker.snippet = "This is my location"
       
        
        let pinvew = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        pinvew.layer.cornerRadius = 32
        pinvew.backgroundColor = .lightGray
        
        let pinimg = UIImageView(frame: CGRect(x: 4, y: 4, width: 56, height: 56))
//        pinimg.layer.cornerRadius = 24
        pinimg.clipsToBounds = true
        pinimg.layer.masksToBounds = true
        pinimg.image = UIImage(named: "bor")
        pinimg.contentMode = .scaleAspectFit
        pinvew.addSubview(pinimg)
        self.currentMarker.iconView = pinvew
    }
}

extension MapViewController : GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
        addMarkerto(coordinate)
        self.currentMarker.position = coordinate
        self.currentMarker.map = mapView
//        let zoom = mapView.camera.zoom
//        mapView.animate(toZoom: zoom+1)
        
//        print(mapView.camera.zoom)
       
//    latitude: 43.59595529377546, longitude: 1.4424564689397814
    }
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        let zoom = mapView.camera.zoom
        mapView.animate(toZoom: zoom-1)
        print(mapView.camera.zoom)
        return true
    }
}
