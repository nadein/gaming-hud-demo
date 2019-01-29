//
//  ARNodesFactory.swift
//  gamingHUDdemo
//
//  Created by Alex Nadein on 1/29/19.
//  Copyright © 2019 Alex Nadein. All rights reserved.
//

import UIKit
import ARKit

class ARNodesProvider: NSObject {
    
    class func makeTextNode(text: String, fontName: String, fontSize: CGFloat, extrusionDepth: CGFloat) -> SCNNode? {

        let newText = SCNText(string: text, extrusionDepth: extrusionDepth)
        newText.font = UIFont (name: fontName, size: fontSize)
        newText.firstMaterial!.diffuse.contents = UIColor.white
        newText.firstMaterial!.specular.contents = UIColor.white
        
        let textNode = SCNNode(geometry: newText)
        return textNode
    }
}
