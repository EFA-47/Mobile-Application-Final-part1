//
//  RegionListScreen.swift
//  Final-part1
//
//  Created by Emir Fatih AYYILDIZ on 22.01.2024.
//

import SwiftUI

struct RegionListView: View {

    @StateObject private var viewModel = RegionListViewModel()
    @State private var selectedRegion: Region?

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                LoadingView()
                    .onAppear {
                        viewModel.loadRegionList()
                    }
            } else {
                List(viewModel.regionList, id: \.self) { region in RegionRowView(region: region).onTapGesture {
                            selectedRegion = region
                        }
                }
                .navigationTitle("region List")
                .sheet(item: $selectedRegion) { region in
                    RegionDetailScreen(regionName: region.name)
                }
            }
        }
    }
}

#Preview {
    RegionListView()
}

