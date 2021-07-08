//
//  AppDelegate.swift
//  Premium Calculator
//
//  Created by softnotions on 02/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import UIKit


@UIApplicationMain

class AppDelegate:UIViewController, UIApplicationDelegate{
    let sharedData = SharedDefault()
    
    
var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        
        
        
        
       
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var initialPage = UIViewController()
        if sharedData.getLoginStatus() == false {
            //initialPage = mainStoryboard.instantiateViewController(withIdentifier: "MerchantHomeVC") as! MerchantHomeVC
            var initialPage = UIViewController()
            //initialPage = mainStoryboard.instantiateViewController(withIdentifier: "CustomNavigation") as! CustomNavigation
            initialPage = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let navigationController = UINavigationController(rootViewController: initialPage)
            navigationController.navigationBar.isHidden = true
            self.window?.rootViewController = navigationController
        } else {
            var initialPage = UIViewController()
            initialPage = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            let navigationController = UINavigationController(rootViewController: initialPage)
             navigationController.navigationBar.isHidden = true
            self.window?.rootViewController = navigationController
        }
        
        //self.getVersion()
        self.window?.makeKeyAndVisible()
        

        
        return true
    }

 
    
}

