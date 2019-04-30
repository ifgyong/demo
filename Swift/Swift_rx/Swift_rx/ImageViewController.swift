//
//  ImageViewController.swift
//  Swift_rx
//
//  Created by Charlie on 2019/4/30.
//  Copyright © 2019年 www.fgyong.cn. All rights reserved.
//
import Kingfisher
import SnapKit
import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var textview: UITextView!
    let imaegV = UIImageView.init()
    let labelpro = UILabel.init()
    var indexImage = 0
    
    
    @IBAction func downloadUrl(_ sender: UIButton) {
        ImageCache.default.clearDiskCache()
        ImageCache.default.clearMemoryCache()
        let listurl = ["http://img.mp.sohu.com/upload/20170807/3a171960d67946348a20cccc295efc0d_th.png",
                       "http://attachments.gfan.com/forum/attachments2/201410/16/1144349mwgw1xwmgz6w9m1.gif",
                       "http://5b0988e595225.cdn.sohucs.com/images/20170913/f362d6ba4a084691aaefb7b34913f685.gif",
                       "http://img.mp.sohu.com/upload/20170620/fc530eea1b7641d99c40b428ef7b56ae_th.png",
                       "http://s3.sinaimg.cn/orignal/4c0ed6e9dc5bdc92d78e2",
                       "http://imgsrc.baidu.com/forum/w=580/sign=0aa2fc04ed1190ef01fb92d7fe1a9df7/b7c2912397dda14422a3405bb8b7d0a20df48642.jpg",
                       "http://sns.people.com.cn/uploads/figureCaptions/Image/e8/bd/bb/e7bab1e5a682e99c9e2e626c6f67/1500166540726.gif"]
        indexImage += 1
        indexImage %= listurl.count
        
        if listurl.count>0{
            let url = URL(string: listurl[indexImage])
            
            imaegV.kf.setImage(with: url, placeholder: nil,
                               options: [KingfisherOptionsInfoItem.onlyLoadFirstFrame],
                               progressBlock:{ receivedSize,  totalSize  in
                                let current:CGFloat = CGFloat(receivedSize)/CGFloat(totalSize)
                                self.labelpro.text = String(format:"当前下载进度:%.02f",current)
            },
                               completionHandler: { (image, err, cacheType, url) in
                                if err != nil{
                                    self.labelpro.text = err.debugDescription
                                }
            })
            sender.setTitle("顺序下载", for: .normal)
        }else{
            sender.setTitle("请填写正确url", for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let url = URL(string: "http://img.mp.itc.cn/upload/20160909/8e3f3181a20a41cb991b6c5b6d0e7aa3_th.gif")
        
        imaegV.kf.setImage(with: url)
        addImage()
    }

    func addImage() -> Void {
        self.view.addSubview(imaegV)
        self.view.addSubview(labelpro)
        imaegV.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view.snp_topMargin).offset(100)
            make.height.equalTo(300)
        }
        labelpro.snp.makeConstraints { (make) in
            make.left.right.equalTo(imaegV)
            make.top.equalTo(imaegV.snp_bottomMargin).offset(30)
            make.height.equalTo(15)
        }
        labelpro.textColor = UIColor.black
        labelpro.text = "进度"
        labelpro.textAlignment = NSTextAlignment.center
        labelpro.font = UIFont.boldSystemFont(ofSize: 15)
    }

}
