//
//  VehicleCatModel.swift
//  Premium Calculator
//
//  Created by softnotions on 04/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import Foundation
import SwiftyJSON

class VehicleCatModel {

    let httpcode: String?
    let status: String?
    let message: String?
    let vehicleCatData: VehicleCatData?

    init(_ json: JSON) {
        httpcode = json["httpcode"].stringValue
        status = json["status"].stringValue
        message = json["message"].stringValue
        vehicleCatData = VehicleCatData(json["data"])
    }

}
class VehicleCatData {

    let vehicleCategories: [VehicleCategories]?

    init(_ json: JSON) {
        vehicleCategories = json["vehicle_categories"].arrayValue.map { VehicleCategories($0) }
    }

}

class VehicleCategories {

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
