//
//  RegioanDataSource.swift
//  Final-part1
//
//  Created by Emir Fatih AYYILDIZ on 22.01.2024.
//
import Foundation

struct RegionDataSource {

    weak var delegate: RegionDataSourceDelegate?

    func loadRegionList() {
        let session = URLSession.shared

        if let url = URL(string: "https://pinballmap.com/api/v1/regions.json") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            let dataTask = session.dataTask(with: request) { data, _, error in
                guard let data = data else { return }

                do {
                    let decoder = JSONDecoder()
                    let regionListResponse = try decoder.decode([Region].self, from: data)
                    print(regionListResponse)
                    DispatchQueue.main.async {
                        self.delegate?.regionListLoaded(regionList: regionListResponse)
                    }
                } catch {
                    print("Error decoding region list response: \(error)")
                }
            }

            dataTask.resume()
        }
    }
}
