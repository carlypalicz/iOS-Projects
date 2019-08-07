//
//  ViewController.swift
//  Maps
//
//  Created by Carly Palicz on 8/5/2019.
//  Copyright © 2019 Carly Palicz. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate  {
    
    @IBOutlet weak var myMap: MKMapView!
    @IBAction func standard(_ sender: Any) {
        myMap.mapType = .standard
    }
    @IBAction func satellite(_ sender: Any) {
        myMap.mapType = .satellite
    }
    @IBAction func hybrid(_ sender: Any) {
        myMap.mapType = .hybrid
    }
    
    @IBAction func zoomout(_ sender: Any) {
        var region: MKCoordinateRegion = myMap.region
        region.span.latitudeDelta = min(region.span.latitudeDelta*2, 180.0)
        region.span.longitudeDelta = min(region.span.longitudeDelta*2, 180.0)
        myMap.setRegion(region, animated: true)
    }
    
    @IBAction func zoomin(_ sender: Any) {
        var region: MKCoordinateRegion = myMap.region
        region.span.latitudeDelta /= 2.0
        region.span.longitudeDelta /= 2.0
        myMap.setRegion(region, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMap.delegate = self
        
        let location = CLLocationCoordinate2DMake( 40.744851, -74.02570724487305)
        let location2 = CLLocationCoordinate2DMake(40.7428791, -74.0290445)
        let location3 = CLLocationCoordinate2DMake(40.7395652, -74.0276793)
        let location4 = CLLocationCoordinate2DMake(40.7387731, -74.0307244)
        let location5 = CLLocationCoordinate2DMake(40.7372045, -74.0308142)
        let location6 = CLLocationCoordinate2DMake(40.7372283, -74.0277354)
        let location7 = CLLocationCoordinate2DMake(40.7487479, -74.0274871)
        let location8 = CLLocationCoordinate2DMake(40.7506658, -74.0268986)
        let location9 = CLLocationCoordinate2DMake(40.7448306, -74.0286842)
        let location10 = CLLocationCoordinate2DMake(40.741407, -74.0297279)
        
        let pin=PinnAnnoatation(title:"Stevens",subtitle:"Institute of Technology", coordinate: location)
        pin.pinImage = UIImage(named: "stevens")
        let pin2=PinnAnnoatation(title:"Makai", subtitle: "Restaurant", coordinate: location2)
        pin2.pinImage = UIImage(named: "makai")
        let pin3=PinnAnnoatation(title: "The W", subtitle: "Hotel", coordinate: location3)
        pin3.pinImage = UIImage(named: "thew")
        let pin4=PinnAnnoatation(title: "Johnny Rockets", subtitle: "diner", coordinate: location4)
        pin4.pinImage = UIImage(named: "johnnyrockets")
        let pin5=PinnAnnoatation(title: "Carlo's", subtitle: "Bakery", coordinate: location5)
        pin5.pinImage = UIImage(named: "carlos")
        let pin6=PinnAnnoatation(title: "Pier A", subtitle: "Park", coordinate: location6)
        pin6.pinImage = UIImage(named: "piera")
        let pin7=PinnAnnoatation(title: "Bwe Cafe", subtitle: "Coffee Shop", coordinate: location7)
        pin7.pinImage = UIImage(named: "bwe")
        let pin8=PinnAnnoatation(title: "Napoli's", subtitle: "Pizza Restaurant", coordinate: location8)
        pin8.pinImage = UIImage(named: "napolis")
        let pin9=PinnAnnoatation(title: "Dunkin", subtitle: "Dunkin' Donuts", coordinate: location9)
        pin9.pinImage = UIImage(named: "dunkin")
        let pin10=PinnAnnoatation(title: "Qdoba", subtitle: "Restaurant", coordinate: location10)
        pin10.pinImage = UIImage(named:"qdoba")
        
        MKPinAnnotationView.greenPinColor()
        myMap.setRegion(MKCoordinateRegionMakeWithDistance(location, 1200, 1200), animated: true)
        
        
        myMap.addAnnotation(pin)
        myMap.addAnnotation(pin2)
        myMap.addAnnotation(pin3)
        myMap.addAnnotation(pin4)
        myMap.addAnnotation(pin5)
        myMap.addAnnotation(pin6)
        myMap.addAnnotation(pin7)
        myMap.addAnnotation(pin8)
        myMap.addAnnotation(pin9)
        myMap.addAnnotation(pin10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->
    MKAnnotationView? {
        var annotationView = MKPinAnnotationView()
        guard let annotation = annotation as? PinnAnnoatation else {
            return nil
        }
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: annotation.identifier) as? MKPinAnnotationView {
            annotationView = dequeuedView
        }
        else {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotation.identifier)
        }
        annotationView.pinTintColor = UIColor.blue
        annotationView.canShowCallout = true
        annotationView.leftCalloutAccessoryView = UIImageView(image: annotation.pinImage)
        return annotationView
    }


}

