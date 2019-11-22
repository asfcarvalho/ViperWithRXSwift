//
//  APIRequest.swift
//  ViperWithRXSwift
//
//  Created by Anderson F Carvalho on 19/11/19.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import Foundation

class APIRequest {
    var baseURL: URL!
    var method = "GET"
    var parameters = [String: String]()
    
    func request(with baseURL: URL) -> URLRequest {
        var request = URLRequest(url: baseURL)
        request.httpMethod = method
        request.allHTTPHeaderFields = ["Accept" : "application/json"]
        return request
    }
}
