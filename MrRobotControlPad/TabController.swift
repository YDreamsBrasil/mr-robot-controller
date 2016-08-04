//
//  TabController.swift
//  MrRobotControlPad
//
//  Created by Luiz Fonseca on 04/08/2016.
//  Copyright © 2016 Luiz Fonseca. All rights reserved.
//

import Foundation
import Starscream
import UIKit


class TabController: UITabBarController, WebSocketDelegate {
    
    
    var socket: WebSocket!

    
    var robotName: String!
    var robotServer: String!
    var robotUrl: String!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("Begin");
        debugPrint("Robot: \(self.robotName)")
        
        
        
        
        // Start websocket connection to the robotServer address and port
        self.socket = WebSocket(url: NSURL(string: self.getSocketServer())!)
        self.socket.delegate = self
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.socket.connect()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    /** WEBSOCKET implementation **/
    
    
    // Get socket server with scheme
    func getSocketServer() -> String {
        var url: String
        
        url = "ws://\(self.robotServer)"
        return url
        
    }
    
    
    // Convert JSON to Dictionary of strings
    func convertStringToDictionary(text: String) -> [String:String]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:String]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    
    
    
    // Just a wrapper to return a String message to the manager
    func sendFeedbackMessage(msg: String) -> (String) {
        return "\"{'type': 'feedback', 'from': 'manager', 'src': '\(msg)'}\""
    }
    
    
    // Just a wrapper to return a String message to the manager
    func sendCommandMessage(msg: String) -> (String) {
        return "\"{'type': 'double_command', 'from': 'manager', 'command': '\(msg)', 'robot': '\(self.robotName)' }\""
    }
    
    
    // Just a wrapper to return a String message to the manager
    func sendVideoMessage(msg: String) -> (String) {
        return "\"{'type': 'video', 'from': 'manager', 'command': '\(msg)', 'robot': '\(self.robotName)' }\""
    }
    
    
    
    // WebsocketDelegate Implementation
    func websocketDidConnect(socket: WebSocket) {
        print("Websocket is connected")
        socket.writeString(self.sendFeedbackMessage("I am connected now."))
    }
    
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print("Websocket is disconnected: \(error?.localizedDescription)")
        socket.connect()
    }
    
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        print("Got some text: \(text)")
    }
    
    
    func websocketDidReceiveData(socket: WebSocket, data: NSData) {
        print("got some data: \(data.length)")
    }
    
    
    
}


