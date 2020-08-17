//
//  UIColorExtensions.swift
//  MyX
//
//  Created by Musa Fedakar on 16/06/16.
//  Copyright © 2016 Br Magazacilik. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func primaryFg() -> UIColor {
        return UIColor(named: "ColorPrimaryForeground")!
    }
    
    class func primaryFg(_ a: CGFloat) -> UIColor {
        return UIColor(named: "ColorPrimaryForeground")!.setBrightness(a)
    }
    
    class func secondaryFg() -> UIColor {
        return UIColor(named: "ColorSecondaryForeground")!
    }
    
    class func secondaryFg(_ a: CGFloat) -> UIColor {
        return UIColor(named: "ColorSecondaryForeground")!.setBrightness(a)
    }
    
    
    class func primaryBg() -> UIColor {
        return UIColor(named: "ColorPrimaryBackground")!
    }
    
    class func secondaryBg() -> UIColor {
        return UIColor(named: "ColorSecondaryBackground")!
    }
    
    class func alternateColor() -> UIColor {
        return UIColor(named: "ColorAlternate")!
    }
    
    class func colorDefaultGradient1Color() -> UIColor {
        return UIColor(named: "ColorNotifyDefaultGradient-1")!
    }
    
    class func colorDefaultGradient2Color() -> UIColor {
        return UIColor(named: "ColorNotifyDefaultGradient-2")!
    }
    
    class func colorPrimaryGradient1Color() -> UIColor {
        return UIColor(named: "ColorNotifyPrimaryGradient-1")!
    }
    
    class func colorPrimaryGradient2Color() -> UIColor {
        return UIColor(named: "ColorNotifyPrimaryGradient-2")!
    }
    
    class func accentColor(_ alpha : CGFloat) -> UIColor {
        return UIColor(red: 0.9960784, green: 0.227450, blue: 0.486274, alpha: alpha)
    }
    
    class func blackColor(_ alpha : CGFloat) -> UIColor {
        return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: alpha)
    }
    
    class func whiteColor(_ alpha : CGFloat) -> UIColor {
        return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: alpha)
    }
    
    class func tealColor(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: 0, green: 0.58823, blue: 0.53333, alpha: alpha)
    }
    
    class func appDarkTealColor(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: 0, green: 98.0/255.0, blue: 99.0/255.0, alpha: alpha)
    }
    
    class func BlueTintColor(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: 63.0 / 255.0, green: 136.0 / 255.0, blue: 251.0/255.0 , alpha: alpha)
    }
    
    class func GrayTintColor(_ value : Int, alpha : CGFloat) -> UIColor {
        return UIColor(red: CGFloat(value) / 255.0, green: CGFloat(value) / 255.0, blue: CGFloat(value) / 255.0 , alpha: alpha)
    }
    
    class func darkTealColor(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: 0, green: 0.18823, blue: 0.13333, alpha: alpha)
    }
    
    class func goldColor(_ alpha : CGFloat) -> UIColor {
        return UIColor(red: 1.0, green: 215.0 / 255.0, blue: 0.0, alpha: alpha)
    }
    
    class func platinumColor(_ alpha : CGFloat) -> UIColor {
        return UIColor(red: 129.0 / 255.0, green: 128.0 / 255.0, blue: 126.0 / 255.0, alpha: alpha) //229, 228, 226
    }
    
    class func darkRedColor(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: 139.0 / 255.0, green: 0.0, blue: 0.0, alpha: alpha)
    }
    
    class func darkGoldColor(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: 180.0 / 255.0, green: 105.0 / 255.0, blue: 45.0 / 255.0, alpha: alpha)
    }
    
    class func lightGoldColor(_ alpha: CGFloat) -> UIColor {
        //251, 228, 128)
        return UIColor(red: 251.0 / 255.0, green: 228.0 / 255.0, blue: 128.0 / 255.0, alpha: alpha)
    }
    
    class func lightTurquoise(_ alpha : CGFloat) -> UIColor {
        return UIColor(red: 183.0 / 255.0, green: 248.0 / 255.0, blue: 219.0 / 255.0, alpha: alpha)
    }
    
    class func lightTurquoiseGreen(_ alpha : CGFloat) -> UIColor {
        return UIColor(red: 32.0 / 255.0, green: 167.0 / 255.0, blue: 194.0 / 255.0, alpha: alpha)
    }
    
    class func sinRedLight(_ alpha : CGFloat) -> UIColor {
        return UIColor(red: 237.0 / 255.0, green: 33.0 / 255.0, blue: 58.0 / 255.0, alpha: alpha)
    }
    
    class func sinRed(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: 147.0 / 255.0, green: 41.0 / 255.0, blue: 30.0 / 255.0, alpha : alpha)
    }
  
    class func soundCloudOrangeLight(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: 254.0 / 255.0, green: 140.0 / 255.0, blue: 0.0, alpha: alpha)
    }
    
    class func soundCloudOrange(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: 248.0 / 255.0, green: 54.0 / 255.0, blue: 0.0, alpha: alpha)
    }
    
    class func mossGreenDark(_ alpha : CGFloat) -> UIColor {
        return UIColor(red: 19.0 / 255.0, green: 78.0 / 255.0, blue: 94.0 / 255.0, alpha: alpha)
    }
    
    class func mossGreen(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: 113.0 / 255.0, green: 178.0 / 255.0, blue: 128.0 / 255.0, alpha: alpha)
    }
    
    class func whiteTintColor(_ alpha : CGFloat) -> UIColor {
        return UIColor(red: 0.910, green: 0.918, blue: 0.933, alpha: alpha)
    }
    
    class func randomColor () -> UIColor {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed,
                       green: randomGreen,
                       blue: randomBlue,
                       alpha: 1.0)
    }
    
    class func randomColor (_ alpha : CGFloat) -> UIColor {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed,
                       green: randomGreen,
                       blue: randomBlue,
                       alpha: alpha)
    }
    
    class func RGBColor (
        _ r: CGFloat,
        g: CGFloat,
        b: CGFloat) -> UIColor {
        return UIColor (red: r / 255.0,
                        green: g / 255.0,
                        blue: b / 255.0,
                        alpha: 1)
    }
    
    class func RGBAColor (
        _ r: CGFloat,
        g: CGFloat,
        b: CGFloat,
        a: CGFloat) -> UIColor {
        return UIColor (red: r / 255.0,
                        green: g / 255.0,
                        blue: b / 255.0,
                        alpha: a)
    }
    
    class func BarTintRGBColor (
        _ r: CGFloat,
        g: CGFloat,
        b: CGFloat) -> UIColor {
        return UIColor (red: (r / 255.0) - 0.12,
                        green: (g / 255.0) - 0.12,
                        blue: (b / 255.0) - 0.12,
                        alpha: 1)
    }
    
    class func Gray (_ gray: CGFloat) -> UIColor {
        return self.RGBColor(gray, g: gray, b: gray)
    }
    
    class func Gray (_ gray: CGFloat, alpha: CGFloat) -> UIColor {
        return self.RGBAColor(gray, g: gray, b: gray, a: alpha)
    }
    
    class func CardHeaderColor () -> UIColor {
        return Gray(242)
    }
    
    class func CardCellColor () -> UIColor {
        return Gray(249)
    }
    
    class func CardBorderColor () -> UIColor {
        return Gray(200)
    }
    
    
    class func RippleColor () -> UIColor {
        return UIColor.Gray(51, alpha: 0.1)
    }
    
    class func ShadowColor () -> UIColor {
        return UIColor.Gray(51)
    }
    
    
    class func TitleColor () -> UIColor {
        return Gray(51)
    }
    
    class func TextColor () -> UIColor {
        return Gray(144)
    }
    
    func setBrightness(_ bFloat : CGFloat) -> UIColor {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        var retval : UIColor = UIColor.white
        
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            retval = UIColor(red: fRed*bFloat, green: fGreen*bFloat, blue: fBlue*bFloat, alpha: fAlpha)
        }
        return retval
    }
    
}
