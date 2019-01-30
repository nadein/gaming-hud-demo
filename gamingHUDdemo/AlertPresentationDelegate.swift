//
//  AlertPresentationDelegate.swift
//  gamingHUDdemo
//
//  Created by Alex Nadein on 1/30/19.
//  Copyright © 2019 Alex Nadein. All rights reserved.
//

import UIKit

protocol AlertPresentationDelegate: NSObjectProtocol {
    func presentAlert(title: String, text: String)
}
