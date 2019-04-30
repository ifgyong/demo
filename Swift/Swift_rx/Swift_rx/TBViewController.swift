//
//  TBViewController.swift
//  Swift_rx
//
//  Created by Charlie on 2019/4/29.
//  Copyright © 2019年 www.fgyong.cn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class TBViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let dis = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    func configUI() -> Void {
        tableView.register(UINib.init(nibName: "MusicCell", bundle: nil), forCellReuseIdentifier: "MusicCell")
        let items = Observable.just([
            "1","Bob","2","haha","你啊"
            ])
        items.bind(to: tableView.rx.items){
            (tableView,row,element) in
            let cell:MusicCell = tableView.dequeueReusableCell(withIdentifier: "MusicCell") as! MusicCell
            cell.nameLabel.text = "\(row): \(element)"
            return cell
            }
            .disposed(by: dis)
     
        let itemSelected = tableView.rx.itemSelected
        itemSelected.subscribe(onNext:{ IndexPath in
            print("选中:\(IndexPath.row)")
            
        }).disposed(by: dis)
        _ = tableView.rx.modelSelected(String.self)
            .subscribe(onNext: {item in
            print(item)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: dis)
        let _move = tableView.rx.itemMoved
        _move.asControlEvent().subscribe(onNext: { (sourceIndex: IndexPath, destinationIndex: IndexPath) in
            print(destinationIndex.count)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: dis)
        
    }
}
