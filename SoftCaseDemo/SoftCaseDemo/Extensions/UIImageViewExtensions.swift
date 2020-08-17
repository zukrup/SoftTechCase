//
//  UIImageViewExtensions.swift
//  BaylanMgn
//
//  Created by musa fedakar on 20.12.2018.
//  Copyright © 2018 musa fedakar. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func addShadowToImageNotLayer(blurSize: CGFloat = 8.0){
        
        let shadowColor = UIColor(white:0.2, alpha:0.7).cgColor
        
        guard let image = self.image else {return}
        
        let context = CGContext(data: nil,
                                width: Int(image.size.width + blurSize),
                                height: Int(image.size.height + blurSize),
                                bitsPerComponent: image.cgImage!.bitsPerComponent,
                                bytesPerRow: 0,
                                space: CGColorSpaceCreateDeviceRGB(),
                                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        
        context.setShadow(offset: CGSize(width: blurSize/2,height: -blurSize/2),
                          blur: blurSize,
                          color: shadowColor)
        context.draw(image.cgImage!,
                     in: CGRect(x: 0, y: blurSize, width: image.size.width, height: image.size.height),
                     byTiling:false)
        
        self.image = UIImage(cgImage: context.makeImage()!)
        
    }
}
