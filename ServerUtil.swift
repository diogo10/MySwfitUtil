//
//  ServerUtil.swift
//
//  Created by Diogo on 12/01/2017.
//  Copyright © 2017 ienquire. All rights reserved.
//

import Foundation


class ServerUtil{
    
    
    let BASE_URL = ""
    
    //MARK: NETWORK METHODS
    
    /**
     *
     *
     *   *Parameters*
     *      * let jsonObject: NSMutableDictionary = NSMutableDictionary()
     *      * jsonObject.setValue(gigId, forKey: "gigId")
     *
     */
    func post(url: String,parameters: NSMutableDictionary,completionHandler: @escaping (String?) -> Void ){
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let jsonData: NSData
        
        do {
            jsonData = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions()) as NSData
            let jsonString = NSString(data: jsonData as Data, encoding: String.Encoding.utf8.rawValue) as! String
            request.httpBody = jsonString.data(using: .utf8)
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(error)")
                    completionHandler(nil)
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response)")
                    completionHandler(nil)
                }
                
                let responseString = String(data: data, encoding: .utf8)
                completionHandler(responseString!)
            }
            task.resume()
            
            
            
        } catch _ {
            print ("JSON Failure")
            completionHandler("ERROR")
        }
        
        
    }
    
    
    @discardableResult
    func get(getUrl: String, completation: @escaping (_ result: NSDictionary?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let url = NSURL(string: getUrl)
            let session =  URLSession.shared
            
            let task : URLSessionDataTask = session.dataTask(with: url! as URL, completionHandler: { (data, response, error ) -> Void in
                
                if error != nil{
                    completation(nil)
                }else{
                    
                    do{
                        let myJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                        completation(myJSON)
                    }catch{
                        print(error)
                        completation(nil)
                    }
                    
                }
                
            })
            
            
            task.resume()
        }
    }
}
