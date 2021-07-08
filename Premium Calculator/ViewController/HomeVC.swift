//
//  HomeVC.swift
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
import DLRadioButton


class HomeVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate
{
    let sharedData = SharedDefault()
    
    @IBOutlet weak var btnTPFT: UIButton!
    @IBOutlet weak var viewTPFT: UIView!
    @IBOutlet weak var lblPremuimValueWithoutVat: UILabel!
    
    @IBOutlet weak var lblPremiumVAlueWith18Vat: UILabel!
    
    @IBOutlet weak var btnTPO: UIButton!
    @IBOutlet weak var viewTPO: UIView!
    @IBOutlet weak var btnComprehensive: UIButton!
    @IBOutlet weak var viewComprehensive: UIView!
    var name:String? = ""
    var vatFromService = 0.0
    
    var comprehensiveFinal = 0.0
    var comprehensiveUpdateFinal = 0.0
    
    var comprehensiveBuyBack = 0.0
    var comprehensiveGeoLimit = 0.0
    var comprehensiveTppdLimit = 0.0
    
    @IBOutlet weak var viewConditions: UIView!
    var premiumDropModel:PremiumDropModel?
    var logoutModel:LogoutModel?
    
    @IBOutlet weak var viewPassengerTop: NSLayoutConstraint!
    @IBOutlet weak var viewAboveTen: NSLayoutConstraint!
    @IBOutlet weak var viewWeightTop: NSLayoutConstraint!
    @IBOutlet weak var viewSeatTop: NSLayoutConstraint!
    
    var vehicleClassLists = [VehicleClassTable]()
    var vehicleCategoryLists = [VehicleCategoryTable]()
    var vehicleTypesLists = [VehicleTypesTable]()
    var weightRangeLists = [WeightRangeTable]()
    var premiumRatesLists = [PremiumRates]()
    var addonsTableLists = [AddonsTable]()
    var premiumCoverTypeLists = [PremiumCoverTypeTable]()
    var extraFieldLists = [ExtraFieldsTable]()
    
    
    
    @IBOutlet weak var viewVehicle: UIView!
    @IBOutlet weak var viewCategory: UIView!
    @IBOutlet weak var viewType: UIView!
    @IBOutlet weak var viewClaimHistory: UIView!
    @IBOutlet weak var viewVehicleValue: UIView!
    @IBOutlet weak var viewSeat: UIView!
    @IBOutlet weak var viewWeight: UIView!
    @IBOutlet weak var viewAbove: UIView!
    
    @IBOutlet weak var viewSeatHeight: NSLayoutConstraint!
    @IBOutlet weak var viewTypeHeight: NSLayoutConstraint!
    @IBOutlet weak var viewPassCarryHeight: NSLayoutConstraint!
    @IBOutlet weak var viewAboveHeight: NSLayoutConstraint!
    @IBOutlet weak var viewWeightHeight: NSLayoutConstraint!
    
    @IBOutlet weak var radioPassNoWidth: NSLayoutConstraint!
    @IBOutlet weak var radioPassYWidth: NSLayoutConstraint!
    
    @IBOutlet weak var radioTenYWidth: NSLayoutConstraint!
    @IBOutlet weak var radioNoWidth: NSLayoutConstraint!
    
    @IBOutlet weak var tableAddOn: UITableView!
    @IBOutlet weak var btnAddOn: UIButton!
    @IBOutlet weak var imgDown: UIImageView!
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var viewPremium: UIView!
    
    @IBOutlet weak var viewPassCarrying: UIView!
    @IBOutlet weak var txtWeightRange: ACFloatingTextfield!
    @IBOutlet weak var txtType: ACFloatingTextfield!
    @IBOutlet weak var btnType: UIButton!
    @IBOutlet weak var tableVehicle: UITableView!
    @IBOutlet weak var txtVehicle: ACFloatingTextfield!
    @IBOutlet weak var txtCategory: ACFloatingTextfield!
    @IBOutlet weak var btnCategory: UIButton!
    @IBOutlet weak var viewTable: UIView!
    @IBOutlet weak var viewPopupBG: UIView!
    var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
    @IBOutlet weak var btnVehicle: UIButton!
    @IBOutlet weak var scrollHome: UIScrollView!
    @IBOutlet weak var btnProfile: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var viewScrollBg: UIView!
    @IBOutlet weak var viewClaim: UIView!
    @IBOutlet weak var radioYes: DLRadioButton!
    @IBOutlet weak var radioNo: DLRadioButton!
    
    @IBOutlet weak var viewAnimate: UIView!
    @IBOutlet weak var btnCompute: UIButton!
    
    @IBOutlet weak var txtVehicleSeatNo: ACFloatingTextfield!
    @IBOutlet weak var txtVehicleValue: ACFloatingTextfield!
    var tableStatus:Int = 0
    
    // 0 vehicle class
    // 1 category
    // 2 type
    var claimHistory:String? = "0"
    var passengerCarry:String? = "0"
    var aboveTen:String? = "1"
    
    var selectedVClassID:String? = ""
    var selectedVCatID:String? = ""
    var selectedVTypeID:String? = ""
    var selectedVWeightRangeID:String? = ""
    
    var addonsList = [AddonsTable]()
    var premiumCoverTypeList = [PremiumCoverTypeTable]()
    var premiumRatesList = [PremiumRates]()
    var addOnList = [Addons]()
    var extraFieldsList = [ExtraFieldsTable]()
    var vehicleTypeList = [VehicleType]()
    var vehicleCatList = [VehicleCategories]()
    var vehicleClassList = [VehicleClass]()
    var vehicleWeightRangeList = [WeightRanges]()
    
    
    var vehicleClassModel:VehicleClassModel?
    var vehicleCatModel:VehicleCatModel?
    var vehicleTypesModel:VehicleTypesModel?
    
    var weightRangeModel:WeightRangeModel?
    
    @IBOutlet weak var radioPassCarryYes: DLRadioButton!
    @IBOutlet weak var radioPassCarryNo: DLRadioButton!
    
    @IBOutlet weak var radioTenYes: DLRadioButton!
    
    @IBOutlet weak var radioTenNo: DLRadioButton!
    var premiumComputeModel:PremiumComputeModel?
    
    @IBOutlet weak var viewContentHeightAnchor: NSLayoutConstraint!
    
    @IBOutlet weak var btnLogout: UIButton!
    
    @IBOutlet weak var lblCompPremium: UILabel!
    @IBOutlet weak var lblCompPremiumVat: UILabel!
    var sComPremium = String()
    var sCompPremiumVat = String()
    
    @IBOutlet weak var lblTpftPremium: UILabel!
    @IBOutlet weak var lblTpftPremiumVat: UILabel!
    var sTPFTPremium = String()
    var sTPFTPremiumVat = String()
    
    @IBOutlet weak var lblTpoPremium: UILabel!
    @IBOutlet weak var lblTpoPremiumVat: UILabel!
    var sTPOPremium = String()
    var sTPOPremiumVat = String()
    
    
    @IBOutlet weak var viewAnimateBottom: NSLayoutConstraint!
    
    let percentage = 0.18
    
    
    func formatNumber(amountValue:String)-> String
    {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        
        // Changed by Praveen on 06-01-2021
//
//        if amountValue.count == 9
//        {
//                    formatter.locale = Locale(identifier: "en_IN")
//
//        }
//        else
//
//        {
//            formatter.locale = Locale.current
//
//        }
        
        formatter.locale = Locale(identifier: "en_US")

        
        // Changed by Praveen on 06-01-2021

        formatter.maximumFractionDigits = 2
        let result:String = formatter.string(from: Double(amountValue)! as NSNumber)!
        return result
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.lblName.text = "Welcome " + sharedData.getUserName()
        setupToolbar()
        self.addDoneButtonOnKeyboard()

        DBHandler.shared.createVehicleClass()
        DBHandler.shared.createVehicleCategory()
        DBHandler.shared.createVehicleTypes()
        DBHandler.shared.createWeightRange()
        DBHandler.shared.createPremiumCoverType()
        DBHandler.shared.createAddons()
        DBHandler.shared.createPremiumRates()
        DBHandler.shared.createExtraFields()
        
       sComPremium = "0"
        sCompPremiumVat = "0"
        sTPOPremium = "0"
        sTPFTPremium = "0"
        sTPOPremiumVat = "0"
        sTPFTPremiumVat = "0"
        
        self.lblPremuimValueWithoutVat.text = "TSH 0"
        self.lblPremiumVAlueWith18Vat.text = "TSH 0"
        
     
        
        btnComprehensive.layer.backgroundColor = UIColor.init(r: 6.0, g: 88.0, b: 46.0).cgColor
        btnComprehensive.titleLabel?.textColor = UIColor.white
        btnComprehensive.setTitleColor(UIColor.white, for: .normal)
        btnTPFT.layer.backgroundColor = UIColor.init(r: 239.0, g: 239.0, b: 239.0).cgColor
        btnTPO.layer.backgroundColor = UIColor.init(r: 239.0, g: 239.0, b: 239.0).cgColor

        btnTPO.titleLabel?.textColor = UIColor.darkGray
        btnTPFT.titleLabel?.textColor = UIColor.darkGray
        
//        viewContent.addTopRoundedCornerToView(targetView: viewContent, desiredCurve: 0.4)


        self.getTableData()
        
        self.weightRangeLists.removeAll()
        self.addonsTableLists.removeAll()
        self.vehicleClassLists.removeAll()
        self.vehicleClassLists = DBHandler.shared.fetchVehicleClassTab()
        self.addonsTableLists = DBHandler.shared.fetchAddons()
        self.weightRangeLists =  DBHandler.shared.fetchVehicleWeightRange()
        
        // Do any additional setup after loading the view.
        self.txtVehicleValue.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        self.btnProfile.layer.cornerRadius =  self.btnProfile.frame.size.height/2
        self.btnProfile.clipsToBounds = true
        
        self.btnLogout.layer.cornerRadius =  self.btnLogout.frame.size.height/2
        self.btnLogout.clipsToBounds = true
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        viewPopupBG.addGestureRecognizer(tap)
        
        viewTable.layer.cornerRadius = 10.0
        tableVehicle.layer.cornerRadius = 10.0
        tableVehicle.clipsToBounds = true
        viewTable.clipsToBounds = true
        
        btnCompute.layer.cornerRadius = 10
        
        self.tableAddOn.delegate = self
        self.tableAddOn.dataSource = self
        
        
        txtVehicleValue.delegate = self
        txtVehicleSeatNo.delegate = self
        
        
        viewContent.layer.shadowColor = UIColor.lightGray.cgColor
        viewContent.layer.shadowOpacity = 1
        viewContent.layer.shadowOffset = .zero
        viewContent.layer.shadowRadius = 5
        

        viewPremium.layer.shadowColor = UIColor.lightGray.cgColor
        viewPremium.layer.shadowOpacity = 1
        viewPremium.layer.shadowOffset = .zero
        viewPremium.layer.shadowRadius = 5
        
        viewAnimate.layer.shadowColor = UIColor.lightGray.cgColor
        viewAnimate.layer.shadowOpacity = 1
        viewAnimate.layer.shadowOffset = .zero
        viewAnimate.layer.shadowRadius = 5
        
        viewButton.layer.shadowColor = UIColor.lightGray.cgColor
        viewButton.layer.shadowOpacity = 1
        viewButton.layer.shadowOffset = .zero
        viewButton.layer.shadowRadius = 5
        
        //DownArrow
        btnAddOn.titleLabel?.textAlignment = .left
        //self.tableAddOn.register(TableAddOnCell.self, forCellReuseIdentifier: "TableAddOnCell")
        self.tableAddOn.separatorStyle = .none;
        print("self.tableAddOn --- ",self.tableAddOn.frame.size.height)
        print("self.tableAddOn --- ",tableAddOn.contentSize.height)
        
        self.tableAddOn.reloadData()
        self.tableAddOn.layoutIfNeeded()
        self.tableAddOn.heightAnchor.constraint(equalToConstant: self.tableAddOn.contentSize.height).isActive = true
        
        viewTypeHeight.constant = 0
        
        self.premiumCoverTypeList.removeAll()
        self.premiumCoverTypeList = DBHandler.shared.fetchPremiumCoverType()
        
        self.premiumRatesList.removeAll()
        self.premiumRatesList = DBHandler.shared.fetchPremiumRates()
        
        self.addonsList.removeAll()
        self.addonsList = DBHandler.shared.fetchAddons()
        
        self.extraFieldsList.removeAll()
        self.extraFieldsList = DBHandler.shared.fetchExtraFields()
        
        
        self.vehicleClassList.removeAll()
        self.vehicleClassList = DBHandler.shared.fetchVehicleClass()
        //self.vehicleCatList = DBHandler.shared.fetchVehicleCat()
        
        self.vehicleWeightRangeList.removeAll()
        self.vehicleWeightRangeList = DBHandler.shared.fetchVehicleWeight()
        
        //self.insertDataToTable()
        
        self.viewConditions.isHidden = true
        self.viewPassCarrying.isHidden = true
        self.viewAbove.isHidden = true
        self.viewWeight.isHidden = true
        self.viewSeat.isHidden = true
        
        self.viewPassengerTop.priority = UILayoutPriority(rawValue: 999)//hide
        self.viewAboveTen.priority = UILayoutPriority(rawValue: 999)//hide
        self.viewWeightTop.priority = UILayoutPriority(rawValue: 999)//hide
        self.viewSeatTop.priority = UILayoutPriority(rawValue: 999)//hide
        
        print("self.addonsList ",self.addonsTableLists.count)
        tableAddOn.reloadData()
        
        let userdefaults = UserDefaults.standard
        if let savedValue = userdefaults.string(forKey: "vatPercentage"){
            self.vatFromService = Double(savedValue)!
        } else {
          
        }
        
       let tapp = UITapGestureRecognizer(target: self, action: #selector(self.handleT(_:)))
        //self.scrollHome.addGestureRecognizer(tapp)
    }
    
    
    
    
    func setupToolbar()
    {
     //Create a toolbar
     let bar = UIToolbar()
     //Create a done button with an action to trigger our function to dismiss the keyboard
     let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMyKeyboard))
     //Create a felxible space item so that we can add it around in toolbar to position our done button
     let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
     //Add the created button items in the toobar
     bar.items = [flexSpace, flexSpace, doneBtn]
     bar.sizeToFit()
     //Add the toolbar to our textfield
     txtVehicleValue.inputAccessoryView = bar
     }
     @objc func dismissMyKeyboard(){
     view.endEditing(true)
     }
     
    
    
    
    @objc func handleT(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        self.txtVehicleValue.resignFirstResponder()
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTable.isHidden = true
        viewPopupBG.isHidden = true
        tableVehicle.isHidden = true
        
    }
    @IBAction func ActionComprehensive(_ sender: Any)
    {
        
       
        let myStringArr = sComPremium.components(separatedBy: ".")
        sComPremium = myStringArr[0] as String
        
        let myStringArr2 = sCompPremiumVat.components(separatedBy: ".")
        sCompPremiumVat = myStringArr2[0] as String
        
        
//        self.lblPremuimValueWithoutVat.text =  "TSH " + sComPremium
//        self.lblPremiumVAlueWith18Vat.text =  "TSH " + sCompPremiumVat

        if sComPremium != "TSH 0"
        {
            self.lblPremuimValueWithoutVat.text =  "TSH " + sComPremium

        }
        else
        {
            self.lblPremuimValueWithoutVat.text =  sComPremium

        }
        if sCompPremiumVat != "TSH 0"
        {
            self.lblPremiumVAlueWith18Vat.text = "TSH " + sCompPremiumVat

        }
        else
        {
            self.lblPremiumVAlueWith18Vat.text =  sCompPremiumVat

        }
        btnComprehensive.layer.backgroundColor = UIColor.init(r: 6.0, g: 88.0, b: 46.0).cgColor
        btnTPO.layer.backgroundColor = UIColor.init(r: 239.0, g: 239.0, b: 239.0).cgColor
        btnTPFT.layer.backgroundColor = UIColor.init(r: 239.0, g: 239.0, b: 239.0).cgColor

        btnComprehensive.titleLabel?.textColor = UIColor.white
        btnTPO.titleLabel?.textColor = UIColor.darkGray
        btnTPFT.titleLabel?.textColor = UIColor.darkGray
    }
    
    
    @IBAction func ActionTPFT(_ sender: Any)
    {
       
       


        
        
        let myStringArr = sTPFTPremium.components(separatedBy: ".")
        sTPFTPremium = myStringArr[0] as String
        
        let myStringArr2 = sTPFTPremiumVat.components(separatedBy: ".")
        sTPFTPremiumVat = myStringArr2[0] as String
        
        if sTPFTPremium != "TSH 0"
        {
            self.lblPremuimValueWithoutVat.text =  "TSH " + sTPFTPremium

        }
        else
        {
            self.lblPremuimValueWithoutVat.text =  sTPFTPremium

        }
        if sTPFTPremiumVat != "TSH 0"
        {
            self.lblPremiumVAlueWith18Vat.text = "TSH " + sTPFTPremiumVat

        }
        else
        {
            self.lblPremiumVAlueWith18Vat.text =  sTPFTPremiumVat

        }
        btnTPFT.setTitleColor(UIColor.white, for: .normal)

//        btnTPFT.titleLabel?.textColor = UIColor.white
        btnTPO.titleLabel?.textColor = UIColor.darkGray
        btnComprehensive.titleLabel?.textColor = UIColor.darkGray
        
        btnComprehensive.layer.backgroundColor = UIColor.init(r: 239.0, g: 239.0, b: 239.0).cgColor
        btnTPO.layer.backgroundColor = UIColor.init(r: 239.0, g: 239.0, b: 239.0).cgColor
        btnTPFT.layer.backgroundColor = UIColor.init(r: 6.0, g: 88.0, b: 46.0).cgColor

        
        
        
        
        
        
        

    }
    
    
    @IBAction func ActionTPO(_ sender: Any)
    {
        
     
        
        
        let myStringArr = sTPOPremium.components(separatedBy: ".")
        sTPOPremium = myStringArr[0] as String
        
        let myStringArr2 = sTPOPremiumVat.components(separatedBy: ".")
        sTPOPremiumVat = myStringArr2[0] as String
        
        if sTPOPremium != "TSH 0"
        {
            self.lblPremuimValueWithoutVat.text =  "TSH " + sTPOPremium

        }
        else
        {
            self.lblPremuimValueWithoutVat.text =  sTPOPremium

        }
        if sCompPremiumVat != "TSH 0"
        {
            self.lblPremiumVAlueWith18Vat.text = "TSH " + sTPOPremiumVat

        }
        else
        {
            self.lblPremiumVAlueWith18Vat.text =  sTPOPremiumVat

        }
//        self.lblPremuimValueWithoutVat.text = "TSH " + sTPOPremium
//        self.lblPremiumVAlueWith18Vat.text = "TSH " + sTPOPremiumVat
        
        btnTPO.setTitleColor(UIColor.white, for: .normal)

//        btnTPO.titleLabel?.textColor = UIColor.white
        btnTPO.layer.backgroundColor = UIColor.init(r: 6.0, g: 88.0, b: 46.0).cgColor
        btnComprehensive.titleLabel?.textColor = UIColor.darkGray
        btnTPFT.titleLabel?.textColor = UIColor.darkGray
        btnComprehensive.layer.backgroundColor = UIColor.init(r: 239.0, g: 239.0, b: 239.0).cgColor
        btnTPFT.layer.backgroundColor = UIColor.init(r: 239.0, g: 239.0, b: 239.0).cgColor
        
        
        
        

    }
    
    
    
    func getTableData() {
        
        self.view.activityStartAnimating()
        var timeValue:String
        let userdefaults = UserDefaults.standard
        if let savedValue = userdefaults.string(forKey: "time"){
            print("savedValue  ----- ",savedValue)
            timeValue = savedValue
            
        } else {
            //sharedDefault.setFcmToken(token: fcmToken)
            timeValue = ""
        }
        // for test
//        let loginURL = Constants.tableDataURLTest
        
        
        
        // for live
        let loginURL = Constants.tableDataURL

        
        print("loginURL",loginURL)
        var postDict = Dictionary<String,String>()
        postDict = [
            "lastupdate_time":timeValue
            
        ]
        
        AF.request(loginURL, method: .post, parameters: postDict, encoding: URLEncoding.default, headers: nil).responseJSON { (data) in
            print("Response:***:",data.description)
            print("postDict:***:",postDict)
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
                        
                        self.sharedData.setVat(token: (self.premiumDropModel?.premiumModelData?.vatPercentage!)!)
                        self.vatFromService = Double (self.sharedData.getVat())!/100
                        
                        
                        
                        let userdefaults = UserDefaults.standard
                        if let savedValue = userdefaults.string(forKey: "time"){
                            if self.premiumDropModel?.dbUpdate == 1
                            {
                                self.insertDataToTable()
                            }
                            
                        } else
                        {
                            self.insertDataToTable()
                        }
                        self.sharedData.setTime(token: (self.premiumDropModel?.updateTime!)!)
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
    
    
    func insertDataToTable() {
        
            //insert table
            self.vehicleClassLists = (self.premiumDropModel?.premiumModelData?.vehicleClassTable)!
            
            DBHandler.shared.insertVehicleClass(array: self.vehicleClassLists)
            
            self.vehicleCategoryLists = (self.premiumDropModel?.premiumModelData?.vehicleCategoryTable)!
            DBHandler.shared.insertVehicleCat(array: self.vehicleCategoryLists)
            self.vehicleTypesLists = (self.premiumDropModel?.premiumModelData?.vehicleTypesTable)!
            DBHandler.shared.insertVehicleType(array: self.vehicleTypesLists)
            self.weightRangeLists = (self.premiumDropModel?.premiumModelData?.weightRangeTable)!
            DBHandler.shared.insertVehicleWeightRange(array: self.weightRangeLists)
            
            self.premiumCoverTypeLists = (self.premiumDropModel?.premiumModelData?.premiumCoverTypeTable)!
            DBHandler.shared.insertPremiumCoverType(array: self.premiumCoverTypeLists)
            
            
            self.addonsTableLists = (self.premiumDropModel?.premiumModelData?.addonsTable)!
            DBHandler.shared.insertAddons(array: self.addonsTableLists)
            
            
            self.premiumRatesLists = (self.premiumDropModel?.premiumModelData?.premiumRates)!
            DBHandler.shared.insertPremiumRates(array: self.premiumRatesLists)
            
            self.extraFieldLists = (self.premiumDropModel?.premiumModelData?.extraFieldsTable)!
            DBHandler.shared.insertExtraFields(array: self.extraFieldLists)
    
    }
    // MARK:UITextField Delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtVehicleValue{
            // Uses the number format corresponding to your Locale
             let formatter = NumberFormatter()
             formatter.numberStyle = .decimal
//             formatter.locale = Locale.current
            
            formatter.locale = Locale(identifier: "en_US")

             formatter.maximumFractionDigits = 0


            // Uses the grouping separator corresponding to your Locale
            // e.g. "," in the US, a space in France, and so on
            if let groupingSeparator = formatter.groupingSeparator {

                if string == groupingSeparator {
                    return true
                }


                if let textWithoutGroupingSeparator = textField.text?.replacingOccurrences(of: groupingSeparator, with: "") {
                    var totalTextWithoutGroupingSeparators = textWithoutGroupingSeparator + string
                    if string.isEmpty { // pressed Backspace key
                        totalTextWithoutGroupingSeparators.removeLast()
                    }
                    if let numberWithoutGroupingSeparator = formatter.number(from: totalTextWithoutGroupingSeparators),
                        let formattedText = formatter.string(from: numberWithoutGroupingSeparator) {

                        textField.text = formattedText
                        return false
                    }
                }
            }
        }
         
        return true
    }
    // MARK: keyboard notification
    @objc func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollHome.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollHome.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollHome.contentInset = contentInset
    }
    
    
    
    
    
    
    @IBAction func btnProfileAction(_ sender: UIButton) {
    }
    
    @IBAction func btnVehicleAction(_ sender: UIButton)
    {

        tableStatus = 0
        self.viewConditions.isHidden = true
        self.viewPassCarrying.isHidden = true
        self.viewAbove.isHidden = true
        self.viewWeight.isHidden = true
        self.viewSeat.isHidden = true
        
        self.viewPassengerTop.priority = UILayoutPriority(rawValue: 999)//hide
        self.viewAboveTen.priority = UILayoutPriority(rawValue: 999)//hide
        self.viewWeightTop.priority = UILayoutPriority(rawValue: 999)//hide
        self.viewSeatTop.priority = UILayoutPriority(rawValue: 999)//hide
        
        if self.vehicleClassLists.count>0
        {
            print("vehicleClassList")
            self.tableVehicle.reloadData()
            self.viewTable.isHidden = false
            self.viewPopupBG.isHidden = false
            self.tableVehicle.isHidden = false
            self.tableVehicle.tableFooterView = UIView()
        }
        else
        {
            self.getTableData()
            //self.getVehicleClass()
        }
        
        
        
    }
    @IBAction func btnTypeAction(_ sender: UIButton) {
        tableStatus = 2
        
        if self.vehicleTypesLists.count>0 {
            self.tableVehicle.reloadData()
            self.viewTable.isHidden = false
            self.viewPopupBG.isHidden = false
            self.tableVehicle.isHidden = false
            self.tableVehicle.tableFooterView = UIView()
        }
        else
        {
            //self.getVehicleType()
            self.getTableData()
        }
        
        
        
    }
    @IBAction func btnCategoryAction(_ sender: UIButton) {
        tableStatus = 1
        
        if self.vehicleCategoryLists.count>0 {
            self.tableVehicle.reloadData()
            self.viewTable.isHidden = false
            self.viewPopupBG.isHidden = false
            self.tableVehicle.isHidden = false
            self.tableVehicle.tableFooterView = UIView()
        }
        else
        {
            self.getTableData()
            //self.getVehicleCategory()
        }
        
        
    }
    @IBAction func btnWeightAction(_ sender: UIButton) {
        self.tableStatus = 3
        if self.vehicleTypesLists.count>0 {
            self.tableVehicle.reloadData()
            self.viewTable.isHidden = false
            self.viewPopupBG.isHidden = false
            self.tableVehicle.isHidden = false
            self.tableVehicle.tableFooterView = UIView()
        }
        else
        {
            self.getTableData()
            //self.getWeightRange()
        }
    }
    
    
    @IBAction func btnComputeAction(_ sender: UIButton)
    {
        sComPremium = "0"
        sCompPremiumVat = "0"
        sTPOPremium = "0"
        sTPOPremiumVat = "0"
        sTPFTPremium = "0"
        sTPFTPremiumVat = "0"
        //let formatted = String(format: "Angle: %.2f", angle)
        self.getTableData()

        if txtVehicle.text!.count<=0
        {
            self.showToast(message: "Select vehicle class")
        }
        else if txtCategory.text!.count<=0
        {
            self.showToast(message: "Select category")
        }
        else if txtVehicleValue.text!.count<=0
        {
            self.showToast(message: "Enter vehicle value")
        }
        else if viewTypeHeight.constant > 0.0 && self.txtType.text!.count<=0
        {
                self.showToast(message: "Select vehicle type")
        }
        else if self.viewConditions.isHidden == false && self.viewWeight.isHidden == false  && txtWeightRange.text!.count<=0
        {
            self.showToast(message: "Select vehicle weight range")
        }
        else if self.viewConditions.isHidden == false  && self.viewSeat.isHidden == false && txtVehicleSeatNo.text!.count<=0
        {
            self.showToast(message: "Enter number of seat")
        }
        else
        {
            
            
            var sVehicleValueTest = txtVehicleValue.text
            sVehicleValueTest = sVehicleValueTest?.replacingOccurrences(of: ",", with: "")
            if !sVehicleValueTest!.isNumber
            {
                self.showToast(message: "Please enter valid vehicle value")

            }
            else
            {
                            
            let editedText = txtVehicleValue.text?.replacingOccurrences(of: ",", with: "")
            let vehicleValue = Double(editedText!)
            
            if selectedVClassID == "1"
            {
                if selectedVCatID == "2" || selectedVCatID == "3" || selectedVCatID == "4" || selectedVCatID == "5" || selectedVCatID == "6" || selectedVCatID == "7"    {
                    var compPremiumRatesList = [PremiumRates]()
                    //var query = "PremiumRates"
                    let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\""
                    compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                    var comprehensiveVat = 0.0
                    var minPremium:Double = 0.0
                    var tpftPercentage = 0.0
                    var tpo:Double = 0.0
                    var claimPercent = 0.0
                    var tpfTotalValue = 0.0
                    var tpfTotalVat = 0.0
                    var comprehensiveFree = 0.0
                    
                    for item in compPremiumRatesList {
                        if item.premiumType == 3 {
                            tpo = Double(item.claimFreeRate!)!
                            let mintpo = Double(item.minimumRate!)!
                            if tpo<mintpo {
                                tpo = mintpo
                            }
                            let tpoVatValue = tpo * vatFromService + tpo
//                            self.lblTpoPremium.text = String(tpo)
//                            self.lblTpoPremiumVat.text = String(tpoVatValue)
                            
                            
                            self.sTPOPremium = String(tpo)
                            self.sTPOPremiumVat = String(tpoVatValue)
                        }
                    }
                    for item in compPremiumRatesList {
                        if item.premiumType == 1 {
                            
                            let minVal = item.minimumRate!
                            minPremium = Double(minVal)!
                            let claimFreeVal = item.claimFreeRate!
                            let claimVal = item.claimOnRate!
                            if claimHistory == "0" {
                                claimPercent = Double(claimFreeVal)!
                            }
                            else if claimHistory == "1" {
                                claimPercent =  Double(claimVal)!
                            }
                            print("claimPercent",claimPercent)
                            if claimHistory == "0" {
                                if item.claimFreeRatePercent == 1 {
                                    comprehensiveFree = vehicleValue! * claimPercent/100
                                    
                                } else {
                                    comprehensiveFree =  claimPercent
                                }
                                
                            } else if claimHistory == "1" {
                                if item.claimOnRatePercent == 1 {
                                    comprehensiveFree = vehicleValue! * claimPercent/100
                                }
                                else {
                                    comprehensiveFree =  claimPercent
                                }
                            }
                            print("comprehensiveFree",comprehensiveFree)
                            if comprehensiveFree < minPremium
                            {
                                comprehensiveFree = minPremium
                            }
                            comprehensiveFinal = comprehensiveFree
                            
                            comprehensiveVat = comprehensiveFree * vatFromService + comprehensiveFree
                            print("vatFromService ---- ",vatFromService)
//                            self.lblCompPremium.text = String(format: "%.2f", comprehensiveFree)
//                            self.lblCompPremiumVat.text = String(format: "%.2f", comprehensiveVat)
                            
                            sComPremium = String(format: "%.2f", comprehensiveFree)
                            sCompPremiumVat = String(format: "%.2f", comprehensiveVat)
                            
                            self.lblPremuimValueWithoutVat.text = sComPremium
                            self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat

                        }
                            
                        else if item.premiumType == 2 {
                            let minVal = Double(item.minimumRate!)!
                            tpftPercentage = Double(item.claimFreeRate!)!
                            if item.claimFreeRatePercent == 1
                            {
                                tpfTotalValue = tpftPercentage/100 * vehicleValue! + Double(tpo)
                                
                            }
                            else
                            {
                                tpfTotalValue = tpftPercentage  + Double(tpo)
                            }
                            if tpfTotalValue < Double(minVal)
                            {
                                tpfTotalValue = Double(minVal)
                            }
                            tpfTotalVat = tpfTotalValue * vatFromService + tpfTotalValue
                            
//                            self.lblTpftPremium.text = String(format: "%.2f", tpfTotalValue)
//                            self.lblTpftPremiumVat.text = String(format: "%.2f", tpfTotalVat)
                            
                            self.sTPFTPremium = String(format: "%.2f", tpfTotalValue)
                            self.sTPFTPremiumVat = String(format: "%.2f", tpfTotalVat)
                        }
                    }
                }
            }
            else if selectedVClassID == "2"
            {
                //comprehensive 2 wheeler
//                let vehicleValue = Double(txtVehicleValue.text!)
                
                let vehicleValue = Double(editedText!)

                var minPremium:Double = 0.0

                var passengerValue:Double = 0.0
                var claim2wPercent = 0.0
                var extaPremium2w = 0.0
                
                var tpft2wPercent = 0.0
                var tpo2w = 0.0
                var extaTpo2wPassCarry = 0.0
                var minTpft2w = 0.0
                var tpft2w = 0.0
                var tpft2wVat = 0.0
                
                //2 Wheeler
                if selectedVCatID == "8"
                {
                    
                    var compPremiumRatesList = [PremiumRates]()
                    let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" "
                    compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                    /*
                     ["vehicle_class": 2, "per_seat_extra": "0.00", "premium_type": 1, "claim_on_rate_percent": 1, "extra_claim_rate_percent": 0, "pasger_carry_extra": "15000.00", "minimum_rate_percent": 0, "claim_free_rate_percent": 1, "extra_claim_rate": "0.00", "above_year_range": "0.00", "vehicle_category": 8, "status": 1, "pasger_carry_extra_percent": 0, "claim_free_rate": "5.00", "vehicle_type": 0, "id": 12, "minimum_rate": "0.00", "weight_range": 0, "per_seat_extra_percent": 0, "claim_on_rate": "6.00"]
                     */
                    for item in compPremiumRatesList
                    {
                        
                        
                        
                        if item.vehicleCategory == Int(selectedVCatID!)
                        {
                            print("compPremiumRatesList --- ",compPremiumRatesList.count)
                            if item.premiumType == 1
                            {
                                let minVal = item.minimumRate!
                                minPremium = Double(minVal)!
                                extaPremium2w = Double(item.pasgerCarryExtra!)!
                                let claimVal = item.claimOnRate!
                                let claimFreeVal = item.claimFreeRate!
                                if claimHistory == "0"
                                {
                                    claim2wPercent = Double(claimFreeVal)!
                                }
                                else if claimHistory == "1"
                                {
                                    claim2wPercent = Double(claimVal)!
                                }
                                var comprehensive2w = 0.0
                                comprehensive2w = (vehicleValue! * claim2wPercent/100)
                                if comprehensive2w < Double(minPremium)
                                {
                                    comprehensive2w = Double(minPremium)
                                }
                                
                                if item.claimFreeRatePercent == 1
                                {
                                    if passengerCarry == "1"
                                    {
                                        comprehensive2w = comprehensive2w + Double(extaPremium2w)
                                    }
                                    else if passengerCarry == "0"
                                    {
                                        comprehensive2w = (vehicleValue! * claim2wPercent/100)
                                        
                                        if comprehensive2w < Double(minPremium)
                                        {
                                            comprehensive2w = Double(minPremium)
                                        }
                                    }
                                }
                                else
                                {
                                    if passengerCarry == "1"
                                    {
                                        comprehensive2w =  claim2wPercent + Double(extaPremium2w)
                                    }
                                    else if passengerCarry == "0"
                                    {
                                        comprehensive2w = claim2wPercent
                                    }
                                }
                                
                                print("comprehensiveFree",comprehensive2w)
                                
                                if comprehensive2w < minPremium
                                {
                                    comprehensive2w = minPremium
                                }
                                comprehensiveFinal = comprehensive2w
                                let comprehensive2wVat = comprehensive2w * vatFromService + comprehensive2w
//                                self.lblCompPremium.text = String(format: "%.2f", comprehensive2w)
//                                self.lblCompPremiumVat.text = String(format: "%.2f", comprehensive2wVat)
                                
                                sComPremium = String(format: "%.2f", comprehensive2w)
                                sCompPremiumVat = String(format: "%.2f", comprehensive2wVat)
                                self.lblPremuimValueWithoutVat.text = sComPremium
                                self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat
                                
                            }
                            else if item.premiumType == 3
                            {
                                
                                if passengerCarry == "1"
                                {
                                    passengerValue = 1
                                }
                                else if passengerCarry == "0"
                                {
                                    passengerValue = 0
                                }
                                
                                tpo2w = Double(item.claimFreeRate!)!
                                
                                if passengerCarry == "1"
                                {
                                    tpo2w = tpo2w + Double(item.pasgerCarryExtra!)!
                                }
                                tpft2wVat = Double(tpo2w) * Double(vatFromService) + Double(tpo2w)
//                                self.lblTpoPremium.text = String(format: "%.2f", tpo2w)
//
//                                self.lblTpoPremiumVat.text = String(format: "%.2f", tpft2wVat)
                                
                                self.sTPOPremium = String(format: "%.2f", tpo2w)
                                self.sTPOPremiumVat = String(format: "%.2f", tpft2wVat)
                                
                                
                            }
                            else if item.premiumType == 2
                            {
                                
                                extaTpo2wPassCarry = tpo2w
                                minTpft2w = Double(item.minimumRate!)!
                                let claimFreeVal = item.claimFreeRate!
                                tpft2wPercent = Double(claimFreeVal)!
                                if item.claimFreeRatePercent == 1
                                {
                                    tpft2w = vehicleValue! * tpft2wPercent/100 + Double(tpo2w)
                                }
                                else
                                {
                                    tpft2w = tpft2wPercent
                                }
                                
                                print("tpft2w ",tpft2w)
                                if tpft2w<Double(minTpft2w)
                                {
                                    tpft2w = Double(minTpft2w)
                                }
                                
                                
//                                self.lblTpftPremium.text = String(format: "%.2f", tpft2w)
                                
                                tpft2wVat = (tpft2w * vatFromService) + tpft2w
//                                self.lblTpftPremiumVat.text = String(format: "%.2f", tpft2wVat)
                                
                                self.sTPFTPremium = String(format: "%.2f", tpft2w)
                                self.sTPFTPremiumVat = String(format: "%.2f", tpft2wVat)
                                
                            }
                            
                        }
                    }
                    
                }
                    
                else if selectedVCatID == "9" {
                    //3 Wheeler
                    var minTpft3w = 0.0
                    var tpft3w = 0.0
                    var tpft3wVat = 0.0
                    var tpft3wPercent = 0.0
                    var tpo3w = 0.0
                    var extaTpo3wPassCarry = 0.0
                    var extaPremium3wPassCarry = 0.0
                    var minPremium3w = 0.0
                    var claim3wPercent = 0.0
                    
                    var compPremiumRatesList = [PremiumRates]()
                    let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" "
                    compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                    
                    for item in compPremiumRatesList
                    {
                        if item.vehicleCategory == Int(selectedVCatID!)
                        {
                            if item.premiumType == 1
                            {
                                minPremium3w  = Double(item.minimumRate!)!
                                extaPremium3wPassCarry = Double(item.pasgerCarryExtra!)!
                                let claimVal = item.claimOnRate!
                                let claimFreeVal = item.claimFreeRate!
                                if claimHistory == "0"
                                {
                                    claim3wPercent = Double(claimFreeVal)!
                                    
                                } else if claimHistory == "1"
                                {
                                    claim3wPercent = Double(claimVal)!
                                }
                                
                                var comprehensive3w = 0.0
                                if item.claimFreeRatePercent == 1
                                {
                                    
                                    
                                    comprehensive3w = (vehicleValue! * claim3wPercent/100)
                                    if comprehensive3w < Double(minPremium3w)
                                    {
                                        comprehensive3w = Double(minPremium3w)
                                    }
                                    
                                    
                                    if passengerCarry == "1"
                                    {
                                        
                                        
                                        comprehensive3w = comprehensive3w + Double(extaPremium3wPassCarry)
                                        
                                    }
                                    
                                    
                                    else if passengerCarry == "0"
                                    {
                                        comprehensive3w = (vehicleValue! * claim3wPercent/100)
                                    
                                    if comprehensive3w < Double(minPremium3w)
                                    {
                                        comprehensive3w = Double(minPremium3w)
                                    }
                                    }
                                }
                                else
                                {
                                    if passengerCarry == "1"
                                    {
                                        comprehensive3w =  claim3wPercent + Double(extaPremium3wPassCarry)
                                    }
                                    else if passengerCarry == "0"
                                    {
                                        comprehensive3w =  claim3wPercent
                                    }
                                    
                                }
                                if comprehensive3w < Double(minPremium3w)
                                {
                                    comprehensive3w = Double(minPremium3w)
                                }
                                comprehensiveFinal = comprehensive3w
                                let comprehensive3wVat = comprehensive3w * vatFromService + comprehensive3w
                                
                                sComPremium = String(format: "%.2f", comprehensive3w)
                                sCompPremiumVat = String(format: "%.2f", comprehensive3wVat)
                                self.lblPremuimValueWithoutVat.text = sComPremium
                                self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat
                                
//                                self.lblCompPremium.text = String(format: "%.2f", comprehensive3w)
//                                self.lblCompPremiumVat.text = String(format: "%.2f", comprehensive3wVat)
                            }
                            else if item.premiumType == 3
                            {
                                tpo3w = Double(item.claimFreeRate!)!
                                extaTpo3wPassCarry = Double(item.pasgerCarryExtra!)!
                                print("tpo3w",tpo3w)
                                print("extaTpo3wPassCarry",extaTpo3wPassCarry)
                                
                                if passengerCarry == "1"
                                {
                                    tpo3w = tpo3w + extaTpo3wPassCarry
                                }
                                else if passengerCarry == "0"
                                {
                                    
                                }
                                
                                tpft3w = tpo3w
                                
                                tpft3wVat = Double(tpo3w) * Double(vatFromService) + Double(tpo3w)
                                
                                
//                                self.lblTpoPremium.text = String(format: "%.2f", tpo3w)
//                                self.lblTpoPremiumVat.text = String(format: "%.2f", tpft3wVat)
//
                                
                                self.sTPOPremium = String(format: "%.2f", tpo3w)
                                self.sTPOPremiumVat = String(format: "%.2f", tpft3wVat)
                                
                                
                            }
                            else if item.premiumType == 2
                            {
                                var compPremiumRatesList = [PremiumRates]()
                                let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" AND premium_type=3 "
                                compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                                for item in compPremiumRatesList {
                                    tpo3w = Double(item.claimFreeRate!)!
                                    extaTpo3wPassCarry = Double(item.pasgerCarryExtra!)!
                                }
                                
                                minTpft3w = Double(item.minimumRate!)!
                                tpft3wPercent = Double(item.claimFreeRate!)!
                                
                                if passengerCarry == "1" {
                                    //tpo3w = tpo3w + extaTpo3wPassCarry
                                    tpft3w = vehicleValue! * tpft3wPercent/100 + Double(tpo3w) + Double(extaTpo3wPassCarry)
                                }
                                else if passengerCarry == "0"
                                {
                                    tpft3w = vehicleValue! * tpft3wPercent/100 + Double(tpo3w)
                                }
                                print("tpft3w 1111",tpo3w)
                                
                                
                                if tpft3w<Double(minTpft3w)
                                {
                                    tpft3w = Double(minTpft3w)
                                }
                                tpft3wVat = Double(tpft3w) * Double(vatFromService) + Double(tpft3w)
                                
//
//                                self.lblTpftPremium.text = String(format: "%.2f", tpft3w)
//                                self.lblTpftPremiumVat.text = String(format: "%.2f", tpft3wVat)
//
//
                                
                                self.sTPFTPremium = String(format: "%.2f", tpft3w)
                                self.sTPFTPremiumVat = String(format: "%.2f", tpft3wVat)
                                
                            }
                        }
                        
                    }
                    
                }
                
            }
            else if selectedVClassID == "3"
            {
                var tpoCommercial = 0.0
                
                var tpfPercentage = 0.0
                var tpfMinVal = 0.0
                var tpfTotalValue = 0.0
                var tpfTotalVatValue = 0.0
                var tpo = 0.0
                
                var totalVatValue = 0.0
                var minPremium = 0.0
                var claimValuePercent = 0.0
                var totalPremium = 0.0
//                let vehicleValue = Double(txtVehicleValue.text!)
                let vehicleValue = Double(editedText!)

                var steelOilTankerbeolw10 = 0.06
                
                var minPremStTankBelow10 = 0.0
                
                
                var minPremiunAbove = 0.0
                
                if selectedVCatID == "10"
                {
                    var compPremiumRatesList = [PremiumRates]()
                    let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" AND vehicleType =\"0\" "
                    
                    print("queryTPO",query)

                    
                    compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                    for item in compPremiumRatesList
                    {
                        if Int(selectedVWeightRangeID!) == item.weightRange
                        {
                            tpoCommercial = Double(item.claimFreeRate!)!
                        }
                    }
                    print("tpoCommercial",tpoCommercial)
                    
                    
                    //own
                    if selectedVTypeID == "2"
                    {
                        var compPremiumRatesList = [PremiumRates]()
                        let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" AND vehicleType =\"" + selectedVTypeID! + "\" "
                        
                        print("queryOwn",query)

                        compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                        for item in compPremiumRatesList
                        {
                            if item.premiumType == 1
                            {
                                minPremium = Double(item.minimumRate!)!
                                minPremiunAbove = minPremium
                                var comprehensive = 0.0
                                
                                if claimHistory == "0"
                                {
                                    
                                    
                                    
                                    claimValuePercent = Double(item.claimFreeRate!)!
                                    if item.claimFreeRatePercent == 1
                                    {
                                        
                                        // Change Praveen // just commented the below code

                                        comprehensive = vehicleValue! * claimValuePercent/100
                                        
                                        
                                    
                                        
                                        
                                        
                                    }
                                    else
                                    {
                                        comprehensive = claimValuePercent
                                    }
                                    if comprehensive < Double(minPremium)
                                    {
                                        comprehensive = Double(minPremium)
                                                                                
                                    }
                                    
                                }
                                else if claimHistory == "1"
                                {
                                    claimValuePercent = Double(item.claimOnRate!)!
                                    if item.claimFreeRatePercent == 1 
                                    {
                                        
                                        // Change Praveen // just commented the below code
                                        comprehensive = vehicleValue! * claimValuePercent/100
                                    }
                                    else
                                    {
                                        comprehensive =  claimValuePercent
                                    }
                                    
                                    if comprehensive < Double(minPremium)
                                    {
                                        comprehensive = Double(minPremium)
                                        
                                    }
                                }
                                print("claimValuePercent",claimValuePercent)
                                let comprehensiveVat = comprehensive * vatFromService + comprehensive
                                comprehensiveFinal = comprehensive
                                
                                sComPremium = String(format: "%.2f", comprehensive)
                                sCompPremiumVat = String(format: "%.2f", comprehensiveVat)
                                self.lblPremuimValueWithoutVat.text = sComPremium
                                self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat
                                
//                                self.lblCompPremium.text = String(format: "%.2f", comprehensive)
//                                self.lblCompPremiumVat.text = String(format: "%.2f", comprehensiveVat)
                            }
                            else if item.premiumType == 2
                            {
                                tpfPercentage = Double(item.claimFreeRate!)!
                                tpfMinVal = Double(item.minimumRate!)!
                                if item.claimFreeRatePercent == 1
                                {
                                    tpfTotalValue = tpfPercentage/100 * vehicleValue! + Double(tpoCommercial)
                                }
                                else
                                {
                                    tpfTotalValue = tpfPercentage  + Double(tpoCommercial)
                                }
                                
                                
                                
                                if tpfTotalValue < Double(tpfMinVal)
                                {
                                    tpfTotalValue = Double(tpfMinVal)
                                }
                                tpfTotalVatValue = tpfTotalValue * vatFromService + tpfTotalValue
                                
//                                self.lblTpftPremium.text = String(format: "%.2f", tpfTotalValue)
//                                self.lblTpftPremiumVat.text = String(format: "%.2f", tpfTotalVatValue)
//
                                self.sTPFTPremium = String(format: "%.2f", tpfTotalValue)
                                self.sTPFTPremiumVat = String(format: "%.2f", tpfTotalVatValue)
                                
                                
//                                self.lblTpoPremium.text = String(format: "%.2f", tpoCommercial)
                                let v = tpoCommercial * vatFromService + tpoCommercial
                                
//                                self.lblTpoPremium.text = String(format: "%.2f", v)
                                
                                self.sTPOPremium = String(format: "%.2f", tpoCommercial)
                                self.sTPOPremiumVat = String(format: "%.2f", v)
                                
                                
                                
                                
                            }
                        }
//                        self.lblTpoPremium.text = String(format: "%.2f", tpoCommercial)
                        
                        let tVatPre = tpoCommercial * vatFromService + tpoCommercial
                        
//                        self.lblTpoPremiumVat.text = String(format: "%.2f", tVatPre)
                        
                        self.sTPOPremium = String(format: "%.2f", tpoCommercial)
                        self.sTPOPremiumVat = String(format: "%.2f", tVatPre)
                        
                    }
                    //General
                    
                    
                    if selectedVTypeID == "1"
                    {
                        
                        var compPremiumRatesList = [PremiumRates]()
                        let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" AND vehicleType =\"" + selectedVTypeID! + "\" "
                        print("queryGeneral",query)
                        compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                        for item in compPremiumRatesList
                        {
                            if item.premiumType == 1
                            {
                                minPremium = Double(item.minimumRate!)!
                                var comprehensive = 0.0
                                if claimHistory == "0"
                                {
                                    claimValuePercent = Double(item.claimFreeRate!)!
                                    if item.claimFreeRatePercent == 1
                                    {
                                        comprehensive = vehicleValue! * claimValuePercent/100
                                    }
                                    else
                                    {
                                        comprehensive =  claimValuePercent
                                    }
                                    if comprehensive < Double(minPremium)
                                    {
                                        comprehensive = Double(minPremium)
                                        comprehensive = comprehensive + tpoCommercial
                                    }
                                    
                                    
                                    
                                }
                                else if claimHistory == "1"
                                {
                                    claimValuePercent = Double(item.claimOnRate!)!
                                    if item.claimFreeRatePercent == 1
                                    {
                                        comprehensive = vehicleValue! * claimValuePercent/100
                                    } else
                                    {
                                        comprehensive =  claimValuePercent
                                    }
                                    if comprehensive < Double(minPremium)
                                    {
                                        comprehensive = Double(minPremium)
                                        comprehensive = comprehensive + tpoCommercial
                                    }
                                }
                                
                                let comprehensiveVat = comprehensive * vatFromService + comprehensive
                                comprehensiveFinal = comprehensive
                                
//                                self.lblCompPremium.text = String(format: "%.2f", comprehensive)
//                                self.lblCompPremiumVat.text = String(format: "%.2f", comprehensiveVat)
                                
                                sComPremium = String(format: "%.2f", comprehensive)
                                sCompPremiumVat = String(format: "%.2f", comprehensiveVat)
                                self.lblPremuimValueWithoutVat.text = sComPremium
                                self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat
                                
                            }
                            else if item.premiumType == 3
                            {
                                
                                let tpo = Double(tpoCommercial)
                                let tpoVat = tpo * vatFromService + tpo
                                print("tpo",tpo)
                                
//                                self.lblTpoPremium.text = String(format: "%.2f", tpoCommercial)
//                                self.lblTpoPremiumVat.text = String(format: "%.2f", tpoVat)
                                
                                
                                self.sTPOPremium = String(format: "%.2f", tpoCommercial)
                                self.sTPOPremiumVat = String(format: "%.2f", tpoVat)
                                
                                
                            }
                            else if item.premiumType == 2
                            {
                                
                                tpfMinVal = Double(item.minimumRate!)!
                                tpfTotalValue = tpfPercentage/100 * vehicleValue! + Double(tpoCommercial)
                                
                                
                                if tpfTotalValue < Double(tpfMinVal)
                                {
                                    tpfTotalValue = Double(tpfMinVal)
                                }
                                tpfTotalVatValue = tpfTotalValue * vatFromService + tpfTotalValue
                                
//                                self.lblTpftPremium.text = String(format: "%.2f", tpfTotalValue)
//                                self.lblTpftPremiumVat.text = String(format: "%.2f", tpfTotalVatValue)
                                
                                print("TPFT ",tpfTotalValue)

                                self.sTPFTPremium = String(format: "%.2f", tpfTotalValue)
                                self.sTPFTPremiumVat = String(format: "%.2f", tpfTotalVatValue)
                            }
                        }
                        let tpo = Double(tpoCommercial)
                        let tpoVat = tpo * vatFromService + tpo
                        print("tpo",tpo)
//                        self.lblTpoPremium.text = String(format: "%.2f", tpoCommercial)
//                        self.lblTpoPremiumVat.text = String(format: "%.2f", tpoVat)
//
                        self.sTPOPremium = String(format: "%.2f", tpoCommercial)
                        self.sTPOPremiumVat = String(format: "%.2f", tpoVat)
                        
                        
                    }
                }
                    //Trailers
                else if selectedVCatID == "11"
                {
//                    let vehicleValue = Double(txtVehicleValue.text!)
                    
                    let vehicleValue = Double(editedText!)

                    var claimFee = 0.0
                    var minPremTrailers = 0.0

                    var compPremiumRatesList = [PremiumRates]()
                    let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" "
                    compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                    for item in compPremiumRatesList {
                        
                        minPremTrailers = Double(item.minimumRate!)!

                        if item.premiumType == 1 {
                            //less ten 10
                            if item.aboveYearRange == Int(aboveTen!)
                            {
                                if claimHistory == "0"
                                {
                                    claimFee = Double(item.claimFreeRate!)!
                                    
                                    
                                }
                                else if claimHistory == "1" {
                                    claimFee = Double(item.claimOnRate!)!
                                }
                            }
                                //greater than 10
                            else if item.aboveYearRange == Int(aboveTen!)
                            {
                                if claimHistory == "0" {
                                    claimFee = Double(item.claimFreeRate!)!
                                }
                                else if claimHistory == "1" {
                                    claimFee = Double(item.claimOnRate!)!
                                }
                            }
                        } else if item.premiumType == 3 {
                            
                            let tpftValue = Double(item.claimFreeRate!)!
                            
//                            self.lblTpoPremium.text = String(format: "%.2f", tpftValue)
                            let tpftVatValue = tpftValue * vatFromService + tpftValue
//                            self.lblTpoPremiumVat.text = String(format: "%.2f", tpftVatValue)
//
                            
                            self.sTPOPremium = String(format: "%.2f", tpftValue)
                            self.sTPOPremiumVat = String(format: "%.2f", tpftVatValue)
                            
                        }
                    }
                    
                    var comprehensive = 0.0
                    comprehensive = vehicleValue! * claimFee/100
                    
                    // changes Praveen
                    
                    if comprehensive < minPremTrailers
                    {
                        comprehensive = minPremTrailers
                    }
                    
                    comprehensiveFinal = comprehensive
                    let comprehensiveVat = comprehensive * vatFromService + comprehensive
                    
                    
                    
                    
//                    self.lblCompPremium.text = String(format: "%.2f", comprehensive)
//                    self.lblCompPremiumVat.text = String(format: "%.2f", comprehensiveVat)
                    
                    sComPremium = String(format: "%.2f", comprehensive)
                    sCompPremiumVat = String(format: "%.2f", comprehensiveVat)
                    self.lblPremuimValueWithoutVat.text = sComPremium
                    self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat
                    
                    
//
//                    self.lblTpftPremium.text = "0.0"
//                    self.lblTpftPremiumVat.text = "0.0"
                    
                }
                    //oil tanker
                else if selectedVCatID == "12" {
                    //steel tanker
                    if selectedVTypeID == "3" {
                        //steel tanker below 10 //aluminium tanker above 10
                        //less than 10
                        
                        var compPremiumRatesList = [PremiumRates]()
                        let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" "
                        compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                        for item in compPremiumRatesList {
                            if item.premiumType == 1 {
                                
                                
                                //<10 == 1
                                if Int(aboveTen!) == 1{
                                    var compPremiumRatesList = [PremiumRates]()
                                    let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" AND vehicleType =\"" + selectedVTypeID! + "\" "
                                    compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                                    for item in compPremiumRatesList {
                                        if item.premiumType == 1 {
                                            minPremStTankBelow10 = Double(item.minimumRate!)!
                                            steelOilTankerbeolw10 = Double(item.claimFreeRate!)!
                                            var comprehensive = vehicleValue! * steelOilTankerbeolw10/100
                                            
                                            if comprehensive < minPremStTankBelow10 {
                                                comprehensive = minPremStTankBelow10
                                            }
                                            let comprehensiveVat = comprehensive * vatFromService + comprehensive
                                            
                                            sComPremium = String(format: "%.2f", comprehensive)
                                            sCompPremiumVat = String(format: "%.2f", comprehensiveVat)
                                            self.lblPremuimValueWithoutVat.text = sComPremium
                                            self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat
                                            
//                                            self.lblCompPremium.text = String(format: "%.2f", comprehensive)
//                                            self.lblCompPremiumVat.text = String(format: "%.2f", comprehensiveVat)
                                        }
                                    }
                                    
                                }
                                    //greater than 10, >10 == 2
                                else if aboveTen == "2"{
                                    var compPremiumRatesList = [PremiumRates]()
                                    let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" AND vehicleType = \"0\" "
                                    compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                                    for item in compPremiumRatesList {
                                        if item.premiumType == 1 {
                                            minPremStTankBelow10 = Double(item.minimumRate!)!
                                            steelOilTankerbeolw10 = Double(item.claimFreeRate!)!
                                            var comprehensive = vehicleValue! * steelOilTankerbeolw10/100
                                            if comprehensive < minPremStTankBelow10
                                            {
                                                comprehensive = minPremStTankBelow10
                                            }
                                            let comprehensiveVat = comprehensive * vatFromService + comprehensive
                                            sComPremium = String(format: "%.2f", comprehensive)
                                            sCompPremiumVat = String(format: "%.2f", comprehensiveVat)
                                            self.lblPremuimValueWithoutVat.text = sComPremium
                                            self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat
                                            
//                                            self.lblCompPremium.text = String(format: "%.2f", comprehensive)
//                                            self.lblCompPremiumVat.text = String(format: "%.2f", comprehensiveVat)
                                        }
                                    }
                                    
                                }
                            }
                        }
                        
                        
                    }
                        //aluminium tanker
                    else if selectedVTypeID == "4"
                    {
//                        let vehicleValue = Double(txtVehicleValue.text!)
                        let vehicleValue = Double(editedText!)

                        
                        var compPremiumRatesList = [PremiumRates]()
                        let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" AND vehicleType =\"" + selectedVTypeID! + "\""
                        print(query)
                        compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                        for item in compPremiumRatesList {
                            if item.premiumType == 1 {
                                
                                
                                //<10 == 1
                                if Int(aboveTen!) == 1 {
                                    minPremStTankBelow10 = Double(item.minimumRate!)!
                                    steelOilTankerbeolw10 = Double(item.claimFreeRate!)!
                                    var comprehensive = vehicleValue! * steelOilTankerbeolw10/100
                                    
                                    if comprehensive < minPremStTankBelow10
                                    {
                                        comprehensive = minPremStTankBelow10
                                    }
                                    let comprehensiveVat = comprehensive * vatFromService + comprehensive
                                    comprehensiveFinal = comprehensive
                                    
                                    sComPremium = String(format: "%.2f", comprehensive)
                                    sCompPremiumVat = String(format: "%.2f", comprehensiveVat)
                                    self.lblPremuimValueWithoutVat.text = sComPremium
                                    self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat
//
//                                    self.lblCompPremium.text = String(format: "%.2f", comprehensive)
//                                    self.lblCompPremiumVat.text = String(format: "%.2f", comprehensiveVat)
                                }
                                    //greater than 10, >10 == 2
                                else if aboveTen == "2"{
                                    var compPremiumRatesList = [PremiumRates]()
                                    let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" AND vehicleType = \"0\" "
                                    compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                                    for item in compPremiumRatesList {
                                        if item.premiumType == 1 {
                                            minPremStTankBelow10 = Double(item.minimumRate!)!
                                            steelOilTankerbeolw10 = Double(item.claimFreeRate!)!
                                            var comprehensive = vehicleValue! * steelOilTankerbeolw10/100
                                            
                                            if comprehensive < minPremStTankBelow10
                                            {
                                                comprehensive = minPremStTankBelow10
                                            }
                                            let comprehensiveVat = comprehensive * vatFromService + comprehensive
                                           
                                            sComPremium = String(format: "%.2f", comprehensive)
                                            sCompPremiumVat = String(format: "%.2f", comprehensiveVat)
                                            self.lblPremuimValueWithoutVat.text = sComPremium
                                            self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat
                                            
//                                            self.lblCompPremium.text = String(format: "%.2f", comprehensive)
//                                            self.lblCompPremiumVat.text = String(format: "%.2f", comprehensiveVat)
                                        }
                                    }
                                    
                                }
                            }
                        }
                        
                    }
                    
                    var compPremiumRatesList = [PremiumRates]()
                    let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" AND vehicleType = \"0\" "
                    compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                    for item in compPremiumRatesList
                    {
                        if item.premiumType == 3
                        {
                            tpo = Double(item.claimFreeRate!)!
                        }
                        else if item.premiumType == 2
                        {
                            tpfMinVal = Double(item.minimumRate!)!
                            tpfPercentage = Double(item.claimFreeRate!)!
                        }
                    }
                    
                    
                    tpfTotalValue = tpo + tpfPercentage/100 * vehicleValue!
                    if tpfTotalValue < tpfMinVal
                    {
                        tpfTotalValue = tpfMinVal
                    }
                    tpfTotalVatValue = tpfTotalValue * vatFromService + tpfTotalValue
                    
                    totalPremium = vehicleValue! * claimValuePercent
                    if totalPremium<minPremium
                    {
                        totalPremium = minPremium
                    }
                    totalVatValue = totalPremium * vatFromService + totalVatValue
                    
                    
//                    self.lblTpftPremium.text = String(format: "%.2f", tpfTotalValue)
//                    self.lblTpftPremiumVat.text = String(format: "%.2f", tpfTotalVatValue)
                    
                    self.sTPFTPremium = String(format: "%.2f", tpfTotalValue)
                    self.sTPFTPremiumVat = String(format: "%.2f", tpfTotalVatValue)
                    
                    
//                    self.lblTpoPremium.text = String(format: "%.2f", tpo)
                    let ttpovatValue = tpo * vatFromService + tpo
//                    self.lblTpoPremiumVat.text = String(format: "%.2f", ttpovatValue)
                    
                    
                    
                    self.sTPOPremium = String(format: "%.2f", tpo)
                    self.sTPOPremiumVat = String(format: "%.2f", ttpovatValue)
                }
                
            }
            else if selectedVClassID == "4"
            {
                //Public Taxis,Private\thire,\tTour\toperators
                if selectedVCatID == "13"{
                    var noClaimValue = 0.0
                    var yesClaimValue = 0.0
                    var minPremiumValue = 0.0
                    var extraCompClaimRate = 0.0
                    
                    
//                    let vehicleValue = Double(txtVehicleValue.text!)
                    let vehicleValue = Double(editedText!)

                    
                    var compPremium = 0.0
                    var compPremiumVat = 0.0
                    var tpo = 0.0
                    var tpoSeatPerValue = 0.0
                    var tpoVat = 0.0
                    var compPremiumRatesList = [PremiumRates]()
                    let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" "
                    compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                    for item in compPremiumRatesList {
                        if item.premiumType == 1 {
                            extraCompClaimRate = Double(item.extraClaimRate!)!
                            minPremiumValue = Double(item.minimumRate!)!
                            noClaimValue = Double(item.claimFreeRate!)!
                            yesClaimValue = Double(item.claimOnRate!)!
                            print("noClaimValue",noClaimValue)
                            print("yesClaimValue",yesClaimValue)
                            print("minPremiumValue",minPremiumValue)
                            print("extraCompClaimRate",extraCompClaimRate)
                            
                            print("NoOf Seats",txtVehicleSeatNo.text as Any)

                            if claimHistory == "0"
                            {
//                                if item.claimFreeRatePercent == 1
//                                {
//                                    compPremium = vehicleValue! * noClaimValue/100
//                                    compPremium = compPremium + (extraCompClaimRate * Double(txtVehicleSeatNo.text!)!)
//                                }
//                                else
//                                {
////                                    compPremium =  noClaimValue + extraCompClaimRate
//                                    compPremium = noClaimValue + (extraCompClaimRate * Double(txtVehicleSeatNo.text!)!)
//
//
//                                }
//                                compPremiumVat = compPremium * vatFromService + compPremium
//                                print("compPremium1",compPremium)
                                
                                
                                if item.claimFreeRatePercent == 1  {
                                    compPremium = vehicleValue! * noClaimValue/100
                                    compPremium = compPremium + extraCompClaimRate
                                }
                                else {
                                    compPremium =  noClaimValue + extraCompClaimRate
                                }
                                compPremiumVat = compPremium * vatFromService + compPremium
                                print("compPremium1",compPremium)
                                
                                
                                
                                
                            }
                            else if claimHistory == "1"
                            {
                                if item.claimOnRatePercent == 1 {
                                    compPremium = vehicleValue! * yesClaimValue/100
                                } else{
                                    compPremium = yesClaimValue
                                }
                                
                                compPremiumVat = compPremium * vatFromService + compPremium
                            }
                            print("compPremium",compPremium)
                            if compPremium < minPremiumValue
                            {
                                compPremium = minPremiumValue
                                compPremiumVat = compPremium * vatFromService + compPremium
                            }
                            print("compPremium",compPremium)
                            comprehensiveFinal = compPremium
                            
                            sComPremium = String(format: "%.2f", compPremium)
                            sCompPremiumVat = String(format: "%.2f", compPremiumVat)
                            self.lblPremuimValueWithoutVat.text = sComPremium
                            self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat
                            
//                            self.lblCompPremium.text = String(format: "%.2f", compPremium)
//                            self.lblCompPremiumVat.text = String(format: "%.2f", compPremiumVat)
                        }
                        else if item.premiumType == 3
                        {
                            var noOfSeat = Double(txtVehicleSeatNo.text!)
                            let tpoMin = Double(item.minimumRate!)!
                            tpoSeatPerValue = Double(item.perSeatExtra!)!
                            
                            if txtVehicleSeatNo.text == ""
                            {
                                noOfSeat = 0.0
                            }
                            
                            if Int(noOfSeat!) <= 0
                            {
                                tpo = noOfSeat! + tpoSeatPerValue
                            }
                            else
                            {
                                tpo = noOfSeat! * tpoSeatPerValue
                            }
                            if tpo < tpoMin
                            {
                                tpo = tpoMin
                            }
                            tpoVat = tpo * vatFromService +  tpo
//                            self.lblTpoPremium.text = String(format: "%.2f", tpo)
//                            self.lblTpoPremiumVat.text = String(format: "%.2f", tpoVat)
                            
                            self.sTPOPremium = String(format: "%.2f", tpo)
                            self.sTPOPremiumVat = String(format: "%.2f", tpoVat)

                        }
                    }
//                    self.lblTpftPremium.text = "0.0"
//                    self.lblTpftPremiumVat.text = "0.0"
                    
                }
                    //buses
                else if selectedVCatID == "14"{
                    var minPremiumValue = 0.0
                    let noOfSeat = Double(txtVehicleSeatNo.text!)
                    var seatPerValue = 0.0
                    let vatValuePercentage = 0.18
                    var tpo = 0.0
                    var tpoValue = 0.0
                    var tpoVatResult = 0.0
                    var compPremium = 0.0
                    var compPremiumVat = 0.0
                    var compPremiumPercentage = 0.0
                    
                    
//                    let vehicleValue = Double(txtVehicleValue.text!)
                    
                    let vehicleValue = Double(editedText!)

                    var compPremiumRatesList = [PremiumRates]()
                    let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" "
                    compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                    for item in compPremiumRatesList
                    {

                        if item.premiumType == 1
                        {
                            print("Minimum Rate for 1 :",item.minimumRate as Any)

                            
                            if item.vehicleType == Int(selectedVTypeID!)
                            {
                                print("Minimum Rate for selcted vehicle type id :",item.minimumRate as Any)
                                
                                compPremiumPercentage = Double(item.claimFreeRate!)!
                                seatPerValue = Double(item.perSeatExtra!)!
                                minPremiumValue = Double(item.minimumRate!)!
                                if Int(noOfSeat!) > 0
                                {
                                    compPremium = vehicleValue! * compPremiumPercentage/100 + seatPerValue * noOfSeat!
                                }
                                else
                                {
                                    compPremium = vehicleValue! * compPremiumPercentage/100
                                }
                                
                                
                                // Changes by Praveen
                                
                                if compPremium < minPremiumValue
                                {
                                    compPremium = minPremiumValue
                                }
                                                
                                
                                compPremiumVat = compPremium * vatValuePercentage + compPremium
                                

                            }
                        }
                        else if item.premiumType == 3
                        {
                            if item.vehicleType == Int(selectedVTypeID!)
                            {
                                tpoValue = Double(item.perSeatExtra!)!
                                minPremiumValue = Double(item.minimumRate!)!
                            }
                        }
                    }
                    tpo = noOfSeat! * tpoValue
                    
                    if tpo < minPremiumValue
                    {
                        tpo = minPremiumValue
                    }
                    tpoVatResult = tpo * vatValuePercentage +  tpo
                  
                    
                    
                    
                    comprehensiveFinal = compPremium
                    
                    
                    sComPremium = String(format: "%.2f", compPremium)
                    sCompPremiumVat = String(format: "%.2f", compPremiumVat)
                    sTPFTPremium = "0"
                    sTPFTPremiumVat = "0"
                    sTPOPremium =  String(format: "%.2f", tpo)
                    sTPOPremiumVat = String(format: "%.2f", tpoVatResult)
                    
                    self.lblPremuimValueWithoutVat.text = sComPremium
                    self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat
                    
//                    self.lblCompPremium.text = String(format: "%.2f", compPremium)
//                    self.lblCompPremiumVat.text = String(format: "%.2f", compPremiumVat)
//                    self.lblTpftPremium.text = "0.0"
//                    self.lblTpftPremiumVat.text = "0.0"
//                    self.lblTpoPremium.text = String(format: "%.2f", tpo)
//                    self.lblTpoPremiumVat.text = String(format: "%.2f", tpoVatResult)
                }
            }
            else if selectedVClassID == "5" {
                //special type of vehicle 5
                if selectedVCatID == "15" {
                    var compPercentage = 0.0
                    var minCompValue = 0.0
                    var tppValue = 0.0
                    let vatPercentage = 0.18
                    
                    
//                    let vehicleValue = Double(txtVehicleValue.text!)
                    
                    let vehicleValue = Double(editedText!)

                    var compPremiumRatesList = [PremiumRates]()
                    let query:String = "SELECT * FROM PremiumRates WHERE VehicleClass =\"" + selectedVClassID! + "\" AND vehicleCategory =\"" + selectedVCatID! + "\" "
                    compPremiumRatesList = DBHandler.shared.fetchPremiumRates(vehicleQuery: query)
                    for item in compPremiumRatesList {
                        if item.premiumType == 1
                        {
                            compPercentage = Double(item.claimFreeRate!)!
                            
                            minCompValue = Double(item.minimumRate!)!
                            
                            var comprehensive = 0.0
                            if item.claimOnRatePercent == 1
                            {
                                comprehensive = vehicleValue! * compPercentage/100
                            }
                            else
                            {
                                comprehensive =  compPercentage
                            }
                            if minCompValue>comprehensive
                            {
                                comprehensive = minCompValue
                            }
                            let comprehensiveVAT = comprehensive * vatPercentage + comprehensive
                            
                            sComPremium = String(format: "%.2f", comprehensive)
                            sCompPremiumVat = String(format: "%.2f", comprehensiveVAT)
                            self.lblPremuimValueWithoutVat.text = sComPremium
                            self.lblPremiumVAlueWith18Vat.text = sCompPremiumVat
                            
//                            self.lblCompPremium.text = String(format: "%.2f", comprehensive)
//                            self.lblCompPremiumVat.text = String(format: "%.2f", comprehensiveVAT)
                            
                        } else if item.premiumType == 3
                        {
                            tppValue = Double(item.claimFreeRate!)!
                            let tppVAT = tppValue * vatPercentage + tppValue
//                            self.lblTpoPremium.text = String(format: "%.2f", tppValue)
//                            self.lblTpoPremiumVat.text = String(format: "%.2f", tppVAT)
                            
                            self.sTPOPremium = String(format: "%.2f", tppValue)
                            self.sTPOPremiumVat = String(format: "%.2f", tppVAT)
                            
                            
                            
                        }
                    }
//                    self.lblTpftPremium.text = "0.0"
//                    self.lblTpftPremiumVat.text = "0.0"
                }
                
            }
            /// self.commutePremium()
            
            sComPremium = self.formatNumber(amountValue: sComPremium)
            sCompPremiumVat = self.formatNumber(amountValue: sCompPremiumVat)
            sTPFTPremium = self.formatNumber(amountValue: sTPFTPremium)
            sTPFTPremiumVat = self.formatNumber(amountValue: sTPFTPremiumVat)
            sTPOPremium = self.formatNumber(amountValue: sTPOPremium)
            sTPOPremiumVat = self.formatNumber(amountValue: sTPOPremiumVat)
            



            let myStringArr = sComPremium.components(separatedBy: ".")
            sComPremium = myStringArr[0] as String
            
            let myStringArr2 = sCompPremiumVat.components(separatedBy: ".")
            sCompPremiumVat = myStringArr2[0] as String
            
            self.lblPremuimValueWithoutVat.text =  "TSH " + sComPremium
                
                

            self.lblPremiumVAlueWith18Vat.text = "TSH " + sCompPremiumVat
            

        }
    }
        let myStringArr = sComPremium.components(separatedBy: ".")
        sComPremium = myStringArr[0] as String
        
        let myStringArr2 = sCompPremiumVat.components(separatedBy: ".")
        sCompPremiumVat = myStringArr2[0] as String
        
        self.lblPremuimValueWithoutVat.text =  "TSH " + sComPremium
        self.lblPremiumVAlueWith18Vat.text = "TSH " + sCompPremiumVat
        
        btnComprehensive.layer.backgroundColor = UIColor.init(r: 6.0, g: 88.0, b: 46.0).cgColor
        btnTPO.layer.backgroundColor = UIColor.init(r: 239.0, g: 239.0, b: 239.0).cgColor
        btnTPFT.layer.backgroundColor = UIColor.init(r: 239.0, g: 239.0, b: 239.0).cgColor

        btnComprehensive.titleLabel?.textColor = UIColor.white
        btnTPO.titleLabel?.textColor = UIColor.darkGray
        btnTPFT.titleLabel?.textColor = UIColor.darkGray
        
    }
    func addDoneButtonOnKeyboard()
    {
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()

            txtVehicleSeatNo.inputAccessoryView = doneToolbar
        }
    
    @objc func doneButtonAction()
    {
        txtVehicleSeatNo.resignFirstResponder()
       }
    @IBAction func btnAddOnAction(_ sender: UIButton)
    {
        // viewAnimate.animHide()
        print(addonsTableLists.count)
        if viewAnimate.isHidden == true
        {
            viewAnimate.isHidden = false
            imgDown.image = UIImage(named: "UpArrow")
            tableAddOn.isHidden = false
            tableAddOn.reloadData()
        }
        else
        {
            viewAnimate.isHidden = true
            imgDown.image = UIImage(named: "DownArrow")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var dataCount:Int = 0
        if tableView == tableVehicle {
            if tableStatus == 0 {
                dataCount = self.vehicleClassLists.count
            }
            else if tableStatus == 1 {
                dataCount = self.vehicleCategoryLists.count
            }
            else if tableStatus == 2 {
                dataCount = self.vehicleTypesLists.count
            }
            else if tableStatus == 3 {
                dataCount = self.weightRangeLists.count
            }
        }
        else if tableView == tableAddOn
        {
            dataCount = self.addonsTableLists.count - 1
            print("addon count ",dataCount)
        }
        return dataCount
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if tableView == tableVehicle {
            let cellNotify = tableVehicle.dequeueReusableCell(withIdentifier: "DropDownTCell", for: indexPath) as! DropDownTCell
            cellNotify.lblContent.font = UIFont .boldSystemFont(ofSize: 16.0)
            if tableStatus == 0 {
                cellNotify.lblContent.text = self.vehicleClassLists[indexPath.row].className
            }
            else if tableStatus == 1 {
                //print("vehicleCatList ----> ",vehicleCatList[indexPath.row].categoryName)
                cellNotify.lblContent.text = self.vehicleCategoryLists[indexPath.row].categoryName
            }
            else if tableStatus == 2 {
                // cellNotify.lblContent.text = vehicleClassList[indexPath.row].className
                cellNotify.lblContent.text = self.vehicleTypesLists[indexPath.row].typeName
            }
            else if tableStatus == 3 {
                cellNotify.lblContent.text = self.weightRangeLists[indexPath.row].rangeName
            }
            cell = cellNotify
        }
        else if tableView == tableAddOn
        {
            
          
          
            print("cellAddOn.lblAddOn.text =")
            let cellAddOn = tableAddOn.dequeueReusableCell(withIdentifier: "TableAddOnCell", for: indexPath) as! TableAddOnCell
           
            cellAddOn.lblAddOn.text = self.addonsTableLists[indexPath.row].addonName//addonName
                cellAddOn.checkCommon.tag = indexPath.row
            print("indexpAth =",indexPath.row)

                cellAddOn.checkBox.style = .tick
                cellAddOn.checkBox.borderStyle = .square
                cellAddOn.checkCommon.addTarget(self, action: #selector(geoLimitValueChange(_:)), for: .valueChanged)
            
            cell = cellAddOn
            
            
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("Selected index path ----> ",indexPath.row)

//        self.viewContent.frame = CGRect(x: 20, y: 10, width: self.viewContent.frame.width, height:100)
        

        if tableView == tableVehicle
        {
            if tableStatus == 0
            {
                 self.setToZero()
                
                let idData:Int = self.vehicleClassLists[indexPath.row].id!
                selectedVClassID = String(idData)
                txtVehicle.text = self.vehicleClassLists[indexPath.row].className
                self.vehicleCategoryLists.removeAll()
                self.vehicleCategoryLists = DBHandler.shared.fetchVehicleCat(vehicleClassId: selectedVClassID!)
                if idData == 2
                {
                    viewTypeHeight.constant = 0.0
                    self.viewConditions.isHidden = false
                    self.viewPassCarrying.isHidden = false
                    self.viewAbove.isHidden = true
                    self.viewWeight.isHidden = true
                    self.viewSeat.isHidden = true
                    self.viewPassengerTop.priority = UILayoutPriority(rawValue: 999)//hid
                    self.txtCategory.text = ""
                    
                }
                else if idData == 4
                {
                    viewTypeHeight.constant = 0.0
                    
                    self.viewConditions.isHidden = false
                    self.viewPassCarrying.isHidden = true
                    self.viewAbove.isHidden = true
                    self.viewWeight.isHidden = true
                    self.viewSeat.isHidden = false
                    self.viewSeatTop.priority = UILayoutPriority(rawValue: 999)//Unhide
                    self.txtCategory.text = ""
                }
                else
                {
                    viewTypeHeight.constant = 0.0
                    self.txtCategory.text = ""
                }
            }
            else if tableStatus == 1
            {
                self.setToZero()
                
                self.viewTypeHeight.constant = 0.0
                self.txtType.text = ""
                let idData:Int = self.vehicleCategoryLists[indexPath.row].id!
                selectedVCatID = String(idData)
                txtCategory.text = self.vehicleCategoryLists [indexPath.row].categoryName
                self.vehicleTypesLists.removeAll()
                self.vehicleTypesLists = DBHandler.shared.fetchVehicleType(vehicleCatId: selectedVCatID!)
                
                if selectedVClassID == "3"
                {
                    if idData == 12 || idData == 11
                    {
                        
                        self.viewConditions.isHidden = false
                        self.viewPassCarrying.isHidden = true
                        self.viewAbove.isHidden = false
                        self.viewWeight.isHidden = true
                        self.viewSeat.isHidden = true
                        self.viewAboveTen.priority = UILayoutPriority(rawValue: 999)//unhide
                        
                    }
                    
                    
                    if idData == 10
                    {
                        print("qwerty")
                        self.viewConditions.isHidden = false
                        self.viewPassCarrying.isHidden = true
                        self.viewAbove.isHidden = true
                        self.viewWeight.isHidden = false
                        self.viewSeat.isHidden = true
                        
                        self.viewWeightTop.priority = UILayoutPriority(rawValue: 999)//hide
                        
                    }
                    if idData == 10 || idData == 12
                    {
                        viewTypeHeight.constant = 45
                        
                    }
                }
                /*
                 if selectedVClassID == "3"{
                 if idData == 10 {
                 print("qwerty")
                 self.viewConditions.isHidden = false
                 self.viewPassCarrying.isHidden = true
                 self.viewAbove.isHidden = true
                 self.viewWeight.isHidden = false
                 self.viewSeat.isHidden = true
                 
                 self.viewWeightTop.priority = UILayoutPriority(rawValue: 999)//hide
                 
                 }
                 }
                 
                 if selectedVClassID == "3"    {
                 if idData == 10 || idData == 12
                 {
                 viewTypeHeight.constant = 45
                 
                 }
                 
                 }
                 */
                if selectedVClassID == "4"
                {
                    if selectedVCatID == "14"
                    {
                        viewTypeHeight.constant = 45
//                        viewSeat.isHidden = false
                        
                    }
                    else
                    {
                        viewTypeHeight.constant = 0.0
//                        viewSeat.isHidden = true

                    }
                }
                
                
            }
            else if tableStatus == 2
            {
                 self.setToZero()
                
                let idData:Int = self.vehicleTypesLists[indexPath.row].id!
                selectedVTypeID = String(idData)
                txtType.text = self.vehicleTypesLists[indexPath.row].typeName
                
                
            }
            else if tableStatus == 3
            {
                 self.setToZero()
                
                let idData:Int = self.weightRangeLists[indexPath.row].id!
                selectedVWeightRangeID = String(idData)
                txtWeightRange.text = self.weightRangeLists[indexPath.row].rangeName
            }
            viewPopupBG.isHidden = true
            tableVehicle.isHidden = true
            viewTable.isHidden = true
        }
        else if tableView == tableAddOn
        {
            
            
        }
        
        
        
    }
    
    
    func getVehicleClass() {
        
        self.view.activityStartAnimating()
        
        let loginURL = Constants.baseURL+Constants.vehicleClassURL
        
        print("loginURL",loginURL)
        
        AF.request(loginURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (data) in
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
                    self.vehicleClassModel = VehicleClassModel(response)
                    let statusCode = Int((self.vehicleClassModel?.httpcode)!)
                    if statusCode == 200{
                        self.tableStatus = 0
                        self.vehicleClassList.removeAll()
                        self.vehicleClassList = (self.vehicleClassModel?.vehicleClassData?.vehicleClass)!
                        print("vehicleClassList.",self.vehicleClassList)
                        
                        self.view.activityStopAnimating()
                        if self.vehicleClassList.count>0 {
                            self.tableVehicle.reloadData()
                            self.viewTable.isHidden = false
                            self.viewPopupBG.isHidden = false
                            self.tableVehicle.isHidden = false
                            self.tableVehicle.tableFooterView = UIView()
                        }
                        else {
                            self.showToast(message: "No Records Found")
                        }
                        
                    }
                    if statusCode == 400{
                        self.view.activityStopAnimating()
                        self.showToast(message: (self.vehicleClassModel?.message)!)
                    }
                    
                }
                catch let err {
                    print("Error::",err.localizedDescription)
                }
            }
        }
    }
    func getVehicleCategory() {
        if selectedVClassID!.count>0 {
            self.view.activityStartAnimating()
            
            let loginURL = Constants.baseURL+Constants.vehicleCatURL
            var postDict = Dictionary<String,String>()
            postDict = [
                "vehicle_class":selectedVClassID!
            ]
            
            print("PostData: ",postDict)
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
                        self.vehicleCatModel = VehicleCatModel(response)
                        let statusCode = Int((self.vehicleCatModel?.httpcode)!)
                        if statusCode == 200{
                            self.tableStatus = 1
                            self.vehicleCatList.removeAll()
                            self.vehicleCatList = (self.vehicleCatModel?.vehicleCatData?.vehicleCategories)!
                            //print("vehicleClassList.",self.vehicleCatList[0].categoryName)
                            
                            self.view.activityStopAnimating()
                            
                            
                            if self.vehicleCatList.count>0 {
                                self.tableVehicle.reloadData()
                                self.viewTable.isHidden = false
                                self.viewPopupBG.isHidden = false
                                self.tableVehicle.isHidden = false
                                self.tableVehicle.tableFooterView = UIView()
                            }
                            else {
                                self.showToast(message: "No Records Found")
                            }
                        }
                        if statusCode == 400{
                            self.view.activityStopAnimating()
                            self.showToast(message: (self.vehicleCatModel?.message)!)
                        }
                        
                    }
                    catch let err {
                        print("Error::",err.localizedDescription)
                    }
                }
            }
        }
        else {
            self.showToast(message: "Select vehicle class")
        }
        
    }
    func getVehicleType() {
        if selectedVCatID!.count>0 {
            self.view.activityStartAnimating()
            
            let loginURL = Constants.baseURL+Constants.vehicleTypesURL
            var postDict = Dictionary<String,String>()
            postDict = [
                "vehicle_category":selectedVCatID!
            ]
            
            print("loginURL",loginURL)
            print("postDict",postDict)
            
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
                        self.vehicleTypesModel = VehicleTypesModel(response)
                        let statusCode = Int((self.vehicleTypesModel?.httpcode)!)
                        if statusCode == 200{
                            self.tableStatus = 2
                            self.vehicleTypeList.removeAll()
                            self.vehicleTypeList = (self.vehicleTypesModel?.vehicleTypeData?.vehicleType)!
                            print("vehicleTypeList.",self.vehicleTypeList)
                            
                            self.view.activityStopAnimating()
                            
                            if self.vehicleTypeList.count>0 {
                                self.tableVehicle.reloadData()
                                self.viewTable.isHidden = false
                                self.viewPopupBG.isHidden = false
                                self.tableVehicle.isHidden = false
                                self.tableVehicle.tableFooterView = UIView()
                            }
                            else {
                                self.showToast(message: "No Records Found")
                            }
                        }
                        if statusCode == 400{
                            self.view.activityStopAnimating()
                            self.showToast(message: (self.vehicleClassModel?.message)!)
                        }
                        
                    }
                    catch let err {
                        print("Error::",err.localizedDescription)
                    }
                }
            }
        }
        else {
            self.showToast(message: "Select vehicle category")
        }
        
    }
    func getWeightRange() {
        
        self.view.activityStartAnimating()
        
        let loginURL = Constants.baseURL+Constants.weightRangeURL
        
        AF.request(loginURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (data) in
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
                    self.weightRangeModel = WeightRangeModel(response)
                    let statusCode = Int((self.weightRangeModel?.httpcode)!)
                    if statusCode == 200{
                        self.tableStatus = 3
                        self.vehicleWeightRangeList.removeAll()
                        self.vehicleWeightRangeList = (self.weightRangeModel?.weightRangeData?.weightRange)!
                        print("vehicleTypeList.",self.vehicleTypeList)
                        
                        self.view.activityStopAnimating()
                        
                        if self.vehicleWeightRangeList.count>0 {
                            self.tableVehicle.reloadData()
                            self.viewTable.isHidden = false
                            self.viewPopupBG.isHidden = false
                            self.tableVehicle.isHidden = false
                            self.tableVehicle.tableFooterView = UIView()
                        }
                        else {
                            self.showToast(message: "No Records Found")
                        }
                    }
                    if statusCode == 400{
                        self.view.activityStopAnimating()
                        self.showToast(message: (self.weightRangeModel?.message)!)
                    }
                    
                }
                catch let err {
                    print("Error::",err.localizedDescription)
                }
            }
        }
        
        
        
    }
    
    func commutePremium() {
        
        
        
        
        self.view.activityStartAnimating()
        let loginURL = Constants.baseURL+Constants.computePremiumURL
        var vehicle_type = selectedVCatID
        if vehicle_type!.count<=0 {
            vehicle_type = "0"
        }
        var weight_range = selectedVWeightRangeID
        if weight_range!.count<=0 {
            weight_range = "0"
        }
        var no_seats = txtVehicleSeatNo.text
        if no_seats!.count<=0 {
            no_seats = "0"
        }
        
        var postDict = Dictionary<String,String>()
        postDict = [
            "access_token":sharedData.getAccessToken(),
            "vehicle_class":selectedVClassID! as String,
            "vehicle_category":selectedVCatID! as String,
            "vehicle_type":vehicle_type! as String,
            "claim_history":claimHistory! as String ,
            "vehicle_value":txtVehicleValue.text! as String,
            "passenger_carrying":passengerCarry! as String,
            "above_year_range":aboveTen! as String,
            "weight_range":weight_range! as String,
            "no_seats":txtVehicleSeatNo.text! as String
            
        ]
        
        print("loginURL",loginURL)
        print("postDict",postDict)
        
        AF.request(loginURL, method: .post, parameters: postDict, encoding: URLEncoding.default, headers: nil).responseJSON { [self] (data) in
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
                    self.premiumComputeModel = PremiumComputeModel(response)
                    let statusCode = Int((self.premiumComputeModel?.httpcode)!)
                    if statusCode == 200{
//                        self.lblCompPremium.text = self.premiumComputeModel?.premiumCompData?.premiumComputeValue?.Comprehensive!
                        
                        self.sComPremium = (self.premiumComputeModel?.premiumCompData?.premiumComputeValue?.Comprehensive)!
                        
                        let pv = self.premiumComputeModel?.premiumCompData?.premiumComputeValue?.Comprehensive!
                        let tpft = self.premiumComputeModel?.premiumCompData?.premiumComputeValue?.TPFT!
                        let tpo = self.premiumComputeModel?.premiumCompData?.premiumComputeValue?.TPO!
                        //Int(pv)*18/100
                        
                        var tpftVatValue = Double(tpft!)! * self.percentage
                        tpftVatValue = tpftVatValue +  Double(tpft!)!
                        print("tpftVatValue ----- ",tpftVatValue)
                        var tpoVatValue = Double(tpo!)! * self.percentage
                        tpoVatValue = tpoVatValue +  Double(tpo!)!
                        print("tpoVatValue ----- ",tpoVatValue)
                        var compVatValue = Double(pv!)! * self.percentage
                        
                        compVatValue = compVatValue +  Double(pv!)!
                        
                        print("myInt1 ----- ",compVatValue)
//
//                        self.lblCompPremiumVat.text = String(compVatValue)
                        
                        self.sComPremium = sComPremium.replacingOccurrences(of: ".00", with: "")
                        self.sCompPremiumVat = sCompPremiumVat.replacingOccurrences(of: ".00", with: "")


                        self.lblPremuimValueWithoutVat.text = "TSH " + self.sComPremium
                        self.lblPremiumVAlueWith18Vat.text = "TSH " + self.sCompPremiumVat
                        
//
//                        self.lblTpftPremium.text = self.premiumComputeModel?.premiumCompData?.premiumComputeValue?.TPFT!
//                        self.lblTpftPremiumVat.text = String(tpftVatValue)
                        
                        self.sTPFTPremium = (self.premiumComputeModel?.premiumCompData?.premiumComputeValue?.TPFT!)!
                        self.sTPFTPremiumVat = String(tpftVatValue)
                        
                        
//
//                        self.lblTpoPremium.text = self.premiumComputeModel?.premiumCompData?.premiumComputeValue?.TPO!
//                        self.lblTpoPremiumVat.text = String(tpoVatValue)
                        
                        self.sTPOPremium = (self.premiumComputeModel?.premiumCompData?.premiumComputeValue?.TPO!)!
                        self.sTPOPremiumVat = String(tpoVatValue)

                        
                        
                        self.addOnList = (self.premiumComputeModel?.premiumCompData?.addons!)!
                        
                        print(" self.addOnList ", self.addOnList)
                        self.tableAddOn.reloadData()
                        self.view.activityStopAnimating()
                    }
                    if statusCode == 400{
                        self.view.activityStopAnimating()
                        self.showToast(message: (self.premiumComputeModel?.message)!)
                    }
                    
                }
                catch let err {
                    print("Error::",err.localizedDescription)
                }
            }
        }
        
        
        
    }
    func setToZero()
    {
        self.sComPremium = "TSH 0"
        self.sCompPremiumVat = "TSH 0"
        self.sTPFTPremium = "TSH 0"
        self.sTPFTPremiumVat = "TSH 0"
        self.sTPOPremium = "TSH 0"
        self.sTPOPremiumVat = "TSH 0"
        self.lblPremuimValueWithoutVat.text = self.sComPremium
        self.lblPremiumVAlueWith18Vat.text = self.sCompPremiumVat
        
        

        
        
    }
    @objc @IBAction private func logSelectedButton(radioButton : DLRadioButton)
    {
//        txtVehicleSeatNo.text = ""
        
        
        if (radioButton.isMultipleSelectionEnabled)
        {

            print(String(format: "is selected1.\n"));
            if radioButton == radioYes {
                claimHistory = "1"
                for button in radioButton.selectedButtons()
                {
                    print(String(format: "%@ is selected1.\n", button.titleLabel!.text!));
                }
                self.setToZero()
            }
            else if radioButton == radioNo
            {
                claimHistory = "0"
                for button in radioButton.selectedButtons()
                {
                    print(String(format: "%@ is selected1.\n", button.titleLabel!.text!));
                }
                 self.setToZero()
            }
            
            else
            {
                for button in radioButton.selectedButtons() {
                    print(String(format: "%@ is selected1.\n", button.titleLabel!.text!));
                }
            }
            
            
        }
        else
        {
            

            print(String(format: "%@ is selected2.\n", radioButton.selected()!.titleLabel!.text!));
            if radioButton == radioYes
            {
                txtVehicleValue.text = ""

                claimHistory = "1"
                
//                if selectedVCatID == "13" && selectedVClassID == "4"
//                {
//                    self.viewSeat.isHidden = false
//                }
//                else if selectedVCatID == "14" && selectedVClassID == "4"
//                {
//                    self.viewSeat.isHidden = false
//
//                }
                 
                 self.setToZero()
            }
            else if radioButton == radioNo
            {
                txtVehicleValue.text = ""

//                if selectedVCatID == "13" && selectedVClassID == "4"
//                {
//                    self.viewSeat.isHidden = true
//                }
//                else if selectedVCatID == "14" && selectedVClassID == "4"
//                {
//                    self.viewSeat.isHidden = false
//
//                }
                claimHistory = "0"
                 self.setToZero()
            }
            else if radioButton == radioPassCarryYes
            {
                passengerCarry = "1"
                 self.setToZero()
            }
            else if radioButton == radioPassCarryNo
            {
                passengerCarry = "0"
                 self.setToZero()
            }
            else if radioButton == radioTenYes
            {
                aboveTen = "2"
                 self.setToZero()
            }
            else if radioButton == radioTenNo
            {
                aboveTen = "1"
                 self.setToZero()
            }
            
            
        }
    }
    func convertCurrencyToDouble(input: String) -> Double?
    {
         let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .currency
//         numberFormatter.locale = Locale.current
         return numberFormatter.number(from: input)?.doubleValue
    }
    @objc func geoLimitValueChange(_ sender: CheckBox) {
        print("sender.tag",sender.tag)
        //print("self.addonsList[sender.tag].id",self.addonsTableLists[sender.tag].id)
        print(sender.isChecked)
        
        var trimmed = self.sComPremium.trimmingCharacters(in: .whitespacesAndNewlines)

        
//        var trimmed = self.lblCompPremium.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        trimmed = trimmed.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range: nil)

//        print("sender.tag",self.convertCurrencyToDouble(input: self.lblCompPremium.text!)!)
        let tempValue = self.convertCurrencyToDouble(input: trimmed)!
        var calculateValue = 0.0
        var calculateVat = 0.0
        
        if txtVehicleValue.text!.count>0 {
            if self.addonsTableLists.count>0 {
                if sender.isChecked == true {
                    if self.addonsTableLists[sender.tag].id ==  1   {
                     
                        let percentage = Double(self.addonsTableLists[sender.tag].addonValue!)
                        comprehensiveGeoLimit = tempValue
                        if self.addonsTableLists[sender.tag].valueType! == "1" {
                            calculateValue = percentage!/100 * tempValue + tempValue
                        }
                        else
                        {
                            calculateValue = percentage!
                        }
                        
                        comprehensiveUpdateFinal = calculateValue
                        calculateVat = calculateValue * 0.18 + calculateValue
                          
                        sComPremium = String(format: "%.2f", calculateValue)
                        sCompPremiumVat = String(format: "%.2f", calculateVat)
                        
//                        lblCompPremium.text = String(format: "%.2f", calculateValue)
//                        lblCompPremiumVat.text = String(format: "%.2f", calculateVat)
                        
                        let myStringArr = sComPremium.components(separatedBy: ".")
                        sComPremium = myStringArr[0] as String
                        
                        let myStringArr2 = sCompPremiumVat.components(separatedBy: ".")
                        sCompPremiumVat = myStringArr2[0] as String
                        
                        
                        self.lblPremuimValueWithoutVat.text = "TSH " + self.sComPremium
                        self.lblPremiumVAlueWith18Vat.text = "TSH " + self.sCompPremiumVat
                    }
                    else if self.addonsTableLists[sender.tag].id == 2  {
                        
                        
                        let percentage = Double(self.addonsTableLists[sender.tag].addonValue!)
                        comprehensiveGeoLimit = tempValue
                        if self.addonsTableLists[sender.tag].valueType! == "1" {
                            calculateValue = percentage!/100 * tempValue + tempValue
                        }
                        else
                        {
                            calculateValue = percentage!
                        }
                        
                        comprehensiveUpdateFinal = calculateValue
                        
                        calculateVat = calculateValue * 0.18 + calculateValue
                        
                        
                        sComPremium = String(format: "%.2f", calculateValue)
                        sCompPremiumVat = String(format: "%.2f", calculateVat)
                        
                        let myStringArr = sComPremium.components(separatedBy: ".")
                        sComPremium = myStringArr[0] as String
                        
                        let myStringArr2 = sCompPremiumVat.components(separatedBy: ".")
                        sCompPremiumVat = myStringArr2[0] as String
                        
                        
                        self.lblPremuimValueWithoutVat.text = "TSH " +  self.sComPremium
                        self.lblPremiumVAlueWith18Vat.text = "TSH " + self.sCompPremiumVat
//                        lblCompPremium.text = String(format: "%.2f", calculateValue)
//                        lblCompPremiumVat.text = String(format: "%.2f", calculateVat)
                        
                    }
                    else if self.addonsTableLists[sender.tag].id == 3 {
                        
                        let percentage = Double(self.addonsTableLists[sender.tag].addonValue!)
                        comprehensiveGeoLimit = tempValue
                        if self.addonsTableLists[sender.tag].valueType! == "1" {
                            calculateValue = percentage!/100 * tempValue + tempValue
                        }
                        else
                        {
                            calculateValue = percentage!
                        }
                        
                        comprehensiveUpdateFinal = calculateValue
                        
                        calculateVat = calculateValue * 0.18 + calculateValue
                        
                        sComPremium = String(format: "%.2f", calculateValue)
                        sCompPremiumVat = String(format: "%.2f", calculateVat)
                        
                        let myStringArr = sComPremium.components(separatedBy: ".")
                        sComPremium = myStringArr[0] as String
                        
                        let myStringArr2 = sCompPremiumVat.components(separatedBy: ".")
                        sCompPremiumVat = myStringArr2[0] as String
                        
                        
                        self.lblPremuimValueWithoutVat.text = "TSH " + self.sComPremium
                        self.lblPremiumVAlueWith18Vat.text = "TSH " + self.sCompPremiumVat
//                        lblCompPremium.text = String(format: "%.2f", calculateValue)
//                        lblCompPremiumVat.text = String(format: "%.2f", calculateVat)
                        
                        print("calculateValue",calculateValue)
                        print("calculateVat",calculateVat)
                        
                    }
                }
                else {
                    
                    if self.addonsTableLists[sender.tag].id == 1 {

                        let percentage = Double(self.addonsTableLists[sender.tag].addonValue!)
                        
                        
                        let addonValue = Double(self.addonsTableLists[sender.tag].addonValue!)
                        let totalAddonValue = addonValue! + 100
                        if self.addonsTableLists[sender.tag].valueType! == "1" {
                            calculateValue =  (tempValue * 100 )/Double(totalAddonValue)
                            //calculateValue = calculateValue - comprehensiveBuyBack
                        }
                        else
                        {
                            calculateValue = percentage!
                        }
                        
                        //let premiumValue = Double(tempValue)! - Double(calculateValue)
                        
                        calculateVat = calculateValue * 0.18 + calculateValue
                        
//                        lblCompPremium.text = String(format: "%.2f", calculateValue)
//                        lblCompPremiumVat.text = String(format: "%.2f", calculateVat)
                        
                        sComPremium = String(format: "%.2f", calculateValue)
                        sCompPremiumVat = String(format: "%.2f", calculateVat)
                        
                        let myStringArr = sComPremium.components(separatedBy: ".")
                        sComPremium = myStringArr[0] as String
                        
                        let myStringArr2 = sCompPremiumVat.components(separatedBy: ".")
                        sCompPremiumVat = myStringArr2[0] as String
                        
                        self.lblPremuimValueWithoutVat.text = "TSH " + self.sComPremium
                        self.lblPremiumVAlueWith18Vat.text = "TSH " + self.sCompPremiumVat
                    }
                    else  if self.addonsTableLists[sender.tag].id == 2 {
                      
                        let percentage = Double(self.addonsTableLists[sender.tag].addonValue!)
 
                        let addonValue = Double(self.addonsTableLists[sender.tag].addonValue!)
                        let totalAddonValue = addonValue! + 100
                        if self.addonsTableLists[sender.tag].valueType! == "1" {
                            calculateValue =  (tempValue * 100 )/Double(totalAddonValue)
                            //calculateValue = calculateValue - comprehensiveBuyBack
                        }
                        else
                        {
                            calculateValue = percentage!
                        }
                        
                        //let premiumValue = Double(tempValue)! - Double(calculateValue)
                        
                        calculateVat = calculateValue * 0.18 + calculateValue
//                        lblCompPremium.text = String(format: "%.2f", calculateValue)
//                        lblCompPremiumVat.text = String(format: "%.2f", calculateVat)
//
                        sComPremium = String(format: "%.2f", calculateValue)
                        sCompPremiumVat = String(format: "%.2f", calculateVat)
                        
                        self.lblPremuimValueWithoutVat.text = "TSH " +  self.sComPremium
                        self.lblPremiumVAlueWith18Vat.text = "TSH " +  self.sCompPremiumVat
                        
                    }
                    else if self.addonsTableLists[sender.tag].id == 3 {

                        let percentage = Double(self.addonsTableLists[sender.tag].addonValue!)
                        let addonValue = Double(self.addonsTableLists[sender.tag].addonValue!)
                        let totalAddonValue = addonValue! + 100
                        if self.addonsTableLists[sender.tag].valueType! == "1" {
                            calculateValue =  (tempValue * 100 )/Double(totalAddonValue)
                            //calculateValue = calculateValue - comprehensiveBuyBack
                        }
                        else
                        {
                            calculateValue = percentage!
                        }
                        
                        //let premiumValue = Double(tempValue)! - Double(calculateValue)
                        
                        calculateVat = calculateValue * 0.18 + calculateValue
                        
//                        lblCompPremium.text = String(format: "%.2f", calculateValue)
//                        lblCompPremiumVat.text = String(format: "%.2f", calculateVat)
                        
                        sComPremium = String(format: "%.2f", calculateValue)
                        sCompPremiumVat = String(format: "%.2f", calculateVat)
                        
                        let myStringArr = sComPremium.components(separatedBy: ".")
                        sComPremium = myStringArr[0] as String
                        
                        let myStringArr2 = sCompPremiumVat.components(separatedBy: ".")
                        sCompPremiumVat = myStringArr2[0] as String

                        self.lblPremuimValueWithoutVat.text = "TSH " + self.sComPremium
                        self.lblPremiumVAlueWith18Vat.text = "TSH " + self.sCompPremiumVat
                    
                    }
                    
                    
                }
            }
            
            let indexPath = IndexPath(row: sender.tag, section: 0)
            let cell:TableAddOnCell = tableAddOn.cellForRow(at: indexPath) as! TableAddOnCell
            
            if sender.isChecked {
                //sender.isChecked = true
                cell.checkBox.isChecked = true
            }
            else
            {
                //sender.isChecked = false
                cell.checkBox.isChecked = false
            }
//            self.lblCompPremium.text = self.formatNumber(amountValue: String(calculateValue))
//            self.lblCompPremiumVat.text = self.formatNumber(amountValue: String(calculateVat))
            
            
            sComPremium = self.formatNumber(amountValue: String(calculateValue))
            sCompPremiumVat = self.formatNumber(amountValue: String(calculateVat))
            
            
            let myStringArr = sComPremium.components(separatedBy: ".")
            sComPremium = myStringArr[0] as String
            
            let myStringArr2 = sCompPremiumVat.components(separatedBy: ".")
            sCompPremiumVat = myStringArr2[0] as String
            
            
            self.lblPremuimValueWithoutVat.text = "TSH " + self.sComPremium
            self.lblPremiumVAlueWith18Vat.text = "TSH " +  self.sCompPremiumVat
            
            btnComprehensive.layer.backgroundColor = UIColor.init(r: 6.0, g: 88.0, b: 46.0).cgColor
            btnTPO.layer.backgroundColor = UIColor.init(r: 239.0, g: 239.0, b: 239.0).cgColor
            btnTPFT.layer.backgroundColor = UIColor.init(r: 239.0, g: 239.0, b: 239.0).cgColor

            btnComprehensive.titleLabel?.textColor = UIColor.white
            btnTPO.titleLabel?.textColor = UIColor.darkGray
            btnTPFT.titleLabel?.textColor = UIColor.darkGray
            
            
            
            
            
        }
        else
        {
            self.showToast(message: "Compute premium first")
        }
        
        
    }
    @IBAction func btnLogoutAction(_ sender: UIButton) {
        if Reachability.isConnectedToNetwork() {
            let alert = UIAlertController(title: Constants.appName, message: Constants.logoutMSG, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { _ in
                //Yes Action
                self.getLogout()
            }))
            alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { _ in
                //Cancel Action
                print("NO")
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            self.showToast(message: Constants.connectivityErrorMsg)
        }
        
        
    }
    
    func getLogout() {
        
        self.view.activityStartAnimating()
        
        let loginURL = Constants.baseURL+Constants.signOutURL
        
        var postDict = Dictionary<String,String>()
        postDict = [
            "access_token":sharedData.getAccessToken()
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
                    self.logoutModel = LogoutModel(response)
                    let statusCode = Int((self.logoutModel?.httpcode)!)
                    if statusCode == 200{
                        self.view.activityStopAnimating()
                        self.sharedData.setLoginStatus(loginStatus: false)
                        self.sharedData.clearAccessToken()
                       
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        let navigationController = UINavigationController(rootViewController: yourVC)
                        
                        appDelegate.window?.rootViewController = navigationController
                        appDelegate.window?.makeKeyAndVisible()
                        
                        
                        self.navigationController?.popToRootViewController(animated: true)
                        
                    }
                    if statusCode == 400{
                        self.view.activityStopAnimating()
                        self.sharedData.setLoginStatus(loginStatus: false)
                        self.sharedData.clearAccessToken()
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        let navigationController = UINavigationController(rootViewController: yourVC)
                        
                        appDelegate.window?.rootViewController = navigationController
                        appDelegate.window?.makeKeyAndVisible()
                        
                        
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                    
                }
                catch let err {
                    print("Error::",err.localizedDescription)
                }
            }
        }
        
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    func ConvertCurrencyFormat(sNumber: NSNumber) -> String
    {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        // We'll force unwrap with the !, if you've got defined data you may need more error checking
        let priceString = currencyFormatter.string(from: sNumber)!
        print(priceString) // Displays $9,999.99 in the US locale
        return priceString
    }
    
    
    
}
extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
