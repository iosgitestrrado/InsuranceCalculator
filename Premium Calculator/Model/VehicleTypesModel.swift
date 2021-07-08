//
//  VehicleTypesModel.swift
//  Premium Calculator
//
//  Created by softnotions on 04/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import Foundation
import SwiftyJSON

class VehicleTypesModel {

    let httpcode: String?
    let status: String?
    let message: String?
    let vehicleTypeData: VehicleTypeData?

    init(_ json: JSON) {
        httpcode = json["httpcode"].stringValue
        status = json["status"].stringValue
        message = json["message"].stringValue
        vehicleTypeData = VehicleTypeData(json["data"])
    }

}
class VehicleTypeData {

    let vehicleType: [VehicleType]?

    init(_ json: JSON) {
        vehicleType = json["vehicle_types"].arrayValue.map { VehicleType($0) }
    }

}

class VehicleType {

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
