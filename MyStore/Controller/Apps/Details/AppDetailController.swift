//
//  AppDetailController.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 11/22/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var appId: String! {
        didSet {
            print("Here is my App ID:", appId ?? "")
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, err) in
                
                let app = result?.results.first
                self.app = app
                DispatchQueue.main.sync {
                    self.collectionView.reloadData()
                }
                
            }
        }
    }
    
    var app: Result?
    let cellID = "cellid"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: cellID)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppDetailCell
        cell.nameLabel.text = app?.trackName
        cell.releaseNotesLabel.text = app?.releaseNotes
        cell.appImageView.sd_setImage(with: URL(string: app?.artworkUrl60 ?? ""))
        cell.priceButton.setTitle(app?.formattedPrice, for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 600)
    }
    
    
}
