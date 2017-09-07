//
//  FadeLoopCell.swift
//  UpComingTest
//
//  Created by Rattee Wariyawutthiwat on 9/4/2560 BE.
//  Copyright © 2560 Rattee. All rights reserved.
//

import UIKit

class FadeLoopCell: UIView {
    var label = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(label)
        label.frame = self.frame
        label.textColor = .white
        label.textAlignment = .center
    }
    
    func set(data:FadeLoopData) {
        if let data = data as? MockData {
            label.text = data.title
            self.backgroundColor = data.color
        }
    }
}
