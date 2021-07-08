//
//  VehicleClassModel.swift
//  Premium Calculator
//
//  Created by softnotions on 04/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import Foundation
import SwiftyJSON

class VehicleClassModel {

    let httpcode: String?
    let status: String?
    let message: String?
    let vehicleClassData: VehicleClassData?

    init(_ json: JSON) {
        httpcode = json["httpcode"].stringValue
        status = json["status"].stringValue
        message = json["message"].stringValue
        vehicleClassData = VehicleClassData(json["data"])
    }

}

class VehicleClassData {

    let vehicleClass: [VehicleClass]?

    init(_ json: JSON) {
        vehicleClass = json["vehicle_class"].arrayValue.map { VehicleClass($0) }
    }

}

class VehicleClass {

    let id: Int?
    let className: String?
    let status: Int?

    init(_ json: JSON) {
        id = json["id"].intValue
        className = json["class_name"].stringValue
        status = json["status"].intValue
    }

}
