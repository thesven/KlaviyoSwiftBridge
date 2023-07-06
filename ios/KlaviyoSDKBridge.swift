//
//  KlaviyoSDKBridge.swift
//  KlaviyoSwiftBridge
//
//  Created by Michael Svendsen on 2023-07-06.
//

import Foundation

@objc(KlaviyoSDKBridge)
class KlaviyoSDKBridge : NSObject {
  
  @objc func constantsToExport() -> [AnyHashable : Any]! {
    return [
      "ModuleName": "KlaviyoSDKBridge"
    ]
  }
  
  @objc static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
}
