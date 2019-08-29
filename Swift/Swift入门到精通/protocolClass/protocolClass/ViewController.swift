//
//  ViewController.swift
//  protocolClass
//
//  Created by fgy on 2019/8/28.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Foundation

protocol VCDelegate:class {
    func cellClick(_ cell:UITableViewCell,_ index:Int)
}
@objc protocol Runable:AnyObject {
    @objc optional func eat()
}
protocol pcol {
    func test()
}
extension pcol{
    func play(){
        print("play")
    }
}
extension UIButton{
    typealias Clsure = ()->Void
    static private var clsKey =  false
//    var cls = [Clsure](){
//        set
//    }

    var clsArray:[String:[Clsure]]? {
        set{
            if newValue != nil{
                objc_setAssociatedObject(self, &UIButton.clsKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)

            }
        }
        get{
            return (objc_getAssociatedObject(self, &UIButton.clsKey) as? [String : [UIButton.Clsure]])
        }
    }
    private func eventToString (_ ev:UIControl.Event) -> String{
        _ = ""
        let i = ev.rawValue
        return String(i)
//        switch ev {
//        case UIControl.Event.touchUpOutside:ret="touchUpOutside"
//            case UIControl.Event.touchUpInside:ret="touchUpInside"
//            case UIControl.Event.touchDown:ret="touchDown"
//            case UIControl.Event.touchCancel:ret="touchCancel"
//            case UIControl.Event.touchDragExit:ret="touchDragExit"
//            case UIControl.Event.touchDragEnter:ret="touchDragEnter"
//            case UIControl.Event.touchDragInside:ret="touchDragInside"
//            case UIControl.Event.touchDragOutside:ret="touchDragOutside"
//            case UIControl.Event.valueChanged:ret="valueChanged"
//            case UIControl.Event.primaryActionTriggered:ret="primaryActionTriggered"
//            case UIControl.Event.editingDidBegin:ret="editingDidBegin"
//            case UIControl.Event.editingChanged:ret="editingChanged"
//            case UIControl.Event.editingDidEnd:ret="editingDidEnd"
//            case UIControl.Event.editingDidEndOnExit:ret="editingDidEndOnExit"
//            case UIControl.Event.allTouchEvents:ret="allTouchEvents"
//            case UIControl.Event.allEditingEvents:ret="allEditingEvents"
//            case UIControl.Event.applicationReserved:ret="applicationReserved"
//            case UIControl.Event.systemReserved:ret="systemReserved"
//            case UIControl.Event.allEvents:ret="allEvents"
//        default:
//            ret = "None"
//        }
//        return ret
    }
    func addTarget(_ even:UIControl.Event, _ ac:@escaping ()->Void) -> Void  {
        if clsArray == nil{
            clsArray = [String:[Clsure]]()
        }
        self.addTarget(self, action: #selector(click), for: even)
        let key = eventToString(even)
        var array = clsArray![key]
        if array == nil {
            array = [Clsure]()
        }
        array?.append(ac)
        clsArray![key] = array
    }
    @objc private func click(){
        print("123",Date.init())
        let lastEvent = self.allControlEvents
        let str = eventToString(lastEvent)
        
        if (clsArray?.keys.contains(str))!{
            let subArray = clsArray![str]
            for i:Clsure in subArray!{
                i()
            }
        }
        print("手势raw：",str)
    }

    
    
}
class Person {
    class func clsFunc(){
        print("clsfunc")
    }
}
class ViewController: UIViewController,VCDelegate,Runable,pcol {
    func test() {
        
    }
    
    func cellClick(_ cell: UITableViewCell, _ index: Int) {
        
    }
    func eat() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.play()
        addBtns()
        Person.clsFunc()
    }
    func addBtns()  {
        let btn = UIButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        btn.setTitle("btn", for: .normal)
        btn.backgroundColor = UIColor.blue

        btn.addTarget(.touchUpInside) {
            print("closure")
        }
        btn.addTarget(.touchUpOutside) {
            print("closure")
        }
        view.addSubview(btn)
    }


}

