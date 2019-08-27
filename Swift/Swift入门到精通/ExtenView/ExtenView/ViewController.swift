//
//  ViewController.swift
//  ExtenView
//
//  Created by fgy on 2019/8/27.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.uiview
        let v2 = UIView.init()
        v2.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        v2.backgroundColor = UIColor.red
        view .addSubview(v2)
        v2==|view--<10
        v2|==view>--10
//        v2|==view
        
    }
}

