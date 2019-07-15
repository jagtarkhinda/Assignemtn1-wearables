//
//  Page2InterfaceController.swift
//  APIDemo WatchKit Extension
//
//  Created by Jagtar Singh on 2019-07-14.
//  Copyright © 2019 Parrot. All rights reserved.
//

import UIKit
import WatchKit
import Foundation
import Alamofire
import SwiftyJSON
import WatchConnectivity


class Page2InterfaceController: WKInterfaceController,  WCSessionDelegate  {

    
    
    @IBOutlet var fullTable: WKInterfaceTable!
    // 1: Session property
    private var session = WCSession.default
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
    
    }
    
    
    
    
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
        
        
        self.fullTable.setNumberOfRows(
            mainArray.count, withRowType:"fulltb"
        )
        
        // 2. Tell watch what data goes in each row
        for (index, data) in mainArray.enumerated() {
                //   if(self.subunsub[index] == "1"){
                let row = self.fullTable.rowController(at: index) as! FullRowController
                
                row.lbl.setText("\(data[0])")
                row.limg.setImageNamed("\(data[3])")
                row.rimg.setImageNamed("\(data[4])")
                
                
    }

}
    
}
