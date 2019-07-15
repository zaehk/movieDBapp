//
//  YoutubePlayerViewController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 15/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import UIKit
import YoutubePlayerView


class YoutubePlayerViewController: UIViewController {

    @IBOutlet weak var youtubePlayer: YoutubePlayerView!
    var videoKey : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        // Do any additional setup after loading the view.
    }
    
    private func configureViews(){
        youtubePlayer.delegate = self
        if let videoId = self.videoKey{
            youtubePlayer.loadWithVideoId(videoId)
        }
    }

}

extension YoutubePlayerViewController : YoutubePlayerViewDelegate{
    
    
    
    //when video ends it dismiss the VC
    func playerView(_ playerView: YoutubePlayerView, didChangedToState state: YoutubePlayerState) {
        if state == .ended{
            navigationController?.popViewController(animated: true)
        }
    }
    
    //when video is ready it starts automatically
    func playerViewDidBecomeReady(_ playerView: YoutubePlayerView) {
        playerView.play()
    }
}
