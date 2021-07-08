//
//  LoginModel.swift
//  Premium Calculator
//
//  Created by softnotions on 02/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginModel {

    let httpcode: String?
    let status: String?
    let message: String?
    let loginData: LoginData?

    init(_ json: JSON) {
        httpcode = json["httpcode"].stringValue
        status = json["status"].stringValue
        message = json["message"].stringValue
        loginData = LoginData(json["data"])
    }

}

class LoginData {

    let userData: UserData?

    init(_ json: JSON) {
        userData = UserData(json["user_data"])
    }

}

class UserData {

    let accessToken: String?
    let name: String?
    let email: String?

    init(_ json: JSON) {
        accessToken = json["access_token"].stringValue
        name = json["name"].stringValue
        email = json["email"].stringValue
    }

}
