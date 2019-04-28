//
//  ViewController.swift
//  Swift_demo_01
//
//  Created by fgy on 2019/4/24.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
class SimpleClass {
    var value: Int = 0
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("file:\(#file),line:\(#line) col:\(#column) func:\(#function)")
    }


}

