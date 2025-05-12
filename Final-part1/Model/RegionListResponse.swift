//
//  RegionListResponse.swift
//  Final-part1
//
//  Created by Emir Fatih AYYILDIZ on 22.01.2024.
//

import Foundation

struct RegionListResponse: Decodable {
    let regions: [String]
    let status: String
}
