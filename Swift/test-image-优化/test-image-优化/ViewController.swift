//
//  ViewController.swift
//  test_image优化
//
//  Created by Charlie on 2019/11/25.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	enum FuncType {
		case FuncType0
		case FuncType1
		case FuncType2
		case FuncType3
		case FuncType4
	}
	var imageView: UIImageView = UIImageView()
	typealias imageCallBack = (_ image:UIImage)->Void
	//,"20.jpg","1.jpg" ,"6.HEIC",
	let imagesName = ["1.jpg","6.HEIC"]//["2.jpg","20.jpg" "6.HEIC"];
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.white
		
	
	}
	let queue = DispatchQueue.global(qos: .userInitiated)
	func addImageDrawNewImage(name:String ,funcIndex:FuncType, size:CGSize, callBack: @escaping (UIImage)->Void) -> Void {

		queue.async {
			let url = Bundle.main.url(forResource: name, withExtension: nil)!

			switch funcIndex{
			case .FuncType0:
				let image = UIImage(named: name)!
				DispatchQueue.main.async {
					callBack(image)
				}
			case .FuncType1:
				guard  let image = self.resizedImage(at: url,
													for: size)
					else{
						return ;
				}
				DispatchQueue.main.async {
					callBack(image)
				}
				
			case .FuncType2:
			
				guard  let image = self.resizedImage2(at: url,
													 for: size)
					else{
					return ;
				}
				DispatchQueue.main.async {
					callBack(image)
				}
			case .FuncType3:
				guard  let image = self.resizedImage3(at: url,
													 for: size)
					else{
					return ;
				}
				DispatchQueue.main.async {
					callBack(image)
				}
			case .FuncType4:
				guard  let image = self.resizedImage4(at: url,
													 for: size)
					else{
					return ;
				}
				DispatchQueue.main.async {
					callBack(image)
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
			printImageCost(image: image!)
			return image
		}
	}
	func resizedImage2(at url: URL, for size: CGSize) -> UIImage?{
		guard let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
			let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
		else{
			return nil;
		}
		let cxt = CGContext(data: nil,
							width: Int(size.width),
							height: Int(size.height),
							bitsPerComponent: image.bitsPerComponent,
							bytesPerRow: image.bytesPerRow,
							space: image.colorSpace ?? CGColorSpace(name: CGColorSpace.sRGB)!
			,
							bitmapInfo: image.bitmapInfo.rawValue)
		cxt?.interpolationQuality = .high
		cxt?.draw(image, in: CGRect(origin: .zero, size: size))
		guard let scaledImage = cxt?.makeImage() else {
			return nil
		}
		let ima = UIImage(cgImage: scaledImage)
		printImageCost(image: ima)
		return ima
		
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
		let ima = UIImage(cgImage: image)
		printImageCost(image: ima)
		return ima
	}
	func resizedImage4(at url: URL, for size: CGSize) -> UIImage?{
		let image = UIImage(contentsOfFile: url.path)
		printImageCost(image: image!)
		return image
		
	}
	func printImageCost(image:UIImage) -> Void {
		let imageCG = image.cgImage
		let cost1 = imageCG!.bytesPerRow * (imageCG?.height ?? 1)
		let cost2 = imageCG!.height * imageCG!.width * 4
		print("imageCost1: \(cost1/1024)KB 大约\(cost1/1024/1024)M cost2:\(cost2/1024)KB 大约\(cost2/1024/1024)MB")
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
	func addImage() -> Void {
		for i in 1..<2{
			let name = imagesName[i]
			let date = NSDate.init()
			
			addImageDrawNewImage(name: name,
								 funcIndex: .FuncType2,
								 size: CGSize(width: 800,height: 800))
			{ (image) in
				let imageV = UIImageView.init(image: image)
				imageV.frame = CGRect(x: 50, y: (250 * i) + 100, width: 200, height: 200)
				//self.view.addSubview(imageV)
				if i == self.imagesName.count-1{
					let now = NSDate.init()
					print("resizedImage timeCost:\(now.timeIntervalSince(date as Date))s")
				}
			}
		}
	}
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		addImage()
		
		
//		let name  =  "1.jpg"
//		let image = UIImage(named: name);
//
//		imageView.image = image
//		let bytesPerRow = (image?.cgImage?.bytesPerRow ?? 0)
//		let height = (image?.cgImage?.height ?? 0)
//		let width = (image?.cgImage?.width ?? 0)
//		var lastMemoryCost = bytesPerRow * height/1000
//		var str = ""
//		let byteToM = 1000000
//		if lastMemoryCost/byteToM>1{
//			str += String(lastMemoryCost/byteToM)
//			str += "M"
//			lastMemoryCost %= byteToM
//		}
//		let byteToK = 1000
//		if lastMemoryCost > byteToK {
//			str += String(lastMemoryCost/byteToK)
//			str += "Kb"
//			lastMemoryCost %= byteToK
//		}
//
//
//		ViewController.i+=1
//		let v = (width * height * 4/1024/1024)
//
//		print("size:\(imageView.frame.size) index:\(ViewController.i) name:\(name) MemoryAdd:\(str) bytesPerRow:\(bytesPerRow)byte h:\(height) w:\(width) cost:h*w*4:\(v)Mb")
	}
	func getUrlPath(name:String) -> String? {
		let ma = Bundle.main
		let path = ma.path(forResource: name, ofType: nil,inDirectory: nil)
		return path
	}
}

