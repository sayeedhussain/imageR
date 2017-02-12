//
//  URLConstants.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 08/09/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

import Foundation

class APIURLs {
    
    static let HttpProtocol = "https"
    static let HttpHost = "www.assetplus.io"

    static let HttpHostSuffix = "appserver"
    static let HttpVersion = "v1"

    static func UrlPrefix() -> String {
        return HttpProtocol + "://" + HttpHost + "/" + HttpHostSuffix + "/" + HttpVersion
    }
    
//    static func UrlPrefix() -> String {
//        return "http://localhost:3000"
//    }

    static func loginURL() -> String {
        return UrlPrefix() + "/auth/login"
    }
    
    static func signUpURL() -> String {
        return UrlPrefix() + "/auth/signup"
    }

    static func resetPasswordURL() -> String {
        return UrlPrefix() + "/auth/resetPassword"
    }

    static func signupOTPURL() -> String {
        return UrlPrefix() + "/auth/generateSignupOTP"
    }
    
    static func resetPasswordOTPURL() -> String {
        return UrlPrefix() + "/auth/generateResetOTP"
    }
    
    static func activationStatusURL() -> String {
        return UrlPrefix() + "/user/activation/status"
    }
    
    static func uploadActivationDataURL() -> String {
        return UrlPrefix() + "/user/activation/uploadData"
    }
    
    static func schemesListURL() -> String {
        return UrlPrefix() + "/user/info/schemesList"
    }

    static func changePasswordURL() -> String {
        return UrlPrefix() + "/user/settings/changePassword"
    }
    
    static func updateDeviceTokenURL() -> String {
        return UrlPrefix() + "/user/settings/updateDeviceToken"
    }

    static func navHistoryURL() -> String {
        return UrlPrefix() + "/user/info/navHistory"
    }
    
    static func factsheetURL() -> String {
        return UrlPrefix() + "/user/info/factsheets"
    }
    
    static func latestNAVURL() -> String {
        return UrlPrefix() + "/user/info/latestNAV"
    }
    
    static func addOrderURL() -> String {
        return UrlPrefix() + "/user/cart/addOrder"
    }
    
    static func removeOrderURL() -> String {
        return UrlPrefix() + "/user/cart/removeOrder"
    }

    static func editOrderURL() -> String {
        return UrlPrefix() + "/user/cart/editOrder"
    }

    static func getCartURL() -> String {
        return UrlPrefix() + "/user/cart"
    }
    
    static func checkoutCartURL() -> String {
        return UrlPrefix() + "/user/cart/checkout"
    }
    
    static func clearCartURL() -> String {
        return UrlPrefix() + "/user/cart/clear"
    }
    
    static func commitTransactionsURL() -> String {
        return UrlPrefix() + "/user/transactions/commitTransaction"
    }

    static func getTransactionsURL() -> String {
        return UrlPrefix() + "/user/transactions"
    }
    
    static func redeemRequestURL() -> String {
        return UrlPrefix() + "/user/transactions/redeemRequest"
    }
    
    static func faqURL() -> String {
        return UrlPrefix() + "/user/info/faq"
    }

    static func privacyPolicyURL() -> String {
        return UrlPrefix() + "/user/info/privacyPolicy"
    }

    static func termsURL() -> String {
        return UrlPrefix() + "/user/info/termsAndConditions"
    }
    
    static func librariesURL() -> String {
        return "https://sayeedhussain.github.io/licenses.html"
    }
}
