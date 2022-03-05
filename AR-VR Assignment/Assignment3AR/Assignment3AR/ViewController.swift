//
//  ViewController.swift
//  Assignment3AR
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
        
        sceneView.session.run(configuration)
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        sceneView.scene = scene
        
        
    }

    @IBAction func addSphere(_ sender: Any) {
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.2)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        node.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(node)
        
    }
    
}

