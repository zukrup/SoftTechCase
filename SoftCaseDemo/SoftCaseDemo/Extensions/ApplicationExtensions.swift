//
//  ApplicationExtensions.swift
//  BaylanMgn
//
//  Created by musa fedakar on 14.08.2018.
//  Copyright © 2018 musa fedakar. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
    
    
}

class UIHelper {
    
    class func topViewController() -> UIViewController?
    {
        let helper = UIHelper()
        return helper.topViewControllerWithRootViewController(rootViewController: UIApplication.shared.keyWindow?.rootViewController)
    }
    
    /**This is a recursive method to select the top View Controller in a app, either with TabBarController or not */
    private func topViewControllerWithRootViewController(rootViewController:UIViewController?) -> UIViewController?
    {
        if(rootViewController != nil)
        {
            // UITabBarController
            if let tabBarController = rootViewController as? UITabBarController,
                let selectedViewController = tabBarController.selectedViewController {
                return self.topViewControllerWithRootViewController(rootViewController: selectedViewController)
            }
            
            // UINavigationController
            if let navigationController = rootViewController as? UINavigationController ,let visibleViewController = navigationController.visibleViewController {
                return self.topViewControllerWithRootViewController(rootViewController: visibleViewController)
            }
            
            if ((rootViewController!.presentedViewController) != nil) {
                let presentedViewController = rootViewController!.presentedViewController;
                return self.topViewControllerWithRootViewController(rootViewController: presentedViewController!);
            }else
            {
                return rootViewController
            }
        }
        
        return nil
    }
}
