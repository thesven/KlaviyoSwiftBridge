//
//  KlaviyoSDKBridge.swift
//  KlaviyoSwiftBridge
//
//  Created by Michael Svendsen on 2023-07-06.
//

import Foundation
import KlaviyoSwift

@objc(KlaviyoSDKBridge)
class KlaviyoSDKBridge : NSObject {
  
  @objc func initialize(_ apiKey:String) {
    KlaviyoSDK().initialize(with: apiKey)
    print("Klaviyo Init")
  }
  
  @objc func setEmail(_ address:String) {
    print("KlaviyoSDKBridge :: setEmail :: ", address)
    KlaviyoSDK().set(email: address)
  }
  
  @objc func customEventWithNameOnly(_ eventName:String) {
    print("Type of: ", type(of: eventName))
    KlaviyoSDK().create(event: .init(name: .CustomEvent(eventName)))
    print("KlaviyoSDKBridge :: customEventWithNameOnly :: ", eventName)
  }
  
  @objc func constantsToExport() -> [AnyHashable : Any]! {
    return [
      "ModuleName": "KlaviyoSDKBridge"
    ]
  }
  
  @objc static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
}
