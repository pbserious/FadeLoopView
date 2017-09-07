//
//  ViewController.swift
//  UpComingTest
//
//  Created by Rattee Wariyawutthiwat on 9/4/2560 BE.
//  Copyright © 2560 Rattee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fade: FadeLoopView!
    
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fade.setFadeLoopDatas(datas: createMockData())
    }
    
    func createMockData() -> [MockData] {
        return [
            MockData(color: .red, title: "Red"),
            MockData(color: .magenta, title: "Magenta"),
            MockData(color: .orange, title: "Orange"),
            MockData(color: .blue, title: "Blue"),
            MockData(color: .black, title: "Black")
        ]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
