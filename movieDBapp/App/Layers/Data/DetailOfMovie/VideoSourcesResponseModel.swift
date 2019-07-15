//
//  VideoSourcesResponseModel.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 15/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

struct VideoSourcesResponseModel : Codable{
    let id: Int
    let results: [VideoSources]
}

// MARK: - Result
struct VideoSources : Codable {
    let id, key: String
    let name, site: String
    let size: Int
    let type: String
}
