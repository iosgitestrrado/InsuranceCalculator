//
//  WeightRangeModel.swift
//  Premium Calculator
//
//  Created by softnotions on 04/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeightRangeModel {

    let httpcode: String?
    let status: String?
    let message: String?
    let weightRangeData: WeightRangeData?

    init(_ json: JSON) {
        httpcode = json["httpcode"].stringValue
        status = json["status"].stringValue
        message = json["message"].stringValue
        weightRangeData = WeightRangeData(json["data"])
    }

}
class WeightRangeData {

    let weightRange: [WeightRanges]?

    init(_ json: JSON) {
        weightRange = json["weight_range"].arrayValue.map { WeightRanges($0) }
    }

}
class WeightRanges {

    let id: Int?
    let rangeName: String?
    let status: Int?

    init(_ json: JSON) {
        id = json["id"].intValue
        rangeName = json["range_name"].stringValue
        status = json["status"].intValue
    }

}
