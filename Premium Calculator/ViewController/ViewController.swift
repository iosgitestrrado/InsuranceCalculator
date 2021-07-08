//
//  ViewController.swift
//  Premium Calculator
//
//  Created by softnotions on 02/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import UIKit
import ACFloatingTextfield_Swift
import MobileCoreServices
import Alamofire
import SwiftyJSON


class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var imgBG: UIImageView!
    @IBOutlet weak var viewLogin: UIView!
    let sharedData = SharedDefault()
    var loginModel:LoginModel?
    
    
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPassword: ACFloatingTextfield!
    @IBOutlet weak var txtUsername: ACFloatingTextfield!
    @IBOutlet weak var imgTop: UIImageView!
    @IBOutlet weak var viewScrollBG: UIView!
    @IBOutlet weak var scollLogin: UIScrollView!
    
    var premiumDropModel:PremiumDropModel?
    var vehicleClassList = [VehicleClassTable]()
    var vehicleCategoryList = [VehicleCategoryTable]()
    var vehicleTypesList = [VehicleTypesTable]()
    var weightRangeList = [WeightRangeTable]()
    var premiumRatesList = [PremiumRates]()
    var addonsTableList = [AddonsTable]()
    var premiumCoverTypeList = [PremiumCoverTypeTable]()
    var extraFieldList = [ExtraFieldsTable]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        self.navigationController?.navigationBar.isHidden = true
        
       self.txtUsername.text = ""
       self.txtPassword.text = ""
        
        self.txtPassword.delegate = self
         self.txtUsername.delegate = self
        self.btnLogin.layer.cornerRadius = 5
        self.viewLogin.layer.cornerRadius = 5
        
        self.viewLogin.layer.shadowColor = UIColor.lightGray.cgColor
        self.viewLogin.layer.shadowOpacity = 1
        self.viewLogin.layer.shadowOffset = .zero
        self.viewLogin.layer.shadowRadius = 5
        
        
        
        
    }
    
    // MARK: keyboard notification
    @objc func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scollLogin.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scollLogin.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scollLogin.contentInset = contentInset
    }
    
    // MARK:UITextField Delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    @IBAction func btnLoginAction(_ sender: Any) {
        if Reachability.isConnectedToNetwork() {
            if txtUsername.text!.count<=0 {
                self.showToast(message: Constants.usernameEmptyMsg)
            }
            else if txtPassword.text!.count<=0 {
                self.showToast(message: Constants.pwdEmptyMsg)
            } else {
                self.loginUser()
            }
        } else {
            self.showToast(message: Constants.connectivityErrorMsg)
        }
        
    }
    
    func loginUser() {
        self.view.activityStartAnimating()
        //let formatted = String(format: "Angle: %.2f", angle)
        
        /*
         let userdefaults = UserDefaults.standard
         if let savedValue = userdefaults.string(forKey: "fcm_token"){
            print("savedValue fcm_token ----- ",savedValue)
         } else {
           sharedDefault.setFcmToken(token: fcmToken)
         }
         */
        
        let os = ProcessInfo().operatingSystemVersion
        print(os.majorVersion)          // 12
        print(os.minorVersion)          // 2
        print(os.patchVersion)          // 0
        print(os.getFullVersion())      // 12.2.0
        
        var postDict = Dictionary<String,String>()
        postDict = [
            "user_name":txtUsername.text!,
            "password":txtPassword.text!,
            "device_token":"21",
            "os":"iOS " + os.getFullVersion()
        ]
        
        print("PostData: ",postDict)
        let loginURL = Constants.baseURL+Constants.loginURL
        print("loginURL",loginURL)
        
        AF.request(loginURL, method: .post, parameters: postDict, encoding: URLEncoding.default, headers: nil).responseJSON { (data) in
            print("Response:***:",data.description)
            
            switch (data.result) {
            case .failure(let error) :
                self.view.activityStopAnimating()
                
                if error._code == NSURLErrorTimedOut {
                    self.showToast(message: "Request timed out! Please try again!")
                }
                else if error._code == 4 {
                    self.showToast(message: "Internal server error! Please try again!")
                }
                else if error._code == -1003 {
                    self.showToast(message: "Server error! Please contact support!")
                }
            case .success :
                do {
                    let response = JSON(data.data!)
                    self.loginModel = LoginModel(response)
                    let statusCode = Int((self.loginModel?.httpcode)!)
                    if statusCode == 200{
                        print("otpRespModel ----- ",self.loginModel!)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            self.sharedData.setAccessToken(token: (self.loginModel?.loginData?.userData?.accessToken!)!)
                            self.sharedData.setLoginStatus(loginStatus: true)
                            self.view.activityStopAnimating()
                            let next = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                            next.name = self.loginModel!.loginData?.userData?.name!
                            self.sharedData.setUserName(token: (self.loginModel!.loginData?.userData?.name!)!)
                            self.navigationController?.pushViewController(next, animated: true)
                            
                            
                        }
                    }
                    if statusCode == 400{
                        self.view.activityStopAnimating()
                        self.showToast(message: (self.loginModel?.message)!)
                    }
                    
                }
                catch let err {
                    print("Error::",err.localizedDescription)
                }
            }
        }
    }
    
    func getTableData() {
        
        self.view.activityStartAnimating()
        
        let loginURL = Constants.tableDataURL
        
        print("loginURL",loginURL)
        var postDict = Dictionary<String,String>()
        postDict = [
            "update_time":""
            
        ]
        
        AF.request(loginURL, method: .post, parameters: postDict, encoding: URLEncoding.default, headers: nil).responseJSON { (data) in
            print("Response:***:",data.description)
            
            switch (data.result) {
            case .failure(let error) :
                self.view.activityStopAnimating()
                
                if error._code == NSURLErrorTimedOut {
                    self.showToast(message: "Request timed out! Please try again!")
                }
                else if error._code == 4 {
                    self.showToast(message: "Internal server error! Please try again!")
                }
                else if error._code == -1003 {
                    self.showToast(message: "Server error! Please contact support!")
                }
            case .success :
                do {
                    let response = JSON(data.data!)
                    self.premiumDropModel = PremiumDropModel(response)
                    let statusCode = Int((self.premiumDropModel?.httpcode)!)
                    if statusCode == 200{
                        
                        if self.premiumDropModel?.dbUpdate == 1  {
                            //insert table
                        }
                        else {
                            
                        }
                        self.vehicleClassList = (self.premiumDropModel?.premiumModelData?.vehicleClassTable)!
                        
                        DBHandler.shared.insertVehicleClass(array: self.vehicleClassList)
                        
                        self.vehicleCategoryList = (self.premiumDropModel?.premiumModelData?.vehicleCategoryTable)!
                        DBHandler.shared.insertVehicleCat(array: self.vehicleCategoryList)
                        self.vehicleTypesList = (self.premiumDropModel?.premiumModelData?.vehicleTypesTable)!
                        DBHandler.shared.insertVehicleType(array: self.vehicleTypesList)
                        self.weightRangeList = (self.premiumDropModel?.premiumModelData?.weightRangeTable)!
                        DBHandler.shared.insertVehicleWeightRange(array: self.weightRangeList)
                        
                        self.premiumCoverTypeList = (self.premiumDropModel?.premiumModelData?.premiumCoverTypeTable)!
                        DBHandler.shared.insertPremiumCoverType(array: self.premiumCoverTypeList)
                        
                        
                        self.addonsTableList = (self.premiumDropModel?.premiumModelData?.addonsTable)!
                        DBHandler.shared.insertAddons(array: self.addonsTableList)
                        
                        
                        self.premiumRatesList = (self.premiumDropModel?.premiumModelData?.premiumRates)!
                        DBHandler.shared.insertPremiumRates(array: self.premiumRatesList)
                        
                        self.extraFieldList = (self.premiumDropModel?.premiumModelData?.extraFieldsTable)!
                        DBHandler.shared.insertExtraFields(array: self.extraFieldList)
                        
                        
                        
                        self.view.activityStopAnimating()
                        
                        
                    }
                    if statusCode == 400{
                        self.view.activityStopAnimating()
                        self.showToast(message: (self.premiumDropModel?.message)!)
                    }
                    
                }
                catch let err {
                    print("Error::",err.localizedDescription)
                }
            }
        }
    }
}

