//
//  VersionModel.swift
//  Premium Calculator
//
//  Created by softnotions on 04/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import Foundation
import SwiftyJSON

class VersionModel {

    let httpcode: String?
    let status: String?
    let message: String?
    let versionModelData: VersionModelData?

    init(_ json: JSON) {
        httpcode = json["httpcode"].stringValue
        status = json["status"].stringValue
        message = json["message"].stringValue
        versionModelData = VersionModelData(json["data"])
    }

}

class VersionModelData {

    let version: String?
    let androidVersionCode: String?
    let iosInitialUpdate: String?
    let androidInitialUpdate: String?

    init(_ json: JSON) {
        version = json["version"].stringValue
        androidVersionCode = json["android_version_code"].stringValue
        iosInitialUpdate = json["iosInitialUpdate"].stringValue
        androidInitialUpdate = json["androidInitialUpdate"].stringValue
    }

}
