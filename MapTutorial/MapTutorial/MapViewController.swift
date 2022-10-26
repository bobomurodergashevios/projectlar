//
//  MapViewController.swift
//  MapTutorial
//
//  Created by Bobomurod Ergashev on 11/10/22.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate {

    private var mapview : GMSMapView!
    private var currentMarker : GMSMarker!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .clear
        initviews()
//        
    }
    
    func initviews(){
        mapview = GMSMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        mapview.settings.myLocationButton = true
        mapview.delegate = self
        
        view.addSubview(mapview)
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
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
        addMarkerto(coordinate)
        self.currentMarker.position = coordinate
        self.currentMarker.map = mapView
//        let zoom = mapView.camera.zoom
//        mapView.animate(toZoom: zoom+1)
        
//        print(mapView.camera.zoom)
    }

    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        let zoom = mapView.camera.zoom
        mapView.animate(toZoom: zoom-1)
        print(mapView.camera.zoom)
        return true
    }
    
}
