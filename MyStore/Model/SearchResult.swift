//
//  SearchResult.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 5/30/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl60: String
    let formattedPrice: String
    let description: String
    let releaseNotes: String
}
