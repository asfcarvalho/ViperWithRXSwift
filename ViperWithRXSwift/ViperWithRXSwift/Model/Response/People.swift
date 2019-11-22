//
//  People.swift
//  ViperWithRXSwift
//
//  Created by Anderson F Carvalho on 19/11/19.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import Foundation

struct People: Codable {
    let count: Int?
    var next: String?
    let previous: String?
    var people: [Person]?
    
    enum CodingKeys: String, CodingKey {
        case count, next, previous
        case people = "results"
    }
}
