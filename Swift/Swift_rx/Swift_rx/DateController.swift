//
//  DateController.swift
//  Swift_rx
//
//  Created by Charlie on 2019/4/29.
//  Copyright © 2019年 www.fgyong.cn. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class DateController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    let dis = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _ = datePicker.rx.date
            .map{[weak self] in
                "当前时间:\($0)"
            }
            .bind(to: label.rx.text)
            .disposed(by: dis)
        
    }

}
