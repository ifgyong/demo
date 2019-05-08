//
//  ViewController.swift
//  swift-lib-testpublic
//
//  Created by Charlie on 2019/5/7.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import UIKit
import tet
import CarPlay

class Car3:Car {
    init() {
        self.openName = ""
        self.publicName = ""
        self.name = ""
        
    }
    override func work() {
        
    }
    override func publicWork() {
        
    }
}
class Car4: Car2 {
    override func work() {
        
    }
    override func publicWork() {
        
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

