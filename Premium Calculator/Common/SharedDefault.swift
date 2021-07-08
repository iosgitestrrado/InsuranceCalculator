//
//  SharedDefault.swift
//  iDesigner
//
//  Created by Softnotions Technologies Pvt Ltd on 2/19/20.
//  Copyright © 2020 Softnotions Technologies Pvt Ltd. All rights reserved.
//

import UIKit

class SharedDefault: UIViewController {
    
    func setLoginStatus(loginStatus:Bool)
    {
        UserDefaults.standard.set(loginStatus, forKey: "login_status")
        UserDefaults.standard.synchronize()
    }
    
    func getLoginStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: "login_status")
    }
    
    
    func setAccessToken(token:String)
    {
        UserDefaults.standard.set(token, forKey: "access_token")
        UserDefaults.standard.synchronize()
    }
    func getAccessToken()-> String
    {
        return UserDefaults.standard.value(forKey: "access_token")! as! String
        
    }
    func clearAccessToken()
    {
        UserDefaults.standard.removeObject(forKey: "access_token")
        UserDefaults.standard.synchronize()
    }
    
    func setUserName(token:String)
    {
        UserDefaults.standard.set(token, forKey: "name")
        UserDefaults.standard.synchronize()
    }
    func getUserName()-> String
    {
        return UserDefaults.standard.value(forKey: "name")! as! String
        
    }
   func setTime(token:String)
    {
        UserDefaults.standard.set(token, forKey: "time")
        UserDefaults.standard.synchronize()
    }
    func getTime()-> String
    {
        return UserDefaults.standard.value(forKey: "time")! as! String
        
    }
    
    func setVat(token:String)
    {
        UserDefaults.standard.set(token, forKey: "vatPercentage")
        UserDefaults.standard.synchronize()
    }
    func getVat()-> String
    {
        return UserDefaults.standard.value(forKey: "vatPercentage")! as! String
        
    }
   
}
