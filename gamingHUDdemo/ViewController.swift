//
//  ViewController.swift
//  gamingHUDdemo
//
//  Created by Alex Nadein on 1/29/19.
//  Copyright © 2019 Alex Nadein. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private let arKitManager = ARKitManager()

    // MARK: - Outlets
    @IBOutlet private var sceneView: ARSCNView!
    
    // MARK: - UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = arKitManager
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arKitManager.configureSession(sceneView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        arKitManager.pauseSession()
    }

}
