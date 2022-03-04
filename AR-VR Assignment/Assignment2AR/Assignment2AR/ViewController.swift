//
//  ViewController.swift
//  Assignment2AR
//
//  Created by Aman Bind on 05/03/22.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sceneView.session.run(configuration)
        self.sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        self.sceneView.showsStatistics = true
        
        let scene = SCNScene()
        self.sceneView.scene = scene
        
    }

    @IBAction func addTorus(_ sender: Any) {
        let node = SCNNode()
        node.geometry = SCNTorus(ringRadius: 0.1, pipeRadius: 0.02)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.position = SCNVector3(0, 0, 0)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
}

