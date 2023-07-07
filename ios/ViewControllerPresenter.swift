//
//  ViewControllerPresenter.swift
//  KlaviyoSwiftBridge
//
//  Created by Michael Svendsen on 2023-07-07.
//

import UIKit

class ViewControllerPresenter {
    
    private var presentationQueue = DispatchQueue(label: "ViewControllerPresentationQueue", qos: .userInteractive)
    private var semaphore = DispatchSemaphore(value: 1)
    
    static let shared = ViewControllerPresenter()
    
    private init() {}
    
    func present(_ viewControllerToPresent: UIViewController, on viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        presentationQueue.async { [weak self] in
            self?.semaphore.wait()
            
            DispatchQueue.main.async {
                if viewController.presentedViewController == nil {
                    viewController.present(viewControllerToPresent, animated: animated) {
                        self?.semaphore.signal()
                        completion?()
                    }
                } else {
                    self?.semaphore.signal()
                }
            }
        }
    }
}

