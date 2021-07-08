//
//  Constants.swift
//  Vinner
//
//  Created by softnotions on 17/07/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import UIKit

class Constants: NSObject {
    static let connectivityErrorMsg = "Please check internet connection"
    static let appName = "Premium Calculator"
    static let logoutMSG = "Are you sure you want to logout"
    
    // MARK:Login Page
    //static let btnTextColorWhite =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    static let usernameEmptyMsg = "Enter username"
    static let pwdEmptyMsg = "Enter password"
    
    // MARK:URL's
    
    // MARK:stagging
//    static let baseURL = "https://estrradoweb.com/insurance/uat/api/customer/"// stagging
    
    // MARK:Live
    static let baseURL = "https://estrradoweb.com/insurance/api/customer/"// Live URL
    
    static let versionURL = "version"
    static let loginURL = "signin"
    static let signOutURL = "signout"
    static let vehicleClassURL = "vehicle/class"
    static let vehicleCatURL = "vehicle/categories"
    static let vehicleTypesURL = "vehicle/types"
    static let weightRangeURL = "vehicle/weihgtrange"
    static let premiumFormURL = "premium/form"
    static let computePremiumURL = "premium/compute"
    static let computePremiumAddOnURL = "premium/addon_compute"
    static let tableDataURL = "https://estrradoweb.com/insurance/api/tabledata"
    static let tableDataURLTest = "https://estrradoweb.com/insurance/uat/api/tabledata"

}
