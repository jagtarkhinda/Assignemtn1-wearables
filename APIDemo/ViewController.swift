//
//  ViewController.swift
//  APIDemo
//
//  Created by Parrot on 2019-03-03.
//  Copyright © 2019 Parrot. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapKit
class ViewController: UIViewController{
    
   
    @IBOutlet weak var mapview: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //Latitude and Longitude for all 8 match locations
        let l1lat : CLLocationDegrees = Double("\(GlobalVariables.globalString[0])") as! CLLocationDegrees
        let l1long : CLLocationDegrees = Double("\(GlobalVariables.globalString[1])") as! CLLocationDegrees
        
        let l2lat : CLLocationDegrees = Double("\(GlobalVariables.globalString[2])") as! CLLocationDegrees
        let l2long : CLLocationDegrees = Double("\(GlobalVariables.globalString[3])") as! CLLocationDegrees
        
        let l3lat : CLLocationDegrees = Double("\(GlobalVariables.globalString[4])") as! CLLocationDegrees
        let l3long : CLLocationDegrees = Double("\(GlobalVariables.globalString[5])") as! CLLocationDegrees
        
        let l4lat : CLLocationDegrees = Double("\(GlobalVariables.globalString[6])") as! CLLocationDegrees
        let l4long : CLLocationDegrees = Double("\(GlobalVariables.globalString[7])") as! CLLocationDegrees
        
        let l5lat : CLLocationDegrees = Double("\(GlobalVariables.globalString[8])") as! CLLocationDegrees
        let l5long : CLLocationDegrees = Double("\(GlobalVariables.globalString[9])") as! CLLocationDegrees
        
        let l6lat : CLLocationDegrees = Double("\(GlobalVariables.globalString[10])") as! CLLocationDegrees
        let l6long : CLLocationDegrees = Double("\(GlobalVariables.globalString[11])") as! CLLocationDegrees
        
        let l7lat : CLLocationDegrees = Double("\(GlobalVariables.globalString[12])") as! CLLocationDegrees
        let l7long : CLLocationDegrees = Double("\(GlobalVariables.globalString[13])") as! CLLocationDegrees
        
        let l8lat : CLLocationDegrees = Double("\(GlobalVariables.globalString[14])") as! CLLocationDegrees
        let l8long : CLLocationDegrees = Double("\(GlobalVariables.globalString[15])") as! CLLocationDegrees
        
        
        
        
      //  let location = CLLocationCoordinate2D(latitude: myLatitute as! CLLocationDegrees, longitude: myLongitude)

        
        let l1 = CLLocationCoordinate2DMake(l1lat, l1long)
        let l2 = CLLocationCoordinate2DMake(l2lat, l2long)
        let l3 = CLLocationCoordinate2DMake(l3lat, l3long)
        let l4 = CLLocationCoordinate2DMake(l3lat, l4long)
        let l5 = CLLocationCoordinate2DMake(l5lat, l5long)
        let l6 = CLLocationCoordinate2DMake(l6lat, l6long)
        let l7 = CLLocationCoordinate2DMake(l7lat, l7long)
        let l8 = CLLocationCoordinate2DMake(l8lat, l8long)
        // pick a zoom level
                let y = MKCoordinateSpanMake(0.05, 0.05)
        
        // set the region property of the mapview
        let z = MKCoordinateRegionMake(l3, y)
        
        //show on map
        self.mapview.setRegion(z, animated: true)
        //print(myLatitute)
        //print(myLongitude)
       
            
            // 1. Create a pin object
               let pin = MKPointAnnotation()
        
        // 2. Set the latitude / longitude of the pin
                pin.coordinate = l1
    
                // 3. OPTIONAL: add a information popup (a "bubble")
                pin.title = "semifinal1"
        
        // 4. Show the pin on the map
                self.mapview.addAnnotation(pin)
        
      
        
                // PRACTICE: Add another pin to the map
                let pin2 = MKPointAnnotation()
                    pin2.coordinate = l2
        pin2.title = "semifinal2"
                    self.mapview.addAnnotation(pin2)
        
        // PRACTICE: Add another pin to the map
        let pin3 = MKPointAnnotation()
        pin3.coordinate = l3
        pin3.title = "quarterfinal1"
        self.mapview.addAnnotation(pin3)
        
        // PRACTICE: Add another pin to the map
        let pin4 = MKPointAnnotation()
        pin4.coordinate = l4
           pin4.title = "quarterfinal2"
        self.mapview.addAnnotation(pin4)
        
        // PRACTICE: Add another pin to the map
        let pin5 = MKPointAnnotation()
        pin5.coordinate = l5
           pin5.title = "quarterfinal3"
        self.mapview.addAnnotation(pin5)
        
        // PRACTICE: Add another pin to the map
        let pin6 = MKPointAnnotation()
        pin6.coordinate = l6
           pin6.title = "quarterfinal4"
        self.mapview.addAnnotation(pin6)
        
        // PRACTICE: Add another pin to the map
        let pin7 = MKPointAnnotation()
        pin7.coordinate = l7
           pin7.title = "mathc of third place"
        self.mapview.addAnnotation(pin7)
        
        // PRACTICE: Add another pin to the map
        let pin8 = MKPointAnnotation()
        pin8.coordinate = l8
           pin8.title = "final"
        self.mapview.addAnnotation(pin8)

        
 

    }

    //Requirement 1, sending message to watch
//    @IBAction func sendFirstMessage(_ sender: Any) {
//
//        let msg = ["Key": "msg from fone"]
//         WCSession.default.sendMessage(msg, replyHandler: nil)
//    }
//
//
//    //Requirement 2, receiving message from watch and sending the response back
//    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
//        //handle received message
//        let value = message["Value"] as? String
//        DispatchQueue.main.async{
//            self.getMessage.text = value
//        }
//        //send a reply
//        replyHandler(["Value": "Got the message"])
//    }
    }


