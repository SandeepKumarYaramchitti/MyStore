//
//  AppGroup.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 10/13/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//
// https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json

import UIKit

struct AppGroup: Decodable {
    
    let feed: Feed
    
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100 : String
}
