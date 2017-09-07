//
//  FadeLoopView.swift
//  UpComingTest
//
//  Created by Rattee Wariyawutthiwat on 9/4/2560 BE.
//  Copyright © 2560 Rattee. All rights reserved.
//

import UIKit

class FadeLoopView: UIView {

    var presentingCell: FadeLoopCell?
    var faddingView: UIView?
    
    fileprivate var timer:Timer?
    
    fileprivate var index = 0
    
    fileprivate var fadeLoopData = [FadeLoopData]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setFadeLoopDatas(datas:[FadeLoopData]) {
        guard datas.count > 0 else {
            self.presentingCell?.removeFromSuperview()
            self.presentingCell = nil
            self.backgroundColor = UIColor.darkGray
            return
        }
        self.fadeLoopData = datas
        
        self.backgroundColor = UIColor.clear
        self.index = 0
        self.presentingCell = FadeLoopCell(frame: frame)
        if let view = self.presentingCell {
            self.addSubview(view)
            self.bringSubview(toFront: view)
            view.set(data: datas[0])
        }
        self.timer = Timer.scheduledTimer(timeInterval: 3.0,
                                          target: self,
                                          selector: #selector(self.fadeView),
                                          userInfo: nil,
                                          repeats: true)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.presentingCell?.frame = CGRect(x: 0, y: 0,
                                            width: self.frame.width, height: self.frame.height)
        self.faddingView?.frame = CGRect(x: 0, y: 0,
                                         width: self.frame.width, height: self.frame.height)
    }
    
    func fadeView() {
        index += 1
        if index == fadeLoopData.count{
            index = 0
        }
        if let presentingView = self.presentingCell,
            let faddingView = presentingView.snapshotView(afterScreenUpdates: false) {
            self.addSubview(faddingView)
            presentingView.set(data: fadeLoopData[index])
            
            // Animation Code
            let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
            scaleAnimate.fromValue = 1.0
            scaleAnimate.toValue = 3.0
            scaleAnimate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            UIView.animate(withDuration: 0.7, animations: {
                faddingView.alpha = 0.0
                faddingView.layer.add(scaleAnimate, forKey: "scale")
            }, completion: { _ in
                faddingView.removeFromSuperview()
            })
        }
    }
    
}
