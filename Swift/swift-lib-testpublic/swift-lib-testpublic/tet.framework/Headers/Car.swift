//
//  Car.swift
//  Swift_rx
//
//  Created by Charlie on 2019/5/7.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation
open class Car: NSObject {
    var name = "car_name"
    private var privateName = "privateName"
    public var publicName = "publicName"
    fileprivate var fileprivateName = "fileprivateName"
    open var openName = "openName"
    
    open func work() -> Void{
        print("car work")
    }
    public func publicWork() -> Void{
        print("car publicwork")
    }
}
public class Car2: Car {
    override init() {
        super.init()
        self.name = ""
        self.publicName = ""
        self.fileprivateName = ""
        self.openName = ""
//        self.privateName = ""
    }
    override public func work() {
        
    }
    override public func publicWork() {
        
    }
    func loadCar() -> Void {
        let car = Car()
        car.fileprivateName = ""
        car.publicName = ""
        car.name = ""
        car.openName = ""
    }
}
