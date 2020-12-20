//
//  VerticleStackView.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 5/30/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit

class VerticleStackView: UIStackView {

    init(arrangeSubViews: [UIView], spacing: CGFloat = 0){
        super.init(frame: .zero)
        self.spacing = spacing
        self.axis = .vertical
        arrangeSubViews.forEach({addArrangedSubview($0)})
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
