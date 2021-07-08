//
//  ExtensionClass.swift
//  DRS Merchant
//
//  Created by Softnotions Technologies Pvt Ltd on 5/4/20.
//  Copyright © 2020 Softnotions Technologies Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit
enum LINE_POSITION {
    case LINE_POSITION_TOP
    case LINE_POSITION_BOTTOM
}

extension UITableView {
    func scrollToBottom(animated: Bool) {
        let y = contentSize.height - frame.size.height
        if y < 0 { return }
        setContentOffset(CGPoint(x: 0, y: y), animated: animated)
    }
    
}
extension OperatingSystemVersion {
    func getFullVersion(separator: String = ".") -> String {
        return "\(majorVersion)\(separator)\(minorVersion)\(separator)\(patchVersion)"
    }
}


extension UIDevice {
    var iPhoneX: Bool { UIScreen.main.nativeBounds.height == 2436 }
    var iPhone: Bool { UIDevice.current.userInterfaceIdiom == .phone }
    var iPad: Bool { UIDevice().userInterfaceIdiom == .pad }
    enum ScreenType: String {
        case iPhones_4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhones_X_XS = "iPhone X or iPhone XS"
        case iPhone_XR_11 = "iPhone XR or iPhone 11"
        case iPhone_XSMax_ProMax = "iPhone XS Max or iPhone Pro Max"
        case iPhone_11Pro = "iPhone 11 Pro"
        case unknown
    }
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1792:
            return .iPhone_XR_11
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2426:
            return .iPhone_11Pro
        case 2436:
            return .iPhones_X_XS
        case 2688:
            return .iPhone_XSMax_ProMax
        default:
            return .unknown
        }
    }
    static var isSimulator: Bool = {
           #if targetEnvironment(simulator)
           return true
           #else
           return false
           #endif
       }()
}

extension UIImageView {
    
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    func makeRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
   
       func load(url: URL) {
              DispatchQueue.global().async { [weak self] in
                  if let data = try? Data(contentsOf: url) {
                      if let image = UIImage(data: data) {
                          DispatchQueue.main.async {
                              self?.image = image
                          }
                      }
                  }
              }
          }
}

extension UIView {
    
   
  
    
    func addBottomRoundedEdge(desiredCurve: CGFloat?) {
            let offset: CGFloat = self.frame.width / desiredCurve!
            let bounds: CGRect = self.bounds
            
            let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
            let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
            let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
            let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
            rectPath.append(ovalPath)
            
            // Create the shape layer and set its path
            let maskLayer: CAShapeLayer = CAShapeLayer()
            maskLayer.frame = bounds
            maskLayer.path = rectPath.cgPath
            
            // Set the newly created shape layer as the mask for the view's layer
            self.layer.mask = maskLayer
        }
    
    
    
    
    
    
    func addTopRoundedCornerToView(targetView:UIView?, desiredCurve:CGFloat?)
    {
        let offset:CGFloat =  targetView!.frame.width/desiredCurve!
        let bounds: CGRect = targetView!.bounds

        //Top side curve
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y+bounds.size.height / 2, width: bounds.size.width, height: bounds.size.height / 2)

        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)

        //Top side curve
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)

        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        // Set the newly created shape layer as the mask for the view's layer
        targetView!.layer.mask = maskLayer
    }
        

     

           
    func animShow(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    func animHide(){
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()

        },  completion: {(_ completed: Bool) -> Void in
        self.isHidden = true
            })
    }
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
    
        layer.mask = mask
    }
    func addLine(position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)

        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))

        switch position {
        case .LINE_POSITION_TOP:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .LINE_POSITION_BOTTOM:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
        
    func activityStartAnimating(){
          let backgroundView = UIView()
          backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
          //backgroundView.alpha = 0.1
          backgroundView.backgroundColor = UIColor.clear
          backgroundView.tag = 475647
          self.addSubview(backgroundView)
          
          let containerView = UIView()
          containerView.frame = CGRect.init(x: 0, y: 0, width: 175, height: 160)
          containerView.center = CGPoint(x:backgroundView.bounds.width/2,y:backgroundView.bounds.height/2)
          containerView.layer.cornerRadius = 10
          containerView.backgroundColor = UIColor.black
          containerView.alpha = 0.5
          backgroundView.addSubview(containerView)
          
          var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
          activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
          activityIndicator.center = CGPoint(x:containerView.bounds.width/2,y:containerView.bounds.height/2)
          activityIndicator.hidesWhenStopped = true
          activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
          activityIndicator.startAnimating()
          self.isUserInteractionEnabled = false
          containerView.addSubview(activityIndicator)
          
          let lblLoading = UILabel()
          lblLoading.frame = CGRect(x: 0, y: containerView.bounds.height-30, width: containerView.bounds.width, height: 25)
          lblLoading.text = "Loading..."
          lblLoading.font = lblLoading.font.withSize(22)
          lblLoading.textAlignment = NSTextAlignment.center
          lblLoading.textColor = UIColor.white
          containerView.addSubview(lblLoading)
          
      }
    
    func rotateWithAnimation(angle: CGFloat, duration: CGFloat? = nil) {
        let pathAnimation = CABasicAnimation(keyPath: "transform.rotation")
        pathAnimation.duration = CFTimeInterval(duration ?? 150.0)
        pathAnimation.fromValue = 0
        pathAnimation.toValue = angle
      pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        self.transform = transform.rotated(by: angle)
        self.layer.add(pathAnimation, forKey: "transform.rotation")
    }
      /*
     func activityStartAnimating(){
              let backgroundView = UIView()
              backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
              //backgroundView.alpha = 0.1
              backgroundView.backgroundColor = UIColor.clear
              backgroundView.tag = 475647
              self.addSubview(backgroundView)
              
              let containerView = UIView()
              containerView.frame = CGRect.init(x: 0, y: 0, width: 175, height: 160)
              containerView.center = CGPoint(x:backgroundView.bounds.width/2,y:backgroundView.bounds.height/2)
              containerView.layer.cornerRadius = 10
              containerView.backgroundColor = UIColor.clear
             
              backgroundView.addSubview(containerView)
           
            
            var testImage = UIImageView()
              testImage = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
            testImage.image = UIImage(named: "Spinner")
            testImage.center = CGPoint(x:containerView.bounds.width/2,y:containerView.bounds.height/2)
            containerView.addSubview(testImage)
            testImage.backgroundColor = UIColor.clear
            
            
            containerView.rotateWithAnimation(angle: 360)
            
          
          }
    */
      func activityStopAnimating() {
          if let background = viewWithTag(475647){
              background.removeFromSuperview()
          }
          self.isUserInteractionEnabled = true
      }
}

extension UITextField {

func underlined() {

         let border = CALayer()
         let width = CGFloat(3.0)
         border.borderColor = UIColor.red.cgColor
         border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: width)
         border.borderWidth = width
         self.layer.addSublayer(border)
         self.layer.masksToBounds = true

    }
    
}
extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
           let rotatedSize = CGRect(origin: .zero, size: size)
               .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
               .integral.size
           UIGraphicsBeginImageContext(rotatedSize)
           if let context = UIGraphicsGetCurrentContext() {
               let origin = CGPoint(x: rotatedSize.width / 2.0,
                                    y: rotatedSize.height / 2.0)
               context.translateBy(x: origin.x, y: origin.y)
               context.rotate(by: radians)
               draw(in: CGRect(x: -origin.y, y: -origin.x,
                               width: size.width, height: size.height))
               let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
               UIGraphicsEndImageContext()

               return rotatedImage ?? self
           }

           return self
       }
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ quality: JPEGQuality) -> Data? {
        return self.jpegData(compressionQuality: quality.rawValue)
    }
   func resizeImageWith(newSize: CGSize) -> UIImage {

   let horizontalRatio = newSize.width / size.width
   let verticalRatio = newSize.height / size.height

   let ratio = max(horizontalRatio, verticalRatio)
   let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
   UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
   draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
   let newImage = UIGraphicsGetImageFromCurrentImageContext()
   UIGraphicsEndImageContext()
   return newImage!
   }
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func resizedTo1MB() -> UIImage? {
      
        guard let imageData = self.pngData() else { return nil }

        var resizingImage = self
        var imageSizeKB = Double(imageData.count) / 1000.0 // ! Or devide for 1024 if you need KB but not kB

        while imageSizeKB > 1000 { // ! Or use 1024 if you need KB but not kB
            guard let resizedImage = resizingImage.resized(withPercentage: 0.9),
                let imageData = resizedImage.pngData()
                else { return nil }

            resizingImage = resizedImage
            imageSizeKB = Double(imageData.count) / 1000.0 // ! Or devide for 1024 if you need KB but not kB
        }

        return resizingImage
    }


}
extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    public var convertHtmlToNSAttributedString: NSAttributedString? {
        
        guard let data = data(using: .utf8) else {
            return nil
        }
        do {
            
            
            
            return try NSAttributedString(data: data,options: [.documentType: NSAttributedString.DocumentType.html,.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
    var isNumber: Bool {
        let characters = CharacterSet.decimalDigits.inverted
        return !self.isEmpty && rangeOfCharacter(from: characters) == nil
    }
    public func convertHtmlToAttributedStringWithCSS(font: UIFont? , csscolor: String , lineheight: Int, csstextalign: String) -> NSAttributedString? {
        guard let font = font else {
            return convertHtmlToNSAttributedString
        }
        let modifiedString = "<style>body{font-family: '\(font.fontName)'; font-size:\(font.pointSize)px; color: \(csscolor); line-height: \(lineheight)px; text-align: \(csstextalign); }</style>\(self)";
        guard let data = modifiedString.data(using: .utf8) else {
            return nil
        }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch {
            print(error)
            return nil
        }
    }
}
extension UIViewController {
    
    func getCountryCode() -> String {
        let countryLocale = NSLocale.current
        var countryCode = countryLocale.regionCode
        let country = (countryLocale as NSLocale).displayName(forKey: NSLocale.Key.countryCode, value: countryCode)!
        //print("country", country as String)
        countryCode = "AE"
        return countryCode! as String
    }
    
    func addBottomBorderTextfield(textField:UITextField,placeHolderText:String)  {
       
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor(red: 21.0/255.0, green: 66.0/255.0, blue: 102.0/255.0, alpha: 1.0).cgColor //UIColor.red.cgColor
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 34.0/255.0, green: 115.0/255.0, blue: 187.0/255.0, alpha: 1.0)])
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }

     // Convert UIImage to a base64 representation
        //
        func convertImageToBase64(image: UIImage) -> String {
            let imageData = image.pngData()!
    //        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
            return imageData.base64EncodedString()
        }
    func convertImageToBase_64(image: Data) -> String {
               
       //        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
               return image.base64EncodedString()
           }
    
    
    
    // MARK: show Alert
      
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height/2, width: self.view.frame.size.width, height: 70))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        //toastLabel.font = font
        toastLabel.center = self.view.center
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        //toastLabel.sizeToFit()
        toastLabel.numberOfLines = 0
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    /*
    func addTextfield()  {
        
       var dropTextField = UITextField()
        dropTextField =  UITextField(frame: CGRect(x: self.view.frame.size.width-275, y: 5, width: 180, height: 30))
        
        dropTextField.placeholder = "Select Region"
        dropTextField.font = UIFont.systemFont(ofSize: 15)
        dropTextField.borderStyle = UITextField.BorderStyle.roundedRect
        dropTextField.autocorrectionType = UITextAutocorrectionType.no
        dropTextField.keyboardType = UIKeyboardType.default
        dropTextField.returnKeyType = UIReturnKeyType.done
        dropTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        dropTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.navigationController?.navigationBar .addSubview(dropTextField)
        dropTextField.layer.cornerRadius = 15
        let viewImg = UIView(frame: CGRect(x: 0, y: dropTextField.frame.size.height/2, width: 10, height: 10))
        dropTextField.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: -5, y: 0, width: 10, height: 10))
        let image = UIImage(named: "DownArrow")
        imageView.image = image
        viewImg.addSubview(imageView)
        dropTextField.rightView = viewImg
    }
    */
    public func hideTextField() {
        var tview = UIView()
        tview =  UIView(frame: CGRect(x: self.view.frame.size.width-275, y: 5, width: 180, height: 30))
        self.navigationController?.navigationBar .addSubview(tview)
    }
    
    
    func addLeftNavigationImage() {
        let btnNotify: UIButton = UIButton()
        let imageNotify = UIImage(named: "NavigationLogo");
        btnNotify.setImage(imageNotify, for: .normal)
        btnNotify.setTitle("", for: .normal);
        btnNotify.sizeToFit()
        //btnNotify.addTarget(self, action: #selector (backButtonClick(sender:)), for: .touchUpInside)
        let barButtonNotify = UIBarButtonItem(customView: btnNotify)
        
        //self.navigationItem.rightBarButtonItem = barButtonNotify
        self.navigationItem.leftBarButtonItem = barButtonNotify
        
    }
    
    func addNavigationImage() {
        let btnSearch: UIButton = UIButton()
        let image = UIImage(named: "logo");
        btnSearch.setImage(image, for: .normal)
        btnSearch.setTitle("", for: .normal);
        btnSearch.sizeToFit()
       
        let barButton = UIBarButtonItem(customView: btnSearch)
        
        self.navigationItem.leftBarButtonItems = [barButton]
        
    }
    
    func addCustControls() {
        
        //self.navigationItem.rightBarButtonItem = barButton
        
        
        
        let btnSearch: UIButton = UIButton()
        let image = UIImage(named: "search");
        btnSearch.setImage(image, for: .normal)
        btnSearch.setTitle("", for: .normal);
        btnSearch.sizeToFit()
        btnSearch.addTarget(self, action: #selector (loadSearch), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: btnSearch)
        
        let btnNotify: UIButton = UIButton()
        let imageNotify = UIImage(named: "notification");
        btnNotify.setImage(imageNotify, for: .normal)
        btnNotify.setTitle("", for: .normal);
        btnNotify.sizeToFit()
        //btnNotify.addTarget(self, action: #selector (loadSearch), for: .touchUpInside)
        let barButtonNotify = UIBarButtonItem(customView: btnNotify)
        
        //self.navigationItem.rightBarButtonItem = barButtonNotify
        self.navigationItem.rightBarButtonItems = [barButtonNotify,barButton]
        
        //self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 91.0/255.0, green: 59.0/255.0, blue: 27.0/255.0, alpha: 1.0)]
    }
    @objc func loadSearch() {
        
    }

    func addBackButton(title:String) {
        let btnLeftMenu: UIButton = UIButton()
        let image = UIImage(named: "CustomBack");
        btnLeftMenu.setImage(image, for: .normal)
        btnLeftMenu.setTitle(title, for: .normal);
        btnLeftMenu.sizeToFit()
        btnLeftMenu.addTarget(self, action: #selector (backButtonClick(sender:)), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
        
        //self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 91.0/255.0, green: 59.0/255.0, blue: 27.0/255.0, alpha: 1.0)]
    }

    @objc func backButtonClick(sender : UIButton) {
        self.navigationController?.popViewController(animated: true);
    }
    
    func addCustomNavigationBackButton() {
           let btnLeftMenu: UIButton = UIButton()
           let image = UIImage(named: "BackNav");
           btnLeftMenu.setImage(image, for: .normal)
           btnLeftMenu.setTitle("", for: .normal);
           btnLeftMenu.sizeToFit()
           btnLeftMenu.addTarget(self, action: #selector (backButtonClick(sender:)), for: .touchUpInside)
           let barButton = UIBarButtonItem(customView: btnLeftMenu)
           self.navigationItem.leftBarButtonItem = barButton
           
           self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 91.0/255.0, green: 59.0/255.0, blue: 27.0/255.0, alpha: 1.0)]
       }

       @objc func backCButtonClick(sender : UIButton) {
        
           /*let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "MerchantHomeVC") as! MerchantHomeVC
           
           let customViewControllersArray : NSArray = [newViewController]
           self.navigationController?.viewControllers = customViewControllersArray as! [UIViewController]
           self.navigationController?.popToRootViewController(animated: true)
 */
       }
    func addCustomDropDown()  {
        
       var dropTextField = UITextField()
        dropTextField =  UITextField(frame: CGRect(x: self.view.frame.size.width-275, y: 5, width: 180, height: 30))
        
        dropTextField.placeholder = "Select Region"
        dropTextField.font = UIFont.systemFont(ofSize: 15)
        dropTextField.borderStyle = UITextField.BorderStyle.roundedRect
        dropTextField.autocorrectionType = UITextAutocorrectionType.no
        dropTextField.keyboardType = UIKeyboardType.default
        dropTextField.returnKeyType = UIReturnKeyType.done
        dropTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        dropTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
       self.navigationController?.navigationBar.topItem?.titleView = dropTextField
     
     //self.navigationController?.navigationBar .addSubview(dropTextField)
        dropTextField.layer.cornerRadius = 15
        let viewImg = UIView(frame: CGRect(x: 0, y: dropTextField.frame.size.height/2, width: 10, height: 10))
        dropTextField.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: -5, y: 0, width: 10, height: 10))
        let image = UIImage(named: "DownArrow")
        imageView.image = image
        viewImg.addSubview(imageView)
        dropTextField.rightView = viewImg
    }
}

extension UIToolbar {

func ToolbarPiker(mySelect : Selector) -> UIToolbar {

    let toolBar = UIToolbar()

    toolBar.barStyle = UIBarStyle.default
    toolBar.isTranslucent = true
    toolBar.tintColor = UIColor.black
    toolBar.sizeToFit()

    let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

    toolBar.setItems([ spaceButton, doneButton], animated: false)
    toolBar.isUserInteractionEnabled = true

    return toolBar
}

}

