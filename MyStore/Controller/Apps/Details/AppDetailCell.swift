//
//  AppDetailCell.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 12/5/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    let appImageView = UIImageView(cornerRadious: 16)
    let nameLabel = UILabel(text: "Item Name", font: .boldSystemFont(ofSize: 24), numberofLines: 2)
    let priceButton = UIButton(title: "$4.99")
    let whatsNewLabel = UILabel(text: "What's new", font: .boldSystemFont(ofSize: 20), numberofLines: 1)
    let releaseNotesLabel = UILabel(text: "Discount Notes", font: .systemFont(ofSize: 16), numberofLines: 0)
    
    override init(frame: CGRect) {
        
        
        super.init(frame: frame)
        backgroundColor = .lightGray
        appImageView.constrainWidth(constant: 140)
        appImageView.constrainHeight(constant: 140)
        priceButton.backgroundColor = .blue
        priceButton.constrainHeight(constant: 32)
        priceButton.layer.cornerRadius = 32/2
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        priceButton.setTitleColor(.white, for: .normal)
        priceButton.constrainWidth(constant: 80)
        
        let stackView = VerticleStackView(arrangeSubViews: [
        UIStackView(arrangedSubviews: [
        appImageView,
        VerticleStackView(arrangeSubViews: [
           nameLabel,
           UIStackView(arrangedSubviews: [priceButton, UIView()])
        ], spacing: 12)
        ], customSpacing: 20),
        whatsNewLabel,
        releaseNotesLabel
        ], spacing: 16)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIStackView {
    
//    convenience init(arrangedSubViews: [UIView], customSpacing: CGFloat = 0) {
//        self.init(arrangedSubviews: arrangedSubViews)
//        self.spacing = customSpacing
//    }
    
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
