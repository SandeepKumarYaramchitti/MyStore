//
//  AppsController.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 6/20/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit

class AppPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "id"
    let headerID = "headerID"
    
    // loading while fetching data from API
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        collectionView.register(AppGroupCell.self, forCellWithReuseIdentifier: cellID)
        
        // To add a cell on top of repeated cells
        // Header: step - 1
        collectionView.register(AppPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        
        fetchData()
    }
    
    
    var socialApps = [SocialApp]()
//    var editorChoiceGames: AppGroup?
    var groups = [AppGroup]()
    
    fileprivate func fetchData() {
        
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        // Help you sync your data fetches together
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchtopGrossing { (appGroup, err) in
            dispatchGroup.leave()
            group1 = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchGames { (appGroup, err) in
            dispatchGroup.leave()
            group2 = appGroup
        }
        
        
        dispatchGroup.enter()
        Service.shared.fetchtopFree { (appGroup, err) in
            dispatchGroup.leave()
            group3 = appGroup
           
        }
        
        dispatchGroup.enter()
        Service.shared.fetchSocialApps { (apps, err) in
            // Check the error
            dispatchGroup.leave()
            self.socialApps = apps ?? []
        }
        // Completion
        dispatchGroup.notify(queue: .main) {
            print("Completed your dispatch group tasks....")
            self.activityIndicatorView.stopAnimating()
            
            if let group = group1 {
                self.groups.append(group)
            }
            
            if let group = group2 {
                self.groups.append(group)
            }
            
            if let group = group3 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    // Header: step - 2
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! AppPageHeader
        header.appHeaderHorizentalController.socialApps = self.socialApps
        header.appHeaderHorizentalController.collectionView.reloadData()
        return header
    }
    
    // Header: step - 3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppGroupCell
        
        let appGroup = groups[indexPath.item]
        cell.titleLabel.text = appGroup.feed.title
        cell.horizenralController.appGroup = appGroup
        cell.horizenralController.collectionView.reloadData()
        // to break retain cycle : [weak self]
        cell.horizenralController.didSelectHandler = { [weak self] feedResult in
            print("Resuled feed is", feedResult.name)
            let controller = AppDetailController()
            controller.appId = feedResult.id
            controller.navigationItem.title = feedResult.name
            self?.navigationController?.pushViewController(controller, animated: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    
    
    
    
    
}
