//
//  Region.swift
//  Final-part1
//
//  Created by Emir Fatih AYYILDIZ on 22.01.2024.
//

import Foundation

struct Region: Hashable, Identifiable, Decodable {
    var id = UUID()
    let name : String
    let state: String
    let motd: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

//    static func == (lhs: Region, rhs: Region) -> Bool {
//        return lhs.id == rhs.id
//    }
}
