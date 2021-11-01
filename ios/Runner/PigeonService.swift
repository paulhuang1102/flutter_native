//
//  PigeonService.swift
//  Runner
//
//  Created by Paul on 2021/11/1.
//

import Foundation
import Flutter

import UIKit

public class SwiftPigeonService: NSObject, FLTSearchApi {
    public func searchRequest(_ request: FLTSearchRequest, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FLTSearchReply? {
//        guard request.query is FLTRequsetType else {
//            return FLTSearchReply()
//        }
        
        if (request.query == FLTRequsetType.sayhello) {
            let reply = FLTSearchReply()
            
            reply.result = "Hello"
            return reply
        }
        
        if (request.query == FLTRequsetType.getbattery) {
            let device = UIDevice.current
            let reply = FLTSearchReply()
            device.isBatteryMonitoringEnabled = true
            
              if device.batteryState == UIDevice.BatteryState.unknown {
                  reply.result = "Battery info unavailable"
              } else {
                  reply.result = String(device.batteryLevel * 100)
            
              }
            
            return reply
        }
        
        return FLTSearchReply()

    }
    
    
   

}
