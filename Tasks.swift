import Foundation


class Tasks {
    
    func get(getUrl: String, completation: @escaping (_ youtubeData: YoutubeData?) -> Void) -> URLSessionTask {
        
        let url = NSURL(string: getUrl)
        let session =  URLSession.shared
        
        let task : URLSessionDataTask = session.dataTask(with: url! as URL, completionHandler: { (data, response, error ) -> Void in
            
            if error != nil{
                completation(nil)
            }else{
                
                do{
                    let myJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSArray
                    print(myJSON)
                    
                    completation(nil)
                }catch{
                    print(error)
                    completation(nil)
                }
                
            }
            
        })
        
        
        task.resume()
        return task
    }
}
