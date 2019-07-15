//
//  VideoSourcesDomainModel.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 15/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

struct VideoSourcesDomainModel{
    
    let videoKeys : [String] = []
    
    
    init(videoSourcesRM: VideoSourcesResponseModel){
        for video in videoSourcesRM.results{
            if video.site == "YouTube"
            videoKeys.append(video.key)
        }
    }
}
