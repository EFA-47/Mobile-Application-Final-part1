//
//  RegionDataSourceDelegate.swift
//  Final-part1
//
//  Created by Emir Fatih AYYILDIZ on 22.01.2024.
//

import Foundation

protocol RegionDataSourceDelegate: AnyObject {
    func regionListLoaded(regionList: [Region])
}
