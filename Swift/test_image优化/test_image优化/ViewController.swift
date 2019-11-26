//
//  ViewController.swift
//  test_image优化
//
//  Created by Charlie on 2019/11/25.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var scrollview: UIScrollView!
	let imagesName = ["6.HEIC","1.jpg","2.jpg"];
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
//		for i in  0..<1{
//			let bounds = UIScreen.main.bounds
//			scrollview.contentSize = CGSize.init(width: (bounds.width * CGFloat(imagesName.count)), height: bounds.height)
//			let im = UIImage.init(named: imagesName[i])
//			let imV = UIImageView()
//			imV.frame = CGRect(x: (bounds.size.width * CGFloat(i)), y: 0, width: bounds.width, height: bounds.height)
//			imV.image = im
//			imV.contentMode = .scaleAspectFit
//			scrollview.addSubview(imV)
//			scrollview.isPagingEnabled=true
//		}
		for i in 0..<3{
			let name = imagesName[i]
			#if false
			addImage2(name)
			#else
			addImage(name: name,index: i)
			#endif
		}
		 
		
	}
	let queue = DispatchQueue.global(qos: .userInitiated)
	
	func addImage2(_ name:String) -> Void {
		let date = NSDate.init()
		
		queue.async {
			let image = UIImage.init(named: name)
			DispatchQueue.main.async {
				let imageV = UIImageView.init(image: image)
				imageV.frame=CGRect(x: 0, y: 0, width: 200, height: 200)
				self.view.addSubview(imageV)
				let now = NSDate.init()
				print("timeCost:\(now.timeIntervalSince(date as Date))")
			}
		}
	}
	func addImage(name:String,index :Int) -> Void {
		let date = NSDate.init()

		queue.async {
			let url = Bundle.main.url(forResource: name, withExtension: nil)!
			guard let image = self.resizedImage(at: url, for: CGSize(width: 200, height: 200))else{
				return ;
			}
			DispatchQueue.main.sync {
				let imageV = UIImageView.init(image: image)
				imageV.frame = CGRect(x: 50, y: (250 * index), width: 200, height: 200)
				self.view.addSubview(imageV)
				if index == 2{
					let now = NSDate.init()
					print("resizedImage timeCost:\(now.timeIntervalSince(date as Date))")
				}
				
			}
		}
	}
	
	
	func resizedImage(at url: URL, for size: CGSize) -> UIImage? {
		guard let image = UIImage(contentsOfFile: url.path) else {
			return nil
		}
		if #available(iOS 10.0, *) {
			let renderer = UIGraphicsImageRenderer(size: size)
			return renderer.image { (context) in
				image.draw(in: CGRect(origin: .zero, size: size))
			}
		}else{
			UIGraphicsBeginImageContext(size)
			image.draw(in: CGRect(origin: .zero, size: size))
			let image = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
			return image
		}
		
	}
	func resizedImage2(at url: URL, for size: CGSize) -> UIImage?{
		guard let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
			let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
		else{
			return nil;
		}
		let cxt = CGContext(data: nil, width: Int(size.width),
							height: Int(size.height), bitsPerComponent: image.bitsPerComponent,
							bytesPerRow: image.bytesPerRow,
							space: image.colorSpace ?? CGColorSpace(name: CGColorSpace.sRGB)!
			, bitmapInfo: image.bitmapInfo.rawValue)
		cxt?.interpolationQuality = .high
		cxt?.draw(image, in: CGRect(origin: .zero, size: size))
		guard let scaledImage = cxt?.makeImage() else {
			return nil
		}
		return UIImage(cgImage: scaledImage)
		
	}
//	import ImageIO
	func resizedImage3(at url: URL, for size: CGSize) -> UIImage?{
		
		let ops:[CFString:Any] = [kCGImageSourceCreateThumbnailFromImageIfAbsent:true,
								  kCGImageSourceCreateThumbnailWithTransform:true,
								  kCGImageSourceShouldCacheImmediately:true,
								  kCGImageSourceThumbnailMaxPixelSize:max(size.width, size.height)]
		guard let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
			let image = CGImageSourceCreateImageAtIndex(imageSource, 0, ops as CFDictionary) else {
				return nil;
		}
		return UIImage(cgImage: image)
	}
	func addView2() -> Void {
		let circleSize = CGSize(width: 600, height: 600)
		let renderer = UIGraphicsImageRenderer(bounds: CGRect(x: 0, y: 0, width: circleSize.width, height: circleSize.height))

		let circleImage = renderer.image{ ctx in
			UIColor.red.setFill()
			ctx.cgContext.setFillColor(UIColor.red.cgColor)
			ctx.cgContext.addEllipse(in: CGRect(x: 0, y: 0, width: circleSize.width, height: circleSize.height))
			ctx.cgContext.drawPath(using: .fill)
		}
		let imageV = UIImageView.init(image: circleImage)
		imageV.frame=CGRect(x: 0, y: 0, width: 60, height: 60)
		view.addSubview(imageV)
	}
	func addsubView() -> Void {
		let circleSize = CGSize(width: 600, height: 600)

			UIGraphicsBeginImageContextWithOptions(circleSize, true, 0)

			// Draw a circle
			let ctx = UIGraphicsGetCurrentContext()!
			UIColor.red.setFill()
			ctx.setFillColor(UIColor.red.cgColor)
			ctx.addEllipse(in: CGRect(x: 0, y: 0, width: circleSize.width, height: circleSize.height))
			ctx.drawPath(using: .fill)

			let circleImage = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
			
			let imageV = UIImageView.init(image: circleImage)
			imageV.frame=CGRect(x: 0, y: 0, width: 60, height: 60)
			view.addSubview(imageV)
	}
	
	var index = 0
	static var i = 0
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		index += 1
		index %= imagesName.count
//		let name = imagesName[index]
		let name  =  imagesName[index]+".jpg"
		let image = UIImage.init(named: name, in:nil , with: nil);
		
		imageView.image = image
		let bytesPerRow = (image?.cgImage?.bytesPerRow ?? 0)
		let height = (image?.cgImage?.height ?? 0)
		let width = (image?.cgImage?.width ?? 0)
		var lastMemoryCost = bytesPerRow * height/1000
		var str = ""
		let byteToM = 1000000
		if lastMemoryCost/byteToM>1{
			str += String(lastMemoryCost/byteToM)
			str += "M"
			lastMemoryCost %= byteToM
		}
		let byteToK = 1000
		if lastMemoryCost > byteToK {
			str += String(lastMemoryCost/byteToK)
			str += "Kb"
			lastMemoryCost %= byteToK
		}
		
		
		ViewController.i+=1
		let v = (width * height * 4/1024/1024)
		
		print("size:\(imageView.frame.size) index:\(ViewController.i) name:\(name) MemoryAdd:\(str) bytesPerRow:\(bytesPerRow)byte h:\(height) w:\(width) cost:h*w*4:\(v)Mb")
	}


	@IBAction func lastPcure(_ sender: Any) {
		let width = UIScreen.main.bounds.width
		var p = scrollview.contentOffset
		p.x -= width
		if p.x < 0{
			return;
		}
		scrollview.setContentOffset(p, animated: true)
	}
//	let index = 1
	@IBAction func next(_ sender: Any) {
		let width = UIScreen.main.bounds.width
		var p = scrollview.contentOffset
		index += 1
		p.x += width
		if p.x > scrollview.contentSize.width {
			return;
		}
		scrollview.setContentOffset(p, animated: true)
//		if index > imagesName.count-1 {return;}
//
////		let queue = DispatchQueue.init(label: "queueue decode image")
////		queue.async {[weak self] in
////
////			DispatchQueue.main.async {
////
////			}
////		}
//		let bounds = UIScreen.main.bounds
//		let path = self.getUrlPath(name: imagesName[self.index])!
////		let url = NSURL(fileURLWithPath: path)
//
//		let im = UIImage(contentsOfFile: path)
//		let imV = UIImageView()
//		imV.contentMode = .scaleAspectFit
//
//		imV.frame = CGRect(x: bounds.width * CGFloat(self.index), y: 0, width: bounds.width, height: bounds.height)
//		imV.image = im
//
//		scrollview.addSubview(imV)
		
	}
	func getUrlPath(name:String) -> String? {
		let ma = Bundle.main
		let path = ma.path(forResource: name, ofType: nil,inDirectory: nil)
		return path
		
	}
}

