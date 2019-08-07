//
//  PinnAnnoatation.swift
//  Maps
//
//  Created by DD on 2/27/18.
//  Copyright © 2018 DD. All rights reserved.
//

import MapKit

class PinnAnnoatation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var identifier = "Pin"
    var pinImage:UIImage! = nil
    init(title: String, subtitle: String,coordinate: CLLocationCoordinate2D){
    
        self.title=title
        self.subtitle=subtitle
        self.coordinate=coordinate
        
    }
    
}
