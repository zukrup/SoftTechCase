//
//  Scully.swift
//  BaylanMgn
//
//  Created by musa fedakar on 12.08.2018.
//  Copyright © 2018 musa fedakar. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class Scully {

    static let sharedInstance = Scully()
    
    let ACTIVITY_BACKGROUND_TAG = 101
    let  NAV_BAR_HEIGHT : CGFloat = 40.0
    
    let APP_TYPEFACE_REGULAR = "Comfortaa-Light"
    let APP_TYPEFACE_MEDIUM = "Comfortaa-Light"
    let APP_TYPEFACE_BOLD = "Comfortaa-Bold"
    
    lazy var APP_REGULAR_FONT_LARGER_XX : UIFont? = UIFont(name: APP_TYPEFACE_REGULAR, size : 16.0)
    lazy var APP_REGULAR_FONT_LARGER_X : UIFont? = UIFont(name: APP_TYPEFACE_REGULAR, size : 15.0)
    lazy var APP_REGULAR_FONT_LARGER : UIFont? = UIFont(name: APP_TYPEFACE_REGULAR, size : 14.0)
    lazy var APP_REGULAR_FONT_LARGE : UIFont? = UIFont(name: APP_TYPEFACE_REGULAR, size : 13.0)
    lazy var APP_REGULAR_FONT : UIFont? = UIFont(name: APP_TYPEFACE_REGULAR, size : 12.0)
    lazy var APP_REGULAR_FONT_SMALL : UIFont? = UIFont(name: APP_TYPEFACE_REGULAR, size : 11.0)
    lazy var APP_REGULAR_FONT_SMALLER : UIFont? = UIFont(name: APP_TYPEFACE_REGULAR, size : 10.0)
    lazy var APP_REGULAR_FONT_SMALLER_X : UIFont? = UIFont(name: APP_TYPEFACE_REGULAR, size : 9.0)
    lazy var APP_REGULAR_FONT_SMALLER_XX : UIFont? = UIFont(name: APP_TYPEFACE_REGULAR, size : 8.0)
    
    lazy var APP_MEDIUM_FONT_LARGER_XX : UIFont? = UIFont(name: APP_TYPEFACE_MEDIUM, size : 16.0)
    lazy var APP_MEDIUM_FONT_LARGER_X : UIFont? = UIFont(name: APP_TYPEFACE_MEDIUM, size : 15.0)
    lazy var APP_MEDIUM_FONT_LARGER : UIFont? = UIFont(name: APP_TYPEFACE_MEDIUM, size : 14.0)
    lazy var APP_MEDIUM_FONT_LARGE : UIFont? = UIFont(name: APP_TYPEFACE_MEDIUM, size : 13.0)
    lazy var APP_MEDIUM_FONT : UIFont?  = UIFont(name: APP_TYPEFACE_MEDIUM, size: 12.0)
    lazy var APP_MEDIUM_FONT_SMALL : UIFont?  = UIFont(name: APP_TYPEFACE_MEDIUM, size: 11.0)
    lazy var APP_MEDIUM_FONT_SMALLER : UIFont?  = UIFont(name: APP_TYPEFACE_MEDIUM, size: 10.0)
    lazy var APP_MEDIUM_FONT_SMALLER_X : UIFont?  = UIFont(name: APP_TYPEFACE_MEDIUM, size: 9.0)
    lazy var APP_MEDIUM_FONT_SMALLER_XX : UIFont?  = UIFont(name: APP_TYPEFACE_MEDIUM, size: 9.0)
    
    lazy var APP_BOLD_FONT_LARGER_XX : UIFont? = UIFont(name: APP_TYPEFACE_BOLD, size : 16.0)
    lazy var APP_BOLD_FONT_LARGER_X : UIFont? = UIFont(name: APP_TYPEFACE_BOLD, size : 15.0)
    lazy var APP_BOLD_FONT_LARGER : UIFont? = UIFont(name: APP_TYPEFACE_BOLD, size : 14.0)
    lazy var APP_BOLD_FONT_LARGE : UIFont? = UIFont(name: APP_TYPEFACE_BOLD, size : 13.0)
    lazy var APP_BOLD_FONT : UIFont?  = UIFont(name: APP_TYPEFACE_BOLD, size: 12.0)
    lazy var APP_BOLD_FONT_SMALL : UIFont?  = UIFont(name: APP_TYPEFACE_BOLD, size: 11.0)
    lazy var APP_BOLD_FONT_SMALLER : UIFont?  = UIFont(name: APP_TYPEFACE_BOLD, size: 10.0)
    lazy var APP_BOLD_FONT_SMALLER_X : UIFont?  = UIFont(name: APP_TYPEFACE_BOLD, size: 9.0)
    lazy var APP_BOLD_FONT_SMALLER_XX : UIFont?  = UIFont(name: APP_TYPEFACE_BOLD, size: 9.0)
    
    let APP_SP_TOKEN_SELECTOR = "APP_SP_TOKEN_SELECTOR"
    let APP_SP_NOTIFICATION_TOKEN = "APP_SP_NOTIFICATION_TOKEN"
    let APP_SP_USER_ID = "APP_SP_USER_ID"
    let APP_SP_USER_FIRSTNAME = "APP_SP_USER_FIRSTNAME"
    let APP_SP_USER_LASTNAME = "APP_SP_USER_LASTNAME"
    let APP_SP_RETAIL_FIELD_FRONT_ARRAY = "APP_SP_RETAIL_FIELD_FRONT_ARRAY"
    let APP_SP_SIGNAL_R_CONNECTED = "APP_SP_SIGNAL_R_CONNECTED"
    let APP_SP_SIGNAL_R_INIT = "APP_SP_SIGNAL_R_INIT"
    
    public func saveSettings(_ mKey : String,mValue : Int) {
        
        let sharedPref = UserDefaults.standard
        sharedPref.setValue(mValue, forKey: mKey)
        sharedPref.synchronize()
        
    }
    
    public func saveSettings(_ mKey : String,mValue : Bool) {
        
        let sharedPref = UserDefaults.standard
        sharedPref.setValue(mValue, forKey: mKey)
        sharedPref.synchronize()
    }
    
    public func saveSettings(_ mKey: String, mString : String) {
        
        let sharedPref = UserDefaults.standard
        sharedPref.setValue(mString, forKey: mKey)
        sharedPref.synchronize()
    }
    
    public func saveSettings(_ mKey: String, mDouble : Double) {
        let sharedPref = UserDefaults.standard
        sharedPref.setValue(mDouble, forKey: mKey)
        sharedPref.synchronize()
    }
    
    public func GetStringSettings(_ mKey : String) -> String? {
        let retval = UserDefaults.standard.string(forKey: mKey)
        return retval
    }
    
    public func GetBooleanSetting(_ mKey : String ) -> Bool? {
        
        let retval = UserDefaults.standard.bool(forKey: mKey)
        return retval
    }
    
    public func GetIntegerSetting(_ mKey : String ) -> Int {
        
        let retval = UserDefaults.standard.integer(forKey: mKey)
        return retval
    }
    
    public func GetDoubleSettings(_ mKey : String) -> Double {
        let retval = UserDefaults.standard.double(forKey: mKey)
        return retval
    }
    
    public func RemoveSettings(_ mKey : String) {
        UserDefaults.standard.removeObject(forKey: mKey)
    }
    
    public func TokenStringToDate(_ str: String?) -> Date? {
        
        if let tokenStr = str {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en")
            dateFormatter.dateFormat = "EE, dd MMM yyyy HH:mm:ss"
            if let _ = dateFormatter.date(from: tokenStr.replacingOccurrences(of: " GMT", with: "")) {
                return dateFormatter.date(from: tokenStr.replacingOccurrences(of: " GMT", with: ""))
            }
        }
        return nil
    }
    
    public func isoStringToDate(_ str : String?) -> Date? {
        
        if let isoStr = str {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
            if let _ = dateFormatter.date(from: isoStr) {
                return dateFormatter.date(from: isoStr)
            }
            return isoStringToDate(str, withoutMs: true)
        }
        return nil
    }
    
    public func isoStringToDate(_ str : String?, withoutMs : Bool) -> Date? {
        
        if let isoStr = str {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            return dateFormatter.date(from: isoStr)
        }
        return nil
    }
    
    public func isoStringToDate(_ str : String?, withoutMs : Bool, withTimeZone : Bool) -> Date? {
        
        if let isoStr = str {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss+HH:mm"
            return dateFormatter.date(from: isoStr)
        }
        return nil
    }
    
    public func isoStringToDate(_ str : String?, format : String) -> Date? {
        
        if let isoStr = str {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.dateFormat = format
            return dateFormatter.date(from: isoStr)
        }
        return nil
    }
    
    public func dateMonthYearStringToDate(_ str : String?) -> Date? {
        
        if let isoStr = str {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.dateFormat = "dd.MM.yyyy"
            return dateFormatter.date(from: isoStr)
        }
        return nil
    }
    
    public func isoZStringToDate(_ str : String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        return dateFormatter.date(from: str)!
        
    }
    
    public func jsonStringToDate(_ str: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "MMM d, yyyy HH:mm:ss aa"
        return dateFormatter.date(from: str)!
        
    }
    
    func DateToMonthDayString(_ dt : Date?) -> String {
        if let date  = dt {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MMMM"
            let retval = dateFormatter.string(from: date)
            return retval
        }
        else {
            return MyStrings.sharedInstance.NOT_AVAILABLE
        }
    }
    
    func DateToMonthDayShortString(_ dt : Date?) -> String {
        if let date  = dt {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM"
            let retval = dateFormatter.string(from: date)
            return retval
        }
        else {
            return MyStrings.sharedInstance.NOT_AVAILABLE
        }
    }
    
    func DateToMonthDayYearShortString(_ dt : Date?) -> String {
        if let date  = dt {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yy"
            let retval = dateFormatter.string(from: date)
            return retval
        }
        else {
            return MyStrings.sharedInstance.NOT_AVAILABLE
        }
    }
    
    func DateToReadableString(_ dt : Date?) -> String {
        
        if let date  = dt {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.full
            let convertedDate = dateFormatter.string(from: date)
            return convertedDate
        }
        else {
            return MyStrings.sharedInstance.NOT_AVAILABLE
        }
    }
    
    func DateToDayMonthYearString(_ dt : Date?) -> String {
        if let date  = dt {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let retval = dateFormatter.string(from: date)
            return retval
        }
        else {
            return MyStrings.sharedInstance.NOT_AVAILABLE
        }
    }
    
    func DateToMonthYear(_ dt : Date?) -> String {
        if let date  = dt {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM.yyyy"
            let retval = dateFormatter.string(from: date)
            return retval
        }
        else {
            return MyStrings.sharedInstance.NOT_AVAILABLE
        }
    }
    
    func DateToYearMonthDayString(_ dt : Date?) -> String {
        if let date  = dt {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd EEEE"
            let retval = dateFormatter.string(from: date)
            return retval
        }
        else {
            return MyStrings.sharedInstance.NOT_AVAILABLE
        }
    }
    
    func DateToDayMonthYearHourMinString(_ dt : Date?) -> String {
        if let date  = dt {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
            let retval = dateFormatter.string(from: date)
            return retval
        }
        else {
            return MyStrings.sharedInstance.NOT_AVAILABLE
        }
    }
    
    func DateToHourMin(_ dt : Date?) -> String {
        
        if let date  = dt {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let retval = dateFormatter.string(from: date)
            return retval
        }
        else {
            return MyStrings.sharedInstance.NOT_AVAILABLE
        }
        
    }
    
    func DateToDayMonthHourMin(_ dt: Date?) -> String {
        if let date  = dt {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MMMM HH:mm"
            let retval = dateFormatter.string(from: date)
            return retval
        }
        else {
            return MyStrings.sharedInstance.NOT_AVAILABLE
        }
    }
    
    func DateToIsoString(_ dt: Date?) -> String {
        if let date  = dt {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            let retval = dateFormatter.string(from: date)
            return retval
        }
        else {
            return MyStrings.sharedInstance.NOT_AVAILABLE
        }
    }
    
    func TimeAgoTwitterStyle(_ date : Date) -> String {
        
        let dayago = date.dayAgoSimple
        if dayago > 0 {
            return String(dayago) + MyStrings.sharedInstance.DAY_SHORT_STRING
        }
        
        let hourago = date.hourAgoSimple
        if hourago > 0 {
            return String(hourago) + MyStrings.sharedInstance.HOUR_SHORT_STRING
        }
        
        let minago = date.minuteAgoSimple
        return String(minago) + MyStrings.sharedInstance.MIN_SHORT_STRING
        
    }
    
    func MilliSecondsToReadableForm(interval : Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        if #available(iOS 10.0, *) {
            formatter.unitsStyle = .brief
        } else {
            return String(interval / 1000) + " " + MyStrings.sharedInstance.SECOND_SHORT_STRING
        }
        
        return formatter.string(from: TimeInterval(interval))!
        
    }
    
    func DoubleToCurrencyFormat(_ double : Double?) -> String {
        
        var retval : String? = MyStrings.sharedInstance.NOT_AVAILABLE
        if let db = double {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = Locale(identifier: "tr_TR")
            retval = formatter.string(from: NSNumber(value: db))
            //retval = formatter.string(from: NSNumber(db))
        }
        return retval!
    }
    
    func DoubleToLocaleFormat(_ double : Double?, places : Int) -> String {
        var retval : String? = MyStrings.sharedInstance.NOT_AVAILABLE
        if let db = double {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = places
            formatter.maximumFractionDigits = places
            formatter.locale = Locale(identifier: "tr_TR")
            retval = formatter.string(from: NSNumber(value: db.roundToPlaces(places)))
        }
        return retval!
    }
    
    func DoubleToStringFormat(_ double: Double?, places : Int) -> String {
        var retval : String? = MyStrings.sharedInstance.NOT_AVAILABLE
        if let db = double {
            let formatter = NumberFormatter()
            formatter.numberStyle = .none
            formatter.locale = Locale(identifier: "tr_TR")
            retval = formatter.string(from: NSNumber(value: db.roundToPlaces(places)))
        }
        return retval!
    }
    
    func DoubleToPercentFormat(_ double : Double?, places : Int) -> String {
        var retval : String? = MyStrings.sharedInstance.NOT_AVAILABLE
        if let db = double {
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.locale = Locale(identifier: "tr_TR")
            retval = formatter.string(from: NSNumber(value: db.roundToPlaces(places)))
        }
        return retval!
    }
    
    func DoubleToPercentFormat(_ double : Double?) -> String {
        var retval : String? = MyStrings.sharedInstance.NOT_AVAILABLE
        if let db = double {
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            formatter.locale = Locale(identifier: "tr_TR")
            retval = formatter.string(from: NSNumber(value: db))
        }
        return retval!
    }
    
    func ClearAllAlamoImagesFromCache() {
        
        let imageDownloader = UIImageView.af.sharedImageDownloader
        
        imageDownloader.imageCache?.removeAllImages()
        imageDownloader.session.sessionConfiguration.urlCache?.removeAllCachedResponses()
    }
    
    func getCurrentMillis()->Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
    
    func getCurrentMillisStr()->String {
        return String(Int64(Date().timeIntervalSince1970 * 1000))
    }
    
    func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    // MARK: - CGFloat
    
    func degreesToRadians (_ angle: CGFloat) -> CGFloat {
        return (CGFloat (Double.pi) * angle) / 180.0
    }
    
    
    func normalizeValue (
        _ value: CGFloat,
        min: CGFloat,
        max: CGFloat) -> CGFloat {
        return (max - min) / value
    }
    
    
    func convertNormalizedValue (
        _ normalizedValue: CGFloat,
        min: CGFloat,
        max: CGFloat) -> CGFloat {
        return ((max - min) * normalizedValue) + min
    }
    
    
    func clamp (
        _ value: CGFloat,
        minimum: CGFloat,
        maximum: CGFloat) -> CGFloat {
        return min (maximum, max(value, minimum))
    }
    
    
    func aspectHeightForTargetAspectWidth (
        _ currentHeight: CGFloat,
        currentWidth: CGFloat,
        targetAspectWidth: CGFloat) -> CGFloat {
        return (targetAspectWidth * currentHeight) / currentWidth
    }
    
    func randomBetweenNumbers(_ firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    func randomBetwenIntegers(_ firstInt: Int, secondInt: Int) -> Int {
        return Int.random(in: firstInt...secondInt)
    }
    
    func imageSizeLimit(img : UIImage) -> CGSize {
        var fraction : CGFloat = 1.0
        if (img.size.width > 1000) {
            
            fraction = img.size.width / 1000.0
        }
        else if (img.size.height > 1000) {
            fraction = img.size.height / 1000.0
        }
        
        let retval : CGSize = CGSize(width: img.size.width / fraction, height: img.size.height / fraction)
        return retval
    }
    
    func getAppVersion() -> String {
        if let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String {
            return appVersion
        }
        return "0.0"
    }
    
     
}

func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when) {
        closure()
    }
}

func dispatch_on_main(_ block: @escaping ()->()) {
    DispatchQueue.main.async(execute: block)
}

func checkBooleanIsNotNullAndTrue(_b : Bool?)->Bool {
    if let b = _b {
        return b
    }
    else {
        return false
    }
}
