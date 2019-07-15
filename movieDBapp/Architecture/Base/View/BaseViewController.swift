//
//  BaseViewController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class BaseViewController : UIViewController, BaseViewProtocol{
    
    
    func showSpinner() {
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData.init(size: CGSize.init(width: 60.0, height: 60.0), message: "loading", messageFont: nil, messageSpacing: nil, type: NVActivityIndicatorType.lineScale, color: UIColor.white, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: UIColor.lightGray, textColor: nil))
    }
    
    func hideSpinner() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
    func showInfoError(error: MovieAppError) {
        hideSpinner()
        let alert = UIAlertController(title: "There was a problem", message: error.errorDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        }))
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

