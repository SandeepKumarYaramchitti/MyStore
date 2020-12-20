//
//  AppSearchController.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 5/26/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit
import SDWebImage

class AppSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellID = "id123"
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter the search above"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.addSubview(enterSearchLabel)
        enterSearchLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        // Step02
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        
        setUpSearchBar()
//        fetchITunesApps()
        
    }
    
    fileprivate func setUpSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    var timer: Timer?
    // Notification on Search Changes
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        // Introduce some delay before search
        // throttling the search
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            // this will fire my query
            Service.shared.fetchApps(searchTerm: searchText) { (res, err) in
                self.appResults = res?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
        
        
        
    }
    
    
    
    // Local variable
    fileprivate var appResults = [Result]()
    
    
    fileprivate func fetchITunesApps() {
        
        Service.shared.fetchApps(searchTerm: "Twitter") { (res, err) in
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
    
            self.appResults = res?.results ?? []
            
      
        }
       
        
    }
    
    // Step 01
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        
        let appResult = appResults[indexPath.item]
        cell.appResult = appResult
        return cell
    }
    
    // Step 03
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    // Step 04
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
}
