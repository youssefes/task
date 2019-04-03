//
//  mapscreen.swift
//  task_Hkurat
//
//  Created by youssef on 3/24/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapscreen: UIViewController {

    @IBOutlet weak var menuBtnOut: UIButton!
    @IBOutlet weak var addDatiels: UITextField!
    @IBOutlet weak var myLocation: UITextField!
    var address = [String]()
    @IBOutlet weak var mapView: MKMapView!
    var longtat = ""
    var lata = ""
    let AuthorizationStatus = CLLocationManager.authorizationStatus()
    let regionReduis: Double = 1000
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        checkLocationManger()
        showMenu()
    }
    
    func showMenu(){
    self.menuBtnOut.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
    }
    
    @IBAction func MenuBtn(_ sender: UIButton) {
        
        
    }
    
    @IBAction func getlocationDeatiels(_ sender: UIButton) {
    
        searchBarSearchButtonClicked()
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func centerUserLocation (){
        if let coordinate = locationManager.location?.coordinate{
            self.longtat = "\(coordinate.longitude)"
            self.lata = "\(coordinate.latitude)"
            print("\(longtat) \(lata)")
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
        }
    }
    func setupLocationManger(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationManger(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManger()
            checkAuthorizationStaus()
            getNameOfLocation()
        }else{
            
        }
        
    }
    
    
    func getNameOfLocation(){
        if let coordinate = locationManager.location?.coordinate{
            let long = coordinate.longitude
            let lat = coordinate.latitude
            let gecoder = CLGeocoder()
            let location = CLLocation(latitude: lat, longitude: long)
            gecoder.reverseGeocodeLocation(location) { (placesMark, error) in
                guard let placeMark = placesMark?.first else { return }
                
                // Location name
                if let locationName = placeMark.location {
                    print(locationName)
                }
                // Street address
                if let street = placeMark.thoroughfare {
                    self.address.append(street)
                    print(street)
                }
                // City
                if let city = placeMark.subAdministrativeArea {
                    self.address.append(city)
                    print(city)
                }
                // Zip code
                if let zip = placeMark.isoCountryCode {
                    print(zip)
                }
                // Country
                if let country = placeMark.country {
                    self.address.append(country)
                }
                print(self.address)
                    self.myLocation.text = self.address.joined(separator: "/")
            }
        }
        
    }
    
    func searchBarSearchButtonClicked() {
        
        // ignoring user
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        // activity indicator
        
        
        let activityindicator = UIActivityIndicatorView()
        activityindicator.style = UIActivityIndicatorView.Style.gray
        activityindicator.center = self.view.center
        activityindicator.hidesWhenStopped = true
        activityindicator.startAnimating()
        
        self.view.addSubview(activityindicator)
        
        
        
       
        // create the search request
        
        
        let searchrequest = MKLocalSearch.Request()
        searchrequest.naturalLanguageQuery = self.addDatiels.text
        
        let activesearch = MKLocalSearch(request: searchrequest)
        
        activesearch.start { (response, error) in
            
            activityindicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            if response == nil {
                
                print("ERROR")
                
            }else {
                
                // remove annotation
                
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                
                // getting data
                
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                // create  annotation
                
                let annotation = MKPointAnnotation()
                annotation.title = self.addDatiels.text
                annotation.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
                self.mapView.addAnnotation(annotation)
                
                // zooming in an annotation
                
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.mapView.setRegion(region, animated: true)
                
                
            }
        }
        
        
        
    }
    
    
}
extension mapscreen :MKMapViewDelegate{
    
}
extension mapscreen : CLLocationManagerDelegate{
    func checkAuthorizationStaus(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerUserLocation()
            locationManager.startUpdatingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            mapView.showsUserLocation = true
            centerUserLocation()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAuthorizationStaus()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        let locationIncenter = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: locationIncenter, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
    }
}
