//
//  SearchResultCell.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 5/26/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    // 1. create init method and override with super.init
    // 2. create UI labels required
    // 3. render it on the UI
    
    var appResult: Result! {
        didSet {
            labelName.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            categoryLabel.text = "Rating: \(appResult.averageUserRating  ?? 0)"
            let url = URL(string: appResult.artworkUrl60)
            appIconImageView.sd_setImage(with: url)
            screeenShot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            if (appResult.screenshotUrls.count > 1) {
               screeenShot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            if (appResult.screenshotUrls.count > 2) {
              screeenShot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let labelName: UILabel = {
       let label = UILabel()
        label.text = "App Name"
        return label
    }()
    
    let categoryLabel: UILabel = {
       let label = UILabel()
       return label
    }()
    
    let ratingLabel: UILabel = {
       let label = UILabel()
        label.text = "9.2M"
        return label
    }()
    
    
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .darkGray
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screeenShot1ImageView = self.createScreenShotImageView()
    lazy var screeenShot2ImageView = self.createScreenShotImageView()
    lazy var screeenShot3ImageView = self.createScreenShotImageView()
    
    func createScreenShotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        // Verticle stackview
        
        let lableStackView = VerticleStackView(arrangeSubViews: [
        labelName, categoryLabel, ratingLabel
        ])
        
        // Horizental stackview
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView, lableStackView, getButton
        ])
        
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenShotStackView = UIStackView(arrangedSubviews: [
        screeenShot1ImageView, screeenShot2ImageView, screeenShot3ImageView
        ])
        screenShotStackView.spacing = 12
        screenShotStackView.distribution = .fillEqually
                
        let overallStackView = VerticleStackView(arrangeSubViews: [
        infoTopStackView, screenShotStackView], spacing: 16)
        
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
