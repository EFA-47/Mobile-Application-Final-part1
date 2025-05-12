//
//  RegionListViewModel.swift
//  Final-part1
//
//  Created by Emir Fatih AYYILDIZ on 22.01.2024.
//

import Foundation

class RegionListViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var regionList: [Region] = []
    private var dataSource = RegionDataSource()

    init() {
        dataSource.delegate = self
    }

    func loadRegionList() {
        dataSource.loadRegionList()
    }
}

extension RegionListViewModel: RegionDataSourceDelegate {

    func regionListLoaded(regionList: [Region]) {
        isLoading = false
        self.regionList = regionList
    }
}
