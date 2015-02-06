//
//  Logger.swift
//  Logger
//
//  Created by Andrew Hart on 06/02/2015.
//  Copyright (c) 2015 Andrew Hart. All rights reserved.
//

import Foundation

private class LogType {
    let logTypeIdentifier: String
    let appendedPrefix: String
    let shouldDisplayTimeIntervalPrefix: Bool
    
    init(logTypeIdentifier: String, appendedPrefix: String, shouldDisplayTimeIntervalPrefix: Bool) {
        self.logTypeIdentifier = logTypeIdentifier
        self.appendedPrefix = appendedPrefix
        self.shouldDisplayTimeIntervalPrefix = shouldDisplayTimeIntervalPrefix
    }
}

private let _LoggerSharedInstance = Logger()

public class Logger {
    private class var sharedLogger: Logger {
        return _LoggerSharedInstance
    }
    
    //Array of enabled log types.
    private var enabledLogTypes: Array<LogType> = []
    
    ///Registers an identifier for logs, with an appended prefix, and no time interval prefix.
    public class func registerForLogs(#logTypeIdentifier: String, appendedPrefix: String) {
        Logger.registerForLogs(logTypeIdentifier: logTypeIdentifier, appendedPrefix: appendedPrefix, withTimeIntervalPrefix: false)
    }
    
    ///Registers an identifier for logs, with an appended prefix, and possible time interval prefix.
    public class func registerForLogs(#logTypeIdentifier: String, appendedPrefix: String, withTimeIntervalPrefix: Bool) {
        let logType = LogType(logTypeIdentifier: logTypeIdentifier, appendedPrefix: appendedPrefix, shouldDisplayTimeIntervalPrefix: withTimeIntervalPrefix)
        Logger.sharedLogger.enabledLogTypes.append(logType)
    }
    
    //Prints log, without time interval prefix.
    public class func log(log: String) {
        Logger.log(log, withTimeIntervalPrefix: false)
    }
    
    //Displays a log, with optional time interval prefix.
    class func log(log: String, withTimeIntervalPrefix: Bool) {
        var logString = ""
        if withTimeIntervalPrefix {
            logString = logString + "\(NSDate().timeIntervalSince1970) "
        }
        
        logString = logString + log
        
        println(logString)
    }
    
    class func log(#logTypeIdentifier: String, log: String) {
        var logType: LogType?
        
        for enabledLogType: LogType in Logger.sharedLogger.enabledLogTypes {
            if enabledLogType.logTypeIdentifier == logTypeIdentifier {
                logType = enabledLogType
                break
            }
        }
        
        if logType == nil {
            return
        }
        
        var logString = ""
        
        if logType!.shouldDisplayTimeIntervalPrefix {
            logString = logString + "\(NSDate().timeIntervalSince1970) "
        }
        
        logString = logString + logType!.appendedPrefix
        
        logString = logString + log
        
        println(logString)
    }
}