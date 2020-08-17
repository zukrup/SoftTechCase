//
//  UIViewControllerExtensions.swift
//  MyX
//
//  Created by Musa Fedakar on 07/06/16.
//  Copyright © 2016 Br Magazacilik. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import TTGSnackbar

protocol MyWebServiceProtocol {
    
    func api_operation_completed(_ ApiRequestCommand: ApiRequestCommand?)
    
    func sendApiRequestToDevice(_ cmd : ApiRequestCommand) 
    
}


protocol OrientationLockedAsPortrait {
    
}

class BaseViewController : UIViewController {
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
     
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hideKeyboardWhenTappedAround()
    }
}

extension UIViewController: MyWebServiceProtocol {
    
    
    func checkApiResponse(command : ApiRequestCommand, navBar : Bool? = false) -> Bool {
        var retval : Bool = false
        
        if (command.apiResponseState! == .error) {
            
            retval = true
            
            self.showSnackBarWithIconAndMessage(msg: MyStrings.sharedInstance.API_REQUEST_ERROR, type: .error, navBar: navBar)
            return retval
        }
        
        if let mgnresponse = command.returnObject as? RepoResponse {
            if mgnresponse.isSucceeded == false {
                retval = true
                
                var msg : String = MyStrings.sharedInstance.API_REQUEST_ERROR
                 
                
                self.showSnackBarWithIconAndMessage(msg: msg, type: .error, navBar: navBar)
            }
        }
        
        return retval
    }
    
    
    func sendApiRequestToDevice(_ cmd : ApiRequestCommand)   {
        /*
        if let currentOperation = self.apiOperation {
            if currentOperation.isFinished == false {
                return false
            }
        }
 
        self.apiOperation = ApiRequestService()
        self.apiOperation!.apiRequestCommand = cmd
        self.apiOperation!.completionBlock =  {
            
            self.api_operation_completed()
            
        }
        self.apiOperation!.start()
        */
        
        let apiOperation = ApiRequestService()
        apiOperation.apiRequestCommand = cmd
        apiOperation.completionBlock =  {
            
            self.api_operation_completed(apiOperation.apiRequestCommand)
            
        }
        apiOperation.start() 
        
    }
    
    @objc func api_operation_completed(_ ApiRequestCommand : ApiRequestCommand?) {
        
    }
    
    
   func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
    }
    
    func hideKeyboardWhenTappedAround(_ mtarget : AnyObject) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: mtarget, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func dismissKeyboardSelector(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    func assignbackground(){
        
        let background = UIImage(named: "main-bg")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        imageView.tag = Scully.sharedInstance.ACTIVITY_BACKGROUND_TAG
        guard let _ = self.view as? UITableView else {
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
            return
        }
        
        if let _ = self.view as? UITableView, let p = self.parent {
            //self.parent.view.backgroundColor = UIColor(patternImage: UIImage(named: "main_activity_bg")!)
            p.view.addSubview(imageView)
            p.view.sendSubviewToBack(imageView)
        }
        
        if let _ = self.view as? UICollectionView, let p = self.parent {
            //self.parent.view.backgroundColor = UIColor(patternImage: UIImage(named: "main_activity_bg")!)
            p.view.addSubview(imageView)
            p.view.sendSubviewToBack(imageView)
        }
        
    }
    
    func assignTransparentBackground() {
        self.view.backgroundColor = UIColor.clear
    }
    
    func clearNotifications(_ key : String) {
        Scully.sharedInstance.saveSettings(key, mValue: 0)
    }
     
    
    func rotated(_ size: CGSize)
    {
        if(UIDevice.current.orientation.isLandscape)
        {
            if let bg_view = self.view.viewWithTag(Scully.sharedInstance.ACTIVITY_BACKGROUND_TAG) {
                if let bg_imageview = bg_view as? UIImageView {
                    
                    bg_imageview.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
                    //bg_imageview.contentMode = UIViewContentMode.scaleAspectFill
                }
            }
            
        }
        
        if(UIDevice.current.orientation.isPortrait)
        {
            //PORTRAIT
        }
        
    }
    
    func rotatedTableViewChild() {
        if(UIDevice.current.orientation.isLandscape)
        {
            //LANDSCAPE
        }
        else {
            //PORTRAIT
        }
    }
    
    func assignKeyboardToolbar(_ input : UITextField) {
        var accessoryDoneButton: UIBarButtonItem!
        let accessoryToolBar = UIToolbar(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width, height: 44))
        accessoryDoneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.dismissKeyboardSelector(_:)))
        let accessoryFlexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        accessoryDoneButton.setTitleTextAttributes([NSAttributedString.Key.font: Scully.sharedInstance.APP_MEDIUM_FONT_SMALL!], for: UIControl.State())
        accessoryToolBar.items = [accessoryFlexibleSpace,accessoryDoneButton]
        input.inputAccessoryView = accessoryToolBar
    }
    
    func assignKeyboardToolbar(_ input : UITextField, indexpath : IndexPath) {
        var accessoryDoneButton: MyUIBarButtonItem!
        let accessoryToolBar = UIToolbar(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width, height: 44))
        accessoryDoneButton = MyUIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.dismissKeyboardSelector(_:)))
        accessoryDoneButton.indexPath = indexpath
        let accessoryFlexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        accessoryDoneButton.setTitleTextAttributes([NSAttributedString.Key.font: Scully.sharedInstance.APP_MEDIUM_FONT_SMALL!], for: UIControl.State())
        accessoryToolBar.items = [accessoryFlexibleSpace,accessoryDoneButton]
        input.inputAccessoryView = accessoryToolBar
    }
    
    func assignKeyboardToolbarTextView(_ input : UITextView) {
        var accessoryDoneButton: UIBarButtonItem!
        let accessoryToolBar = UIToolbar(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width, height: 44))
        accessoryDoneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.dismissKeyboardSelector(_:)))
        let accessoryFlexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        accessoryDoneButton.setTitleTextAttributes([NSAttributedString.Key.font: Scully.sharedInstance.APP_MEDIUM_FONT_SMALL!], for: UIControl.State())
        accessoryToolBar.items = [accessoryFlexibleSpace,accessoryDoneButton]
        input.inputAccessoryView = accessoryToolBar
    }
    
    func animateViewMoving (_ up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }
    
    
    func showImageAsGallery(imageView: UIImageView, desc : String) {
        
        let tap = MyTapGestureRecognizer(target: self, action: #selector(self.showPhoto(tapGestureRecognizer:)), description: desc)
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
    }
     
    
    @objc func showBtnPhoto(tapGestureRecognizer: MyTapGestureRecognizer) {
        
        
        
    }
    
    @objc func showPhoto(tapGestureRecognizer: MyTapGestureRecognizer) {
        
        if let _ = tapGestureRecognizer.view as? UIImageView {
            
        }
        
    }
    
    func setGradientBackground(target: UIView, on_top : Bool, colorTop : UIColor, colorBottom: UIColor) -> CAGradientLayer {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = target.bounds
        
        if (on_top) {
            target.layer.addSublayer(gradientLayer)
        }
        else {
            target.layer.insertSublayer(gradientLayer, at: 0)
        }
        return gradientLayer
    }
    
    func showSnackBarWithIconAndMessage(msg: String, type: TTGSnackBarMessageType, navBar : Bool? = false) {
        
        let snackbar: TTGSnackbar = TTGSnackbar.init(message: "\n" + msg + "\n", duration: .long)
    
        snackbar.animationType = .slideFromTopBackToTop
        
        let snackbarGradientLayer = adjustSnackbarColor(snackbar: snackbar, type: type)
        
        snackbar.topMargin = 0.0
        
        if let navbar = navBar, navbar {
            snackbar.topMargin += Scully.sharedInstance.NAV_BAR_HEIGHT + 6
        }
        
        snackbar.leftMargin = 0
        snackbar.rightMargin = 0
        snackbar.cornerRadius = 0.0
        
        
        dispatch_on_main {
            snackbar.show()
            snackbarGradientLayer.frame = snackbar.bounds
        }
        
    }
    
    func showSnackBarWithIconAndMessageFromBottom(msg: String, type: TTGSnackBarMessageType) {
       
        let snackbar: TTGSnackbar = TTGSnackbar.init(message: "\n" + msg + "\n", duration: .long)
        
        // Add icon image
    
        snackbar.animationType = .slideFromBottomBackToBottom
    
        let snackbarGradientLayer = adjustSnackbarColor(snackbar: snackbar, type: type)
    
        snackbar.bottomMargin = 0
        snackbar.leftMargin = 0
        snackbar.rightMargin = 0
        snackbar.cornerRadius = 0.0
        
        dispatch_on_main {
            snackbar.show()
            snackbarGradientLayer.frame = snackbar.bounds
        }
    }
    
    func adjustSnackbarColor(snackbar: TTGSnackbar, type: TTGSnackBarMessageType) -> CAGradientLayer {
        
        //snackbar.icon = UIImage.init(named: "logo_actionbar_wb")?.af_imageAspectScaled(toFit: CGSize(width: 28, height: 28))
        snackbar.actionTextFont = Scully.sharedInstance.APP_REGULAR_FONT_LARGER!
        snackbar.messageTextFont = Scully.sharedInstance.APP_REGULAR_FONT_LARGER!
        snackbar.secondActionTextFont = Scully.sharedInstance.APP_REGULAR_FONT_LARGER!
        snackbar.backgroundColor = UIColor.clear
        snackbar.actionTextColor = UIColor.whiteTintColor(1.0)
        var snackbarGradientLayer : CAGradientLayer = CAGradientLayer()
        switch type {
        case .primary:
            snackbarGradientLayer = self.setGradientBackground(target: snackbar, on_top: true, colorTop: UIColor.colorDefaultGradient1Color(), colorBottom: UIColor.colorDefaultGradient2Color())
            break
        case .warning:
            snackbarGradientLayer = self.setGradientBackground(target: snackbar, on_top: true, colorTop: UIColor.colorPrimaryGradient1Color(), colorBottom: UIColor.colorPrimaryGradient2Color())
            break
        case .error:
            snackbarGradientLayer = self.setGradientBackground(target: snackbar, on_top: true, colorTop: UIColor.sinRedLight(0.95), colorBottom: UIColor.sinRed(0.95))
            break
        case .notification:
            snackbarGradientLayer = self.setGradientBackground(target: snackbar, on_top: true, colorTop: UIColor.secondaryFg(0.90), colorBottom: UIColor.primaryFg(0.90))
            break
        }
        return snackbarGradientLayer
    }
    
    func handleWsRequestErrorDetail(response: RepoResponse) {
        if (!response.isSucceeded) {
            showSnackBarWithIconAndMessage(msg: MyStrings.sharedInstance.API_REQUEST_ERROR, type: .error)
        }
        else {
            
        }
    }
    
}

extension UIViewController: OrientationLockedAsPortrait  {
     
    fileprivate struct AssociatedKeys {
        static var apiOperation: ApiRequestService?
        static var keyboardUP : Bool?
    }
    
    var keyboardUP : Bool? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.keyboardUP) as? Bool
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.keyboardUP, newValue as Bool?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var apiOperation : ApiRequestService? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.apiOperation) as? ApiRequestService
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.apiOperation, newValue as ApiRequestService?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    
}

class MyTapGestureRecognizer : UITapGestureRecognizer {
    
    var mDescription : String?
    // any more custom variables here
    
    init(target: AnyObject?, action: Selector, description : String) {
        super.init(target: target, action: action)
        
        self.mDescription = description
    }
    
}
