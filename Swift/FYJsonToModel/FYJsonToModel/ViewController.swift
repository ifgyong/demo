//
//  ViewController.swift
//  FYJsonToModel
//
//  Created by Charlie on 2019/5/8.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBAction func valueChange(_ sender: NSPopUpButton) {
        print("str:\(String(describing: sender.selectedItem?.title))")
        sender.title = sender.selectedItem?.title ?? "Objec-C"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var representedObject: Any? {
        didSet {
        }
    }


}

