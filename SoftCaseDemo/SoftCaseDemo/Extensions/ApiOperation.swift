//
//  ApiOperation.swift
//  BaylanMgn
//
//  Created by musa fedakar on 17.08.2018.
//  Copyright © 2018 musa fedakar. All rights reserved.
//

import Foundation


class ApiOperation : Operation {
    private var _executing = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isExecuting: Bool {
        return _executing
    }
    
    private var _finished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            didChangeValue(forKey: "isFinished")
        }
    }
    
    override var isFinished: Bool {
        return _finished
    }
    
    func executing(_ executing: Bool) {
        _executing = executing
    }
    
    func finish(_ finished: Bool) {
        _finished = finished
    }
    
    func complete_operation() {
        executing(false)
        finish(true)
    }
}
