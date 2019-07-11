//
//  TF_PlaneTrackViewController.swift
//  ARDemo
//
//  Created by Twisted Fate on 2019/7/5.
//  Copyright © 2019 Twisted Fate. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class TF_PlaneTrackViewController: UIViewController, ARSCNViewDelegate {

    var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("\(String(describing: sceneView))")
        sceneView = ARSCNView(frame: self.view.bounds)
        sceneView.delegate = self
        view.addSubview(sceneView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
