//
//  API.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//

import Foundation

struct ResponseStatus{
    static let OK = true
    static let Error = false
}

func nsdataToJSON(_ data: Data) -> [String:AnyObject]? {
    do {
        return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
    } catch  _{
        print("dataString = \(NSString(data: data, encoding:String.Encoding.utf8.rawValue)!)")
        return nil
    }
}

class GetDataHttp {
    var url = URL(string: " ")
    let json:AnyObject? = nil
    var paramString = " "
    
    func forData(_ completion: @escaping(_ data:Data?,_ error: NSError?, _ success:Bool) ->()) {
        guard let url = url else {
            completion(nil,nil, ResponseStatus.Error)
            return }
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        
        print(url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            DispatchQueue.main.async (execute: {
                if error != nil{
                    completion(nil,error as NSError?, ResponseStatus.Error)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode >= 400 {
                        print(httpResponse.statusCode)
                        completion(data,nil, ResponseStatus.Error)
                        return
                    }
                }
                
                if let data = data, let json = nsdataToJSON(data){
                    print(json)
                }
                
                completion(data, error as NSError?, true)
                return
            })
        })
        task.resume()
        
    }
    
}
