//
//  TF_FaceTrackViewController.swift
//  ARDemo
//
//  Created by Twisted Fate on 2019/7/5.
//  Copyright © 2019 Twisted Fate. All rights reserved.
//

import UIKit
import ARKit

class TF_FaceTrackViewController: UIViewController, ARSCNViewDelegate {

    var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sceneView = ARSCNView(frame: self.view.bounds)
        sceneView.delegate = self
        view.addSubview(sceneView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        assert(ARFaceTrackingConfiguration.isSupported, "当前设备不支持ARFaceTrackingConfiguration")
        let config = ARFaceTrackingConfiguration()
        sceneView.session.run(config)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
     }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        guard anchor is ARPlaneAnchor else {
            return
        }
        let box = SCNBox(width: 0.08, height: 0.08, length: 0.08, chamferRadius: 0)
        let boxNode = SCNNode(geometry: box)
        node.addChildNode(boxNode)
    }
}
