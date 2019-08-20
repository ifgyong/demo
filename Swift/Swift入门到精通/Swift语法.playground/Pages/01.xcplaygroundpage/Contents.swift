import UIKit
import PlaygroundSupport

var a = 10
var  b = 11
var c = a + b

import UIKit
let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
view.backgroundColor = UIColor.red
PlaygroundPage.current.liveView = view

let imaeV = UIImageView.init(image: UIImage.init(named: "logo"))
PlaygroundPage.current.liveView = imaeV


let vc = UIViewController()
vc.view.backgroundColor = UIColor.lightGray
PlaygroundPage.current.liveView = vc
var str = "Hello, playground"
