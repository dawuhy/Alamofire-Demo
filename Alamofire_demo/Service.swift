//
//  Service.swift
//  Alamofire_demo
//
//  Created by Huy on 7/21/20.
//  Copyright © 2020 nhn. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    // https://restcountries.eu/rest/v2
    fileprivate var baseUrl = ""
    typealias countriesCallBack = (_ countries:[Country]?, _ status: Bool, _ message: String) -> Void
    var callBack:countriesCallBack?
    
    init(baseUrl:String) {
        self.baseUrl = baseUrl
    }
    
    func getAllCountryNameFrom(endPoint:String) {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard let data = responseData.data else {return}
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                self.callBack?(countries, true, "Fetch success")
            }
            catch {
                self.callBack?(nil, false, error.localizedDescription)
            }
        }
    }
    
    func completionHandler(callBack: @escaping countriesCallBack) {
        self.callBack = callBack
    }
}
