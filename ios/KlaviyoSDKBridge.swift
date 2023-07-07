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
  
  @objc func setPhoneNumber(_ phoneNumber:String) {
    print("KlaviyoSDKBridge :: setPhoneNumber :: ", phoneNumber)
    KlaviyoSDK().set(phoneNumber: phoneNumber)
  }
  
  @objc func setExternalID(_ externalID:String) {
    print("KlaviyoSDKBridge :: setExternalID :: ", externalID)
    KlaviyoSDK().set(externalId: externalID)
  }
  
  @objc func customEventWithNameOnly(_ eventName:String) {
    KlaviyoSDK().create(event: .init(name: .CustomEvent(eventName)))
    print("KlaviyoSDKBridge :: customEventWithNameOnly :: ", eventName)
  }
  
  @objc func openedPushEvent(){
    
  }
  
  @objc func viewedProducthEvent(){
    
  }
  
  @objc func searchedProductsEvent(){
    
  }
  
  @objc func startedCheckoutEvent(){
    
  }
  
  @objc func placedOrderEvent(){
    
  }
  
  @objc func cancelledOrderEvent(){
    
  }
  
  @objc func paidForOrderEvent(){
    
  }
  
  @objc func subscribedToBackInStockEvent(){
    
  }
  
  @objc func subscribedToComingSoonEvent(){
    
  }
  
  @objc func subscribedToListEvent(){
    
  }
  
  @objc func successfulPaymentEvent(){
    
  }
  
  @objc func failedPaymentEvent(){
    
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
