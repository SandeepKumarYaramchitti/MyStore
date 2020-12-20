//
//  Extensions.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 10/12/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberofLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberofLines
    }
}

extension UIImageView {
    convenience init(cornerRadious: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadious
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}
