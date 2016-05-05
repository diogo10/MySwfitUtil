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
    
}
