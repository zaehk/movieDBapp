//
//  BaseViewController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController, BaseViewProtocol{
    
    
    func showSpinner() {
        
    }
    
    func hideSpinner() {
        
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

