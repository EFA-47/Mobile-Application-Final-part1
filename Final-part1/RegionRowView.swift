//
//  RegionRowView.swift
//  Final-part1
//
//  Created by Emir Fatih AYYILDIZ on 22.01.2024.
//

import SwiftUI

struct RegionRowView: View {

    private let region: Region

    init(region: Region) {
        self.region = region
    }

    var body: some View {
        HStack(spacing: .zero) {
            Text(region.name)
            Spacer()
            Text(region.state)
            Spacer()
            Text(region.motd)
            Spacer()
        }
    }
}

#Preview {
    RegionRowView(region: Region(name: "test", state: "tes", motd: "te"))
}
