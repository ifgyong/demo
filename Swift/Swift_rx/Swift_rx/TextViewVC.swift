//
//  TextViewVC.swift
//  Swift_rx
//
//  Created by Charlie on 2019/4/29.
//  Copyright © 2019年 www.fgyong.cn. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TextViewVC: UIViewController {
    var message = ""
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var `switchsub`: UISwitch!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var textView: UITextView!
    let disposebag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let te = textView.rx
        
        te.didBeginEditing.subscribe(onNext: {
            print("开始编辑了")
        }).disposed(by: disposebag)
        te.didChange.subscribe(onNext: {tt in
            print(tt)
        }).disposed(by: disposebag)
        te.didEndEditing.subscribe(onNext: {tt in
            print("结束编辑")
        }).disposed(by: disposebag)
        
        let b = btn.rx
        b.tap.subscribe { _ in
            print("点击了我")
            self.label.text="点击了"
        }.disposed(by: disposebag)
        
        let sw = switchsub.rx
        sw.isOn.subscribe(onNext: {ison in
            print(ison)
            self.label.text="\(ison)"
        }).disposed(by: disposebag)
        
        let se = segment.rx
        se.selectedSegmentIndex.asObservable().subscribe(onNext: {index in
            print("index:\(index)")
            self.label.text="index:\(index)"
        }).disposed(by: disposebag)
        
        let sli = slider.rx
        sli.value.subscribe(onNext: { value in
            print(value)
            self.label.text="index:\(value)"
            }).disposed(by: disposebag)
        
        
        
        
        let tap = UISwipeGestureRecognizer()
        tap.direction = .down
        self.view.addGestureRecognizer(tap)
        tap.rx.event
            .subscribe(onNext: { (ttap) in
            let pp = ttap.location(in: self.view)
            
            print("x:\(pp.x) y:\(pp.x)")
        }, onError: { (err) in
            
        }, onCompleted: {
            
        }).disposed(by: disposebag)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }

}
