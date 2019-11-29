//
//  ViewController.swift
//  test_image优化
//
//  Created by Charlie on 2019/11/25.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import UIKit
import Accelerate.vImage

class ViewController: UIViewController {
	enum FuncType {
		case FuncType0
		case FuncType1
		case FuncType2
		case FuncType3
		case FuncType4
		case FuncType5
	}
	var imageView: UIImageView = UIImageView()
	typealias imageCallBack = (_ image:UIImage)->Void
	//,"20.jpg","1.jpg" ,"6.HEIC",
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.loadImage()
	}
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.unloadImage()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.white
		
		NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification,
											   object: nil,
											   queue: .main)
		{[weak self] (note) in
			self?.unloadImage()
		}
		NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification,
											   object: nil,
											   queue: .main)
		{[weak self] (note) in
			self?.loadImage()
		}
		
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
				case .FuncType5:
							guard  let image = self.resizedImage5(at: url,
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
//		printImageCost(image: ima)
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
		let shareContext = CIContext(options: [.useSoftwareRenderer:true])
		
		 guard let image = CIImage(contentsOf: url) else { return nil }
		let fillter = CIFilter(name: "CILanczosScaleTransform")
		fillter?.setValue(image, forKey: kCIInputImageKey)
		fillter?.setValue(1, forKey: kCIInputScaleKey)
		guard let outPutCIImage = fillter?.outputImage,let outputCGImage = shareContext.createCGImage(outPutCIImage, from: outPutCIImage.extent) else { return nil }
		
		return UIImage(cgImage: outputCGImage)
	}
	func resizedImage5(at url: URL, for size: CGSize) -> UIImage?{
		// 解码源图像
			guard let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
				let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil),
				let properties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as? [CFString: Any],
				let imageWidth = properties[kCGImagePropertyPixelWidth] as? vImagePixelCount,
				let imageHeight = properties[kCGImagePropertyPixelHeight] as? vImagePixelCount
			else {
				return nil
			}
		
		 // 定义图像格式
			var format = vImage_CGImageFormat(bitsPerComponent: 8,
											  bitsPerPixel: 32,
											  colorSpace: nil,
											  bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.first.rawValue),
											  version: 0,
											  decode: nil,
											  renderingIntent: .defaultIntent)

			var error: vImage_Error

			// 创建并初始化源缓冲区
			var sourceBuffer = vImage_Buffer()
			defer { sourceBuffer.data.deallocate() }
			error = vImageBuffer_InitWithCGImage(&sourceBuffer,
												 &format,
												 nil,
												 image,
												 vImage_Flags(kvImageNoFlags))
			guard error == kvImageNoError else { return nil }

			// 创建并初始化目标缓冲区
			var destinationBuffer = vImage_Buffer()
			error = vImageBuffer_Init(&destinationBuffer,
									  vImagePixelCount(size.height),
									  vImagePixelCount(size.width),
									  format.bitsPerPixel,
									  vImage_Flags(kvImageNoFlags))
			guard error == kvImageNoError else { return nil }

			// 优化缩放图像
			error = vImageScale_ARGB8888(&sourceBuffer,
										 &destinationBuffer,
										 nil,
										 vImage_Flags(kvImageHighQualityResampling))
			guard error == kvImageNoError else { return nil }

			// 从目标缓冲区创建一个 CGImage 对象
			guard let resizedImage =
				vImageCreateCGImageFromBuffer(&destinationBuffer,
											  &format,
											  nil,
											  nil,
											  vImage_Flags(kvImageNoAllocate),
											  &error)?.takeRetainedValue(),
				error == kvImageNoError
			else {
				return nil
			}

			return UIImage(cgImage: resizedImage)

		
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
	func unloadImage() -> Void {
		
	}
	func loadImage() -> Void {
		
	}
	var index = 0
	static var i = 0
	let imagesName = ["1.jpg","2.JPG","6.HEIC"]//["2.jpg","20.jpg" "6.HEIC"];
	var width = UIScreen.main.bounds.width
	var height = UIScreen.main.bounds.height
	func addImage() -> Void {
		
		width /= 2
		height /= 2
		let index = 0
		
		for i in index...index{
			let name = imagesName[i]
			let date = NSDate.init()
			
			addImageDrawNewImage(name: name,
								 funcIndex: .FuncType4,
								 size: CGSize(width: width,height: height))
			{ (image) in
				let imageV = UIImageView.init(image: image)
				imageV.frame = CGRect(x: 0, y: (250 * i) + 0, width:Int( self.width), height: Int (self.height))
				self.view.addSubview(imageV)
				if i == self.imagesName.count-1{
					let now = NSDate.init()
					print("resizedImage timeCost:\(now.timeIntervalSince(date as Date))s")
				}
			}
		}
	}
	var imageV:UIImageView?
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		addImage()
		
//		if let im = imageV {
//			im.tintColor = UIColor.black
//		}else{
//			let bounds = CGRect(x: 0, y: 0, width: width, height: height)
//			let renderer = UIGraphicsImageRenderer(bounds: bounds)
//			 let image = renderer.image { (coxt) in
//				UIColor.red.setFill()
//				let path = UIBezierPath(roundedRect: bounds,
//										cornerRadius: 20)
//				path.addClip()
//				UIRectFill(bounds)
//			}
//			imageV = UIImageView(image: image)
//			imageV?.frame = bounds
//			self.view.addSubview(imageV!)
//		}
//
//		print("\(width) \(height)")
	}
	func drawUsOldFucn() -> Void {
		let bounds = CGRect(x: 0, y: 0, width: width, height: height)
		UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
		UIColor.red.setFill()
		let path = UIBezierPath(roundedRect: bounds,
								cornerRadius: 20)
		path.addClip()
		UIRectFill(bounds)
		
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		let imageV = UIImageView(image: image)
		imageV.frame = bounds
		self.view.addSubview(imageV)
	}
	func getUrlPath(name:String) -> String? {
		let ma = Bundle.main
		let path = ma.path(forResource: name, ofType: nil,inDirectory: nil)
		return path
	}
}

