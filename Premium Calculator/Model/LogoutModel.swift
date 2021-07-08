//
//  LogoutModel.swift
//  Premium Calculator
//
//  Created by softnotions on 04/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import Foundation
import SwiftyJSON
class LogoutModel {

    let httpcode: String?
    let status: String?
    let message: String?
    let logoutModelData: LogoutModelData?

    init(_ json: JSON) {
        httpcode = json["httpcode"].stringValue
        status = json["status"].stringValue
        message = json["message"].stringValue
        logoutModelData = LogoutModelData(json["data"])
    }

}
class LogoutModelData {

    let msg: String?

    init(_ json: JSON) {
        msg = json["msg"].stringValue
    }

}
