//
//  Map2ViewController.swift
//  MapTutorial
//
//  Created by Bobomurod Ergashev on 12/10/22.
//
import UIKit
import GoogleMaps
import CoreLocation

let wvidth : CGFloat = UIScreen.main.bounds.width
let wheeight : CGFloat = UIScreen.main.bounds.height

class Map2ViewController: UIViewController {

    private var mapView : GMSMapView!
    private var mmarker : GMSMarker!
    private var locationManager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initvs()
        self.requestForLocation()
    }
    
    func requestForLocation(){
        switch (CLLocationManager.authorizationStatus()){
            
        case .authorizedAlways,.authorizedWhenInUse, .notDetermined :
            self.locationManager.startUpdatingLocation()
        case .restricted,.denied :
            // setting
            break
        @unknown default:
            print("errrorr")
        }
    }

    func initvs(){
        self.mapView = GMSMapView(frame: CGRect(x: 0, y: 0, width: wvidth, height: wheeight))
        mapView.delegate = self
        mapView.settings.myLocationButton = true
        view.addSubview(mapView)
        
        
        self.mmarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0))
        self.mmarker.snippet = "This is my location!"
        self.mmarker.title = "ME"
        self.mmarker.icon = UIImage(named: "location")
        
        self.locationManager = CLLocationManager()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    func addMarkerto(){
        if mmarker == nil {
            self.mmarker = GMSMarker()
            self.mmarker.snippet = "This is my location!"
            self.mmarker.title = "ME"
            self.mmarker.icon = UIImage(named: "location")
        }
        
    }
}



// MARK: EXTENSIONS

extension Map2ViewController : GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
//        mmarker?.iconView?.removeFromSuperview()
//        addMarkerto()
        self.mmarker.position = coordinate
        self.mmarker.map = self.mapView
        self.mapView.animate(toLocation: self.mmarker.position)

        
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        return true
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
//        let zoom = mapView.camera.zoom
//        self.mapView.animate(toZoom: zoom-1)
//        print(zoom)
        self.locationManager.startUpdatingLocation()
        return true
    }
//    func mapView(_ mapView: GMSMapView, didTapMyLocation location: CLLocationCoordinate2D) {
//
//    }

}

extension Map2ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        self.requestForLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied || status == .restricted {
            self.requestForLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        if locations.count > 0 , let coordinate = locations.first?.coordinate {
            self.mmarker.position = coordinate
            self.mmarker.map = mapView
            self.mapView.animate(toLocation: self.mmarker.position)
            self.locationManager.stopUpdatingLocation()
        }
    }
}
