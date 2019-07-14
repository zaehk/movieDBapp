//
//  PopularMoviesCell.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import UIKit

class PopularMoviesCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIView!
    @IBOutlet weak var imageGradientView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var gradientLayer : CAGradientLayer = CAGradientLayer()
    
    static var nibName = Constants.TableViewCellIdentifiers.PopularMoviesCel

    override func awakeFromNib() {
        super.awakeFromNib()
        imageGradientView.layer.masksToBounds = true
        imageGradientView.layer.cornerRadius = 10
        
        gradientLayer.frame = imageGradientView.bounds // 2
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor] // 3
        imageGradientView.layer.addSublayer(gradientLayer) // 4
        
        scoreLabel.layer.borderWidth = 2
        scoreLabel.layer.borderColor = UIColor.white.cgColor
        scoreLabel.layer.masksToBounds = true

        
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = contentView.frame
        scoreLabel.layer.cornerRadius = scoreLabel.frame.height / 2

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
