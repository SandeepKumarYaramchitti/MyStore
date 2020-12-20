//
//  Service.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 5/31/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//  THis is a service class

import UIKit

class Service {
    
    static let shared = Service() //Singleton
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
        //Fetch Data from internet
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            if let err = err {
//                print("Failed to fetch apps:", err)
//                completion([], nil)
//                return
//            }
//            // Success
//            guard let data = data else {return}
//            do {
//                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//                //print(searchResult.resultCount)
//                //searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
//                completion(searchResult.results, nil)
//            }catch let jsonErr {
//                print("Failed to decode json:", jsonErr)
//                completion([], jsonErr)
//            }
//
//        }.resume()
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchtopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchtopFree(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchAppGroup(urlString: String , completion: @escaping (AppGroup?, Error?) -> ()) {
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
        
    }
    
//    func fetchSocialApps(completion: ([SocialApp]?, Error? -> Void), {
//        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
//
//    }
    
    func fetchSocialApps(completion: @escaping([SocialApp]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else {return}
        print("Type of T is :", T.self)
        
        URLSession.shared.dataTask(with: url) {data,resp,err in
            if let err = err {
                completion(nil, err)
            }
            do {
                let objects = try  JSONDecoder().decode(T.self , from: data!)
                completion(objects, nil)
            } catch {
                completion(nil, error)
                print("Failed to fetch this data!")
            }
           
        }.resume()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
