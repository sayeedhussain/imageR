//
//  APIResponseCodeHandler.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 26/11/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

class APIResponseStatusCodeHandler {
    
    func handle(_ response: APIResponse) {
        
        guard let code = response.status else {
            return
        }
        
        switch code {
            
        case 401:
            break
            //            NotificationCenter.default.post(name: NSNotification.Name(Notification_Authentication_Failure), object: nil)
            
        default:
            break
        }
    }
}
