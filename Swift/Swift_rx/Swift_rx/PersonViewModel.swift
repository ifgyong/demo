//
//  PersonViewModel.swift
//  Swift_rx
//
//  Created by Charlie on 2019/4/30.
//  Copyright © 2019年 www.fgyong.cn. All rights reserved.
//

import Foundation
class PersonViewModel: NSObject {
    var user : Person?
    
    init(name:String,usid:Int) {
        self.user = Person(name: name, userid: usid)
    }
    
}
