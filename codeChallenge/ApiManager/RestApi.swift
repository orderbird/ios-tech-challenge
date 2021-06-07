//
//  RestApi.swift
//  codeChallenge
//
//  Created by Astha yadav on 04/06/21.
//  Copyright © 2021 Fernando Suárez. All rights reserved.
//

import Foundation
import UIKit
import Contacts

class RestApi : NSObject {
    
    static var sharedInstance:RestApi {
        let instance = RestApi()
        return instance
    }

    @objc func getFlikerPhotosApi(pageNo:Int,perPageCount:Int,sort:String){
        
        let extra = "date_taken,views,description,date_upload,date_taken,owner_name,icon_server,original_format,last_update,views,media,url_t,url_l"
       let FLICKR_APIKEY  = "2ed35a9f4fda03bc96e73dbd03602780"
       let tags = "cooking"
       let BASEURL = "https://api.flickr.com/services/rest/"
       let requestParams = String(format: "method=flickr.photos.search&api_key=%@&tags=%@&page=%ld&per_page=%ld&format=json&nojsoncallback=1&sort=%@&extras=%@", FLICKR_APIKEY,tags,pageNo,perPageCount,sort,extra)
        
        let completeUrlString = String(format: "%@?%@", BASEURL,requestParams)
        
        print(completeUrlString)
        let session = URLSession.shared
        guard let url = URL(string: completeUrlString) else { return }
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error == nil {
                do {
                    if let jsonData = data {
                        let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
                                
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getJSON"), object: self, userInfo: json)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }else{
                print(error?.localizedDescription ?? "Error")
            }
        })
        task.resume()
    }
        
}
