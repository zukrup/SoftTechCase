//
//  UITableViewExtensions.swift
//  BaylanMgn
//
//  Created by musa fedakar on 31.01.2019.
//  Copyright © 2019 musa fedakar. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    /// Returns label of cell action button.
    ///
    /// Use this property to set cell action button label color.
    var cellActionButtonLabel: UILabel? {
        for subview in self.superview?.subviews ?? [] {
            if String(describing: subview).range(of: "UISwipeActionPullView") != nil {
                for view in subview.subviews {
                    if String(describing: view).range(of: "UISwipeActionStandardButton") != nil {
                        for sub in view.subviews {
                            if let label = sub as? UILabel {
                                
                                return label
                            }
                        }
                    }
                }
            }
        }
        return nil
    }
    
}
