//
//  PremiumDropModel.swift
//  Premium Calculator
//
//  Created by softnotions on 04/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import Foundation
import SwiftyJSON

class PremiumDropModel {

    let httpcode: String?
    let status: String?
    let message: String?
    let dbUpdate: Int?
    let updateTime: String?
    let premiumModelData: PremiumModelData?

    init(_ json: JSON) {
        httpcode = json["httpcode"].stringValue
        status = json["status"].stringValue
        message = json["message"].stringValue
        dbUpdate = json["db_update"].intValue
        updateTime = json["update_time"].stringValue
        premiumModelData = PremiumModelData(json["data"])
    }

}

class PremiumModelData {

   let vehicleClassTable: [VehicleClassTable]?
    let vehicleCategoryTable: [VehicleCategoryTable]?
    let vehicleTypesTable: [VehicleTypesTable]?
    let weightRangeTable: [WeightRangeTable]?
    let premiumCoverTypeTable: [PremiumCoverTypeTable]?
    let addonsTable: [AddonsTable]?
    let premiumRates: [PremiumRates]?
    let extraFieldsTable: [ExtraFieldsTable]?
    
    let vatPercentage: String?

    init(_ json: JSON) {
        vehicleClassTable = json["vehicle_class_table"].arrayValue.map { VehicleClassTable($0) }
        vehicleCategoryTable = json["vehicle_category_table"].arrayValue.map { VehicleCategoryTable($0) }
        vehicleTypesTable = json["vehicle_types_table"].arrayValue.map { VehicleTypesTable($0) }
        weightRangeTable = json["weight_range_table"].arrayValue.map { WeightRangeTable($0) }
        premiumCoverTypeTable = json["premium_cover_type_table"].arrayValue.map { PremiumCoverTypeTable($0) }
        addonsTable = json["addons_table"].arrayValue.map { AddonsTable($0) }
        premiumRates = json["premium_rates"].arrayValue.map { PremiumRates($0) }
        extraFieldsTable = json["extra_fields_table"].arrayValue.map { ExtraFieldsTable($0) }
        vatPercentage = json["vat_percentage"].stringValue
    }

}




class VehicleClassTable {

    let id: Int?
    let className: String?
    let status: Int?

    init(_ json: JSON) {
        id = json["id"].intValue
        className = json["class_name"].stringValue
        status = json["status"].intValue
    }

}


class VehicleCategoryTable {

    let id: Int?
    let categoryName: String?
    let classId: Int?
    let status: Int?

    init(_ json: JSON) {
        id = json["id"].intValue
        categoryName = json["category_name"].stringValue
        classId = json["class_id"].intValue
        status = json["status"].intValue
    }

}
class VehicleTypesTable {

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


class WeightRangeTable {

   let id: Int?
    let rangeName: String?
    let status: Int?

    init(_ json: JSON) {
        id = json["id"].intValue
        rangeName = json["range_name"].stringValue
        status = json["status"].intValue
    }

}

class PremiumCoverTypeTable {

   let id: Int?
    let coverName: String?
    let status: Int?

    init(_ json: JSON) {
        id = json["id"].intValue
        coverName = json["cover_name"].stringValue
        status = json["status"].intValue
    }

}
class AddonsTable {

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

class PremiumRates {
    let id: Int?
    let vehicleClass: Int?
    let premiumType: Int?
    let vehicleCategory: Int?
    let vehicleType: Int?
    let claimFreeRate: String?
    let claimFreeRatePercent: Int?
    let claimOnRate: String?
    let claimOnRatePercent: Int?
    let extraClaimRate: String?
    let extraClaimRatePercent: Int?
    let minimumRate: String?
    let minimumRatePercent: Int?
    let pasgerCarryExtra: String?
    let pasgerCarryExtraPercent: Int?
    let weightRange: Int?
    let aboveYearRange: Int?
    let perSeatExtra: String?
    let perSeatExtraPercent: Int?
    let status: Int?

    init(_ json: JSON) {
        id = json["id"].intValue
        vehicleClass = json["vehicle_class"].intValue
        premiumType = json["premium_type"].intValue
        vehicleCategory = json["vehicle_category"].intValue
        vehicleType = json["vehicle_type"].intValue
        claimFreeRate = json["claim_free_rate"].stringValue
        claimFreeRatePercent = json["claim_free_rate_percent"].intValue
        claimOnRate = json["claim_on_rate"].stringValue
        claimOnRatePercent = json["claim_on_rate_percent"].intValue
        extraClaimRate = json["extra_claim_rate"].stringValue
        extraClaimRatePercent = json["extra_claim_rate_percent"].intValue
        minimumRate = json["minimum_rate"].stringValue
        minimumRatePercent = json["minimum_rate_percent"].intValue
        pasgerCarryExtra = json["pasger_carry_extra"].stringValue
        pasgerCarryExtraPercent = json["pasger_carry_extra_percent"].intValue
        weightRange = json["weight_range"].intValue
        aboveYearRange = json["above_year_range"].intValue
        perSeatExtra = json["per_seat_extra"].stringValue
        perSeatExtraPercent = json["per_seat_extra_percent"].intValue
        status = json["status"].intValue
    }



}

class ExtraFieldsTable {

    let id: Int?
    let field: String?
    let fieldType: String?
    let label: String?
    let vehicleClass: Int?
    let vehicleCategory: Int?
    let premiumType: Int?

    init(_ json: JSON) {
        id = json["id"].intValue
        field = json["field"].stringValue
        fieldType = json["field_type"].stringValue
        label = json["label"].stringValue
        vehicleClass = json["vehicle_class"].intValue
        vehicleCategory = json["vehicle_category"].intValue
        premiumType = json["premium_type"].intValue
    }
}
