//
//  FYTableViewVC.swift
//  Swift_rx
//
//  Created by Charlie on 2019/4/29.
//  Copyright © 2019年 www.fgyong.cn. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class Music: NSObject {
    var name = ""
    var signer = ""
    init(name:String,sier:String) {
        self.name = name
        self.signer = sier
    }
    
}
struct MusicListViewModel {
    let data = Observable.just([
        Music(name: "五条", sier: "陈奕迅"),
        Music(name: "曾是少年", sier: "S.H.E"),
        Music(name: "从前的我", sier: "陈结义"),
        ])
    
    
}
class FYTableViewVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let obj = Observable.of("1","B","C")
        obj.subscribe{oo in
            print(oo)
        }
        
        
        
    }



}
