//
//  PremiumAddOnModel.swift
//  Premium Calculator
//
//  Created by softnotions on 04/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import Foundation
import SwiftyJSON

class PremiumAddOnModel {

    let httpcode: String?
    let status: String?
    let message: String?
    let premiumAddOnModelData: PremiumAddOnModelData?

    init(_ json: JSON) {
        httpcode = json["httpcode"].stringValue
        status = json["status"].stringValue
        message = json["message"].stringValue
        premiumAddOnModelData = PremiumAddOnModelData(json["data"])
    }

}
class PremiumAddOnModelData {

    let premiumValue: PremiumValue?
    let requestId: Int?
    let currency: String?
    let addOnRate: String?

    init(_ json: JSON) {
        premiumValue = PremiumValue(json["premium_value"])
        requestId = json["request_id"].intValue
        currency = json["currency"].stringValue
        addOnRate = json["add_on_rate"].stringValue
    }

}

class PremiumValue {

    let Comprehensive: String?
    let TPFT: String?
    let TPO: String?

    init(_ json: JSON) {
        Comprehensive = json["Comprehensive"].stringValue
        TPFT = json["TPFT"].stringValue
        TPO = json["TPO"].stringValue
    }

}
