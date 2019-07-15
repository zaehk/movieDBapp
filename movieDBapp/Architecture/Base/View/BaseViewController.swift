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
    
    func showError(error: MovieAppError) {
        hideSpinner()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

