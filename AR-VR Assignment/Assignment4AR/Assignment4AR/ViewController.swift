//
//  ViewController.swift
//  Assignment4AR
//
//  Created by Aman Bind on 05/03/22.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sceneView.session.run(configuration)
        self.sceneView.showsStatistics = true
        
        let scene = SCNScene()
        self.sceneView.scene = scene
        
        let node = SCNNode()
        node.geometry = SCNCone(topRadius: 0, bottomRadius: 0.2, height: 0.2)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.tintColor
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.position = SCNVector3(0,0,0)
        self.sceneView.scene.rootNode.addChildNode(node)
        
    }

    @IBAction func resetOrigin(_ sender: Any) {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes{(node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking,.removeExistingAnchors])
        
        let node = SCNNode()
        node.geometry = SCNCone(topRadius: 0, bottomRadius: 0.2, height: 0.2)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.tintColor
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.position = SCNVector3(0,0,0)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
}

