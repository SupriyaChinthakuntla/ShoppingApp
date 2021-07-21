//
//  ANFExploreCardAPIHandler.swift
//  ANF Code Test
//
//  Created by Chinthakuntla, Sai Supriya on 7/21/21.
//

import Foundation
import UIKit

protocol ExploreCardAPI {
    
    func getExploreCardDetails(url: String, completionHandler :@escaping ( _ result: Result<[ExploreCard], Error>) -> Void)
}


class ANFExploreCardAPIHandler: NSObject, ExploreCardAPI {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func getExploreCardDetails(url: String, completionHandler: @escaping (Result<[ExploreCard], Error>) -> Void) {
        guard let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else { return  }
        
        guard let _url = URL(string: escapedAddress) else {
            return
        }
        
        let urlRequest = URLRequest(url: _url)
        
        
        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            if let err = error {
                completionHandler(.failure(err))
            }
            
            
//            do {
//             let jsonResult = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[AnyHashable: Any]]
//
//                for card in jsonResult! {
//                let tille = card["title"] as? String
//
//                }
//
//             } catch {
//             print(error)
//             }
//
            
            do {
                // Initializes a Response object from the JSON data at the top.
                if let results = try? JSONDecoder().decode([ExploreCard].self, from: data!) {
                    completionHandler(.success(results))
                }
            }
            
        }.resume()
    }
    
}
