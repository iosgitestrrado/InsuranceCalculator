//
//  PremiumComputeModel.swift
//  Premium Calculator
//
//  Created by softnotions on 04/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import Foundation
import SwiftyJSON

class PremiumComputeModel {

    let httpcode: String?
    let status: String?
    let message: String?
    let premiumCompData: PremiumComputeModelData?

    init(_ json: JSON) {
        httpcode = json["httpcode"].stringValue
        status = json["status"].stringValue
        message = json["message"].stringValue
        premiumCompData = PremiumComputeModelData(json["data"])
    }

}

class PremiumComputeModelData {

    let premiumComputeValue: PremiumComputeValue?
    let requestId: Int?
    let addons: [Addons]?
    let currency: String?

    init(_ json: JSON) {
        premiumComputeValue = PremiumComputeValue(json["premium_value"])
        requestId = json["request_id"].intValue
        addons = json["add-ons"].arrayValue.map { Addons($0) }
        currency = json["currency"].stringValue
    }

}

class PremiumComputeValue {

    let Comprehensive: String?
    let TPFT: String?
    let TPO: String?

    init(_ json: JSON) {
        Comprehensive = json["Comprehensive"].stringValue
        TPFT = json["TPFT"].stringValue
        TPO = json["TPO"].stringValue
    }

}
class Addons {

    let id: Int?
    let addonName: String?
    let description: String?
    let addonValue: String?
    let valueType: String?
    let addonValueText: String?

    init(_ json: JSON) {
        id = json["id"].intValue
        addonName = json["addon_name"].stringValue
        description = json["description"].stringValue
        addonValue = json["addon_value"].stringValue
        valueType = json["value_type"].stringValue
        addonValueText = json["addon_value_text"].stringValue
    }

}
