//
//  AppsHeaderCell.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 10/13/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "My Discounts", font: .boldSystemFont(ofSize: 18))
    let titleLable = UILabel(text: "Here are the discounts", font: .systemFont(ofSize: 14))
    
    let imageView = UIImageView(cornerRadious: 8)
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
//        imageView.backgroundColor = .red
        titleLable.numberOfLines = 2
        companyLabel.textColor = .blue
        
        let stackView = VerticleStackView(arrangeSubViews: [companyLabel, titleLable, imageView], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
