//
//  ViewController.swift
//  SwiftCode
//
//  Created by fgy on 2019/8/30.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class Person{
	var age = 10
	var name = ""
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		let pp = Mirror.init(reflecting: Person.init())
		for i in pp.children{
			print(i)
		}

	}


}

