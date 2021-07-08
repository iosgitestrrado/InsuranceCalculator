//
//  PremiumFormModel.swift
//  Premium Calculator
//
//  Created by softnotions on 04/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import Foundation
import SwiftyJSON

class PremiumFormModel {

    let httpcode: String?
    let status: String?
    let message: String?
    let premiumFormData: PremiumFormData?

    init(_ json: JSON) {
        httpcode = json["httpcode"].stringValue
        status = json["status"].stringValue
        message = json["message"].stringValue
        premiumFormData = PremiumFormData(json["data"])
    }

}


class PremiumFormData {

    let extraFields: [ExtraFields]?
    let weightRange: [WeightRange]?
    let vehicleTypes: [VehicleTypes]?

    init(_ json: JSON) {
        extraFields = json["extra_fields"].arrayValue.map { ExtraFields($0) }
        weightRange = json["weight_range"].arrayValue.map { WeightRange($0) }
        vehicleTypes = json["vehicle_types"].arrayValue.map { VehicleTypes($0) }
    }

}

class ExtraFields {

    let id: Int?
    let field: String?
    let fieldType: String?
    let label: String?

    init(_ json: JSON) {
        id = json["id"].intValue
        field = json["field"].stringValue
        fieldType = json["field_type"].stringValue
        label = json["label"].stringValue
    }

}

class WeightRange {

    let id: Int?
    let rangeName: String?
    let status: Int?

    init(_ json: JSON) {
        id = json["id"].intValue
        rangeName = json["range_name"].stringValue
        status = json["status"].intValue
    }

}

class VehicleTypes {

    let id: Int?
    let typeName: String?
    let categoryId: Int?
    let status: Int?

    init(_ json: JSON) {
        id = json["id"].intValue
        typeName = json["type_name"].stringValue
        categoryId = json["category_id"].intValue
        status = json["status"].intValue
    }

}
