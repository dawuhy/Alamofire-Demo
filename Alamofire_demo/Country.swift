//
//  Country.swift
//  Alamofire_demo
//
//  Created by Huy on 7/21/20.
//  Copyright © 2020 nhn. All rights reserved.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var capital: String?
    var countryCode: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case capital = "capital"
        case countryCode = "alpha3Code"
    }
}
