//
//  IOSUtils.swift
//
//
//  Created by Diogo on 04/05/2016.
//  Copyright © 2016 Merino. All rights reserved.
//

import Foundation

class IOSUtils {
    
   func getIp() -> String? {
        let host = CFHostCreateWithName(nil,"www.google.com").takeRetainedValue()
        CFHostStartInfoResolution(host, .Addresses, nil)
        var success: DarwinBoolean = false
        if let addresses = CFHostGetAddressing(host, &success)?.takeUnretainedValue() as NSArray?,
            let theAddress = addresses.firstObject as? NSData {
            var hostname = [CChar](count: Int(NI_MAXHOST), repeatedValue: 0)
            if getnameinfo(UnsafePointer(theAddress.bytes), socklen_t(theAddress.length),
                           &hostname, socklen_t(hostname.count), nil, 0, NI_NUMERICHOST) == 0 {
                if let numAddress = String.fromCString(hostname) {
                    return numAddress
                }
            }
            return ""
        }else{
            return ""
        }
        
    }
    
    
    /**
        App version.
     
        - Returns: "1.0"
     
    */
    func appVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        _ = dictionary["CFBundleVersion"] as! String
        return version
    }

    /**
        Get formated current date.
     
        - Returns: "EEE, dd MMM yyyy HH:mm"
    */
    func formatCurrentDate() -> String {
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm"
        let dateString = dayTimePeriodFormatter.string(from: Date())
        return dateString
    }
    
    /**
        Simple time ago.
     
        - Parameter dateLong: date time.
        - Returns: "Today", "Yesterday" or "x days ago"
     
    */
    
    
    func formatDateTimeAgo(dateLong: Double) -> String {
       
        let days = (Constants.Time.currentTimeNow() - dateLong) / 86400000;
        
        if days == 0 {
            return "Today";
        }else if days == 1 {
            return "Yesterday"
        }else {
             return "\(Int(days)) days ago";
        }
    }
    
    
    
}
