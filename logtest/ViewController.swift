//
//  ViewController.swift
//  Logger
//
//  Created by Andrew Hart on 06/02/2015.
//  Copyright (c) 2015 Andrew Hart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Logger.registerForLogs(logTypeIdentifier: "SpaceLog", appendedPrefix: "SPACELOG: ")
        Logger.registerForLogs(logTypeIdentifier: "EarthLog", appendedPrefix: "EARTHLOG: ", withTimeIntervalPrefix: true)
        
        //Should be logged
        Logger.log("test log")
        
        //Should be logged with time interval prefix.
        Logger.log("another test log", withTimeIntervalPrefix: true)
        
        //Should be logged, with appended prefix for SpaceLogs.
        Logger.log(logTypeIdentifier: "SpaceLog", log: "I'm in space")
        
        //Shouldn't be logged, because we didn't register for MarsLog.
        Logger.log(logTypeIdentifier: "MarsLog", log: "I'm on Mars")
        
        //Should be logger with time interval prefix and appened prefix.
        Logger.log(logTypeIdentifier: "EarthLog", log: "I'm on Earth")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

