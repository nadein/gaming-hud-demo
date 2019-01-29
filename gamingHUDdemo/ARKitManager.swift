//
//  ARKitManager.swift
//  gamingHUDdemo
//
//  Created by Alex Nadein on 1/29/19.
//  Copyright © 2019 Alex Nadein. All rights reserved.
//

import UIKit
import ARKit

class ARKitManager: NSObject {
    
    // MARK: - Properties
    private var imageConfiguration: ARImageTrackingConfiguration?
    private var currentSceneView: ARSCNView?
    
    // MARK: - Public methods
    public func configureSession(_ sceneView: ARSCNView) {
        currentSceneView = sceneView
        // Create a session configuration
        imageConfiguration = ARImageTrackingConfiguration()
        
        // Add reference images to session configuration
        guard let referenceImages = ARReferenceImage.referenceImages(
            inGroupNamed: "AR Resources", bundle: nil) else {
                fatalError("Missing expected asset catalog resources.")
        }
        imageConfiguration?.trackingImages = referenceImages
        
        // Run the view's session
        if let configuration = imageConfiguration {
            sceneView.session.run(configuration)
        }
    }
    
    public func pauseSession() {
        currentSceneView?.session.pause()
    }
    
    // MARK: - Private methods
    private func handleFoundImage(_ imageAnchor: ARImageAnchor, _ node: SCNNode) {
        let name = imageAnchor.referenceImage.name!
        print("you found a \(name) image")
        let size = imageAnchor.referenceImage.physicalSize
        
        let text = "Hello world"
        let font = "Arial"
        let fontSize: CGFloat = 3
        let extDepth: CGFloat = 1
        if let textNode = ARNodesProvider.makeTextNode(text: text, fontName: font, fontSize: fontSize, extrusionDepth: extDepth) {
            node.addChildNode(textNode)
            node.opacity = 1
        }
    }

}

// MARK: - ARSCNViewDelegate
extension ARKitManager: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        if let imageAnchor = anchor as? ARImageAnchor {
            handleFoundImage(imageAnchor, node)
        }
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
