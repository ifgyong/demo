//
//  ViewController.swift
//  Swift_rx
//
//  Created by Charlie on 2019/4/29.
//  Copyright © 2019年 www.fgyong.cn. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit
import RxCocoa
import Kingfisher


class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let disposebag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.placeholder = "默认输入文字 label展示文字"
        let test =  textField.rx
            test.text.orEmpty
                .filter({ (Str) -> Bool in
                    return Str.count<10
                })
                .subscribe(onNext: { ss  in
                    self.label.text = ss
                })
                .disposed(by: disposebag)
        let vcs = [
            "DateController",
            "TBViewController",
            "TextViewVC",
            "FYTableViewVC",
            "ImageViewController"]
        textField.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(self.view).offset(15)
            ConstraintMaker.right.equalTo(self.view.snp_rightMargin).offset(-15)
            ConstraintMaker.top.equalTo(self.view).offset(20+64+20)
            ConstraintMaker.height.equalTo(40)
        }
        label.snp.makeConstraints { (make) in
            make.left.right.equalTo(textField)
            make.top.equalTo(textField.snp_bottomMargin).offset(30)
            make.height.greaterThanOrEqualTo(15)
        }
        label.backgroundColor = UIColor.lightGray
        let model = Observable.just(vcs)
        
        tableView.register(UINib.init(nibName: "MusicCell", bundle: nil), forCellReuseIdentifier: "MusicCell")
        model.bind(to: tableView.rx.items){ (tableView, row, element) in
            let cell:MusicCell = tableView.dequeueReusableCell(withIdentifier: "MusicCell") as! MusicCell
            cell.nameLabel.text = element
            cell.selectionStyle = .none
            cell.singerLabel.text = ""
            return cell
        }
            .disposed(by: disposebag)
        let ts = tableView.rx
        ts.itemSelected.subscribe(onNext: { (IndexPath) in
            var vc:UIViewController = DateController.init(nibName: "DateController", bundle: nil)
            
            switch IndexPath.row{
                case 0:
                    vc = DateController.init(nibName: "DateController", bundle: nil)
                break
                case 1:
                    vc = TBViewController.init(nibName: "TBViewController", bundle: nil)
                break
                case 2:
                    vc = TextViewVC.init(nibName: "TextViewVC", bundle: nil)
                break
                case 3:
                    vc = FYTableViewVC.init(nibName: "FYTableViewVC", bundle: nil)
                break
                case 4:
                    vc = ImageViewController.init(nibName: "ImageViewController", bundle: nil)
                    break
            default:
                 print("all skip")
            }

            self.navigationController?.pushViewController(vc, animated: true)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposebag)
        
        

        
//        test()
//        addText()
//        changeFontSize()
    }
    func test() -> Void {
        _ = Observable.of("A","B","C")
        .subscribe(onNext: { (oo) in
            print(oo)
        }, onError: { (err) in
            print(err)
        }, onCompleted: {
            print("complate")
        }) {
            print("disposed")
        }
    }
    func addText() -> Void {
         _ = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .map {
                "索引是\($0)"
                }
            .bind{[weak self](text) in
                self?.label.text = text
                }
    }
    func changeFontSize() -> Void {
        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .map{CGFloat($0)}
            .bind(to: label.fontSize)
        .disposed(by: disposebag)
    }
    func changeAttriText() -> Void {
        let timet = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        timet.map (formatTimeInterval)
            .bind(to: label.rx.attributedText)
            .disposed(by: disposebag)
    }

    //将数字转成对应的富文本
    func formatTimeInterval(ms: NSInteger) -> NSMutableAttributedString {
        let string = String(format: "%0.2d:%0.2d.%0.1d",
                            arguments: [(ms / 600) % 600, (ms % 600 ) / 10, ms % 10])
        //富文本设置
        let attributeString = NSMutableAttributedString(string: string)
        //从文本0开始6个字符字体HelveticaNeue-Bold,16号
        attributeString.addAttribute(NSAttributedString.Key.font,
                                     value: UIFont(name: "HelveticaNeue-Bold", size: 16)!,
                                     range: NSMakeRange(0, 5))
        //设置字体颜色
        attributeString.addAttribute(NSAttributedString.Key.foregroundColor,
                                     value: UIColor.white, range: NSMakeRange(0, 5))
        //设置文字背景颜色
        attributeString.addAttribute(NSAttributedString.Key.backgroundColor,
                                     value: UIColor.orange, range: NSMakeRange(0, 5))
        return attributeString
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
extension UILabel{
    public var fontSize:Binder<CGFloat>{
        return Binder(self) {label,fontsize in
            label.font = UIFont.systemFont(ofSize: fontsize)
        }
    }
}
