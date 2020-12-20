//
//  AppPageHeader.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 10/13/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit

class AppPageHeader: UICollectionReusableView {
    
    let appHeaderHorizentalController = AppHeaderHorizentalController()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
//        appHeaderHorizentalController.view.backgroundColor = .purple
        addSubview(appHeaderHorizentalController.view)
        appHeaderHorizentalController.view.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
