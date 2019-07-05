//
//  Page1InterfaceController.swift
//  APIDemo WatchKit Extension
//
//  Created by MacStudent on 2019-06-26.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON
import WatchConnectivity

class PAGE1InterfaceController: WKInterfaceController,  WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    // 1: Session property
    private var session = WCSession.default
    

    
    
    //Requirement 1, receiving message from phone
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        let msg: String = message["sub"]! as! String
        if(msg == "1")
        {
            print("Subscribed to the game")
            
        }
        else{
            print("UNSubscribed to the game")
        }
        // R1Label.setText(message["Key"] as? String)
        // print(message["date"])
        //        self.watchtable.setNumberOfRows(
        //            message.count, withRowType:"myRow"
        //        )
        //
        //        // 2. Tell watch what data goes in each row
//                for (index, data) in .enumerated() {
//                    let row = self.watchtable.rowController(at: index) as! RowController
//                    row.label1.setText(data)
//                }
    }
    

    
    
    //outlet for page1 table

    @IBOutlet var watchtable: WKInterfaceTable!
    
    var pdata = ["dd","rr"]
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
            
            print("watch session")
        }
        
     
        
        // 1. Tell watch how many rows you want
        // blue = name of table outlet
        // pink = name of your data source
        // yellow = id for your row
       
        
    }
    
    //Requirement 2 , sending message to phone and receiving an ACK in return
//    @IBAction func pushMessage() {
//
//        let mainMessage = ["Value":"Hello from Watch"]
//       print("hello hello")
//         if (WCSession.default.isReachable) {
//        session.sendMessage(mainMessage,
//                        replyHandler:
//            { replyMessage in
//            //handle and present the message on screen
//            let value = replyMessage["Value"] as? String
//            self.getMessage.setText(value)
//        }, errorHandler: {error in
//            // catch any errors here
//            print("error received is \(error)")
//        })
//    }
//
//    }
}
