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
//    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
    // Receiver
   var subunsub = [String]()
    var count = 0;
    var subGames: [[Any]] = []
    var j = 0;
    
    @IBOutlet var noGame: WKInterfaceLabel!
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {

     
        
             let msg: String = message["sub"] as! String
        if(msg == "1")
        {
            print("Game Subscribed")
        }
        if(msg == "0")
        {
            print("Game UNSubscribed")
        }
        noGame.setHidden(true)
        count = 0;
        self.subGames.removeAll()
        self.j = 0;
     //   let msg: [String] = [message["date"] as! String]
        DispatchQueue.main.async() { () -> Void in
            if let retreivedArray = message["date"] as? [String] {
                self.subunsub = retreivedArray
              //  print(self.subunsub)
            }
            for i in 0...(self.subunsub.count - 1)
            {
                if(self.subunsub[i] == "1")
                {
                    self.subGames.append(self.mainArray[i])
                    self.j += 1
                    self.count += 1
                }
            }
       
//        if(msg == "1")
//        {
//            print("Subscribed to the game")
//
//        }
//        else{
//            print("UNSubscribed to the game")
//        }
//        DispatchQueue.main.async{
//            //            self.getMessage.text = value
//                  }
        
        // R1Label.setText(message["Key"] as? String)
        // print(message["date"])
            if(self.count == 0)
            {
                self.noGame.setHidden(false)
                self.noGame.setText("No Game Subscribed")
            }
            self.watchtable.setNumberOfRows(
                self.subGames.count, withRowType:"myRow"
            )
            
            // 2. Tell watch what data goes in each row
            for (index, data) in self.subGames.enumerated() {
                if(self.count > 0){
             //   if(self.subunsub[index] == "1"){
                let row = self.watchtable.rowController(at: index) as! RowController
               
                    row.label1.setText("\(self.subGames[index][0])")
                row.leftImg.setImageNamed("\(self.subGames[index][3])")
                row.rightImg.setImageNamed("\(self.subGames[index][4])")
                    
                    
                }
                
            }
//                self.watchtable.setNumberOfRows(
//                    self.su.count, withRowType:"myRow"
//                )
//
//                // 2. Tell watch what data goes in each row
//                for (index, data) in self.mainArray.enumerated() {
//                    let row = self.watchtable.rowController(at: index) as! RowController
//                    row.label1.setText("\(data[0])")
//                    row.leftImg.setImageNamed("\(data[3])")
//                    row.rightImg.setImageNamed("\(data[4])")
//               }
    }
    }
    


    
    //outlet for page1 table

    @IBOutlet var watchtable: WKInterfaceTable!
    
    var pdata = ["dd","rr"]
    
    
    //API DATA//////////////////////
    
    //Variables for storing API data
    var arraysemi1: [Any] = []
    var arraysemi2: [Any] = []
    var arrayquarter1: [Any] = []
    var arrayquarter2: [Any] = []
    var arrayquarter3: [Any] = []
    var arrayquarter4: [Any] = []
    var arraythird: [Any] = []
    var arrayfinal: [Any] = []
    
    var mainArray: [[Any]] = []
    var gamesubs: [String] = ["0","0","0","0","0","0","0","0"]
    
    public var semifinal1 = [String : Any]()
    var semifinal2 = [String : Any]()
    var quarterfinal1 = [String : Any]()
    var quarterfinal2 = [String : Any]()
    var quarterfinal3 = [String : Any]()
    var quarterfinal4 = [String : Any]()
    var matchthird = [String: Any]()
    var matchfinal = [String: Any]()
    
    //API DATA END/////////////////////////
    
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
        //APII ///////
        
        let URL = "https://matchapi.firebaseio.com/matches.json"
        
        Alamofire.request(URL).responseJSON {
            response in
            let apiData = response.result.value
            if (apiData == nil) {
                print("Error when getting API data")
                return
            }
            
            let jsonResponse = JSON(apiData!)
            //adding API data to dictionary variable
            self.semifinal1 = jsonResponse["semi-final"][0].dictionary as! [String : Any]
            self.semifinal2 = jsonResponse["semi-final"][1].dictionary as! [String : Any]
            self.quarterfinal1 = jsonResponse["quarter-final"][0].dictionary as! [String : Any]
            self.quarterfinal2 = jsonResponse["quarter-final"][1].dictionary as! [String : Any]
            self.quarterfinal3 = jsonResponse["quarter-final"][2].dictionary as! [String : Any]
            self.quarterfinal4 = jsonResponse["quarter-final"][3].dictionary as! [String : Any]
            self.matchthird = jsonResponse["match of third place"][0].dictionary as! [String : Any]
            self.matchfinal = jsonResponse["final"][0].dictionary as! [String : Any]
            
            
            
            //FillIng arrays
            self.arraysemi1 = [self.semifinal1["date"]!,self.semifinal1["time"]!,self.semifinal1["location"]!,self.semifinal1["teama"]!,self.semifinal1["teamb"]!]
            self.arraysemi2 = [self.semifinal2["date"]!,self.semifinal2["time"]!,self.semifinal2["location"]!,self.semifinal2["teama"]!,self.semifinal1["teamb"]!]
            self.arrayquarter1 = [self.quarterfinal1["date"]!,self.quarterfinal1["time"]!,self.quarterfinal1["location"]!,self.quarterfinal1["teama"]!,self.quarterfinal1["teamb"]!]
            self.arrayquarter2 = [self.quarterfinal2["date"]!,self.quarterfinal2["time"]!,self.quarterfinal2["location"]!,self.quarterfinal2["teama"]!,self.quarterfinal2["teamb"]!]
            
            self.arrayquarter3 = [self.quarterfinal3["date"]!,self.quarterfinal3["time"]!,self.quarterfinal3["location"]!,self.quarterfinal3["teama"]!,self.quarterfinal3["teamb"]!]
            self.arrayquarter4 = [self.quarterfinal4["date"]!,self.quarterfinal4["time"]!,self.quarterfinal4["location"]!,self.quarterfinal4["teama"]!,self.quarterfinal4["teamb"]!]
            self.arraythird = [self.matchthird["date"]!,self.matchthird["time"]!,self.matchthird["location"]!,self.matchthird["teama"]!,self.matchthird["teamb"]!]
            self.arrayfinal = [self.matchfinal["date"]!,self.matchfinal["time"]!,self.matchfinal["location"]!,self.matchfinal["teama"]!,self.matchfinal["teamb"]!]
            
            self.mainArray.append(self.arraysemi1)
            self.mainArray.append(self.arraysemi2)
            self.mainArray.append(self.arrayquarter1)
            self.mainArray.append(self.arrayquarter2)
            self.mainArray.append(self.arrayquarter3)
            self.mainArray.append(self.arrayquarter4)
            self.mainArray.append(self.arraythird)
            self.mainArray.append(self.arrayfinal)
            
        

        
        // END API//////////
     
        
   
        }
        
    }
    
}
