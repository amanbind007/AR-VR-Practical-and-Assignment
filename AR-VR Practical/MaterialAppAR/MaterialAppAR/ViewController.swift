//
//  ViewController.swift
//  MaterialAppAR
//
//  Created by Aman Bind on 02/03/22.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    let configuration = ARWorldTrackingConfiguration()

    @IBOutlet weak var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.session.run(configuration)
        self.sceneView.debugOptions = [.showFeaturePoints, .showWorldOrigin]
        self.sceneView.showsStatistics = true
        
        let scene = SCNScene()
        self.sceneView.scene = scene
        
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.2)
        node.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "8k_earth_daymap.jpeg")
        node.geometry?.firstMaterial?.transparency = 0.9
        node.position = SCNVector3(0,0,0)
        self.sceneView.scene.rootNode.addChildNode(node)
        
        
        
        // Do any additional setup after loading the view.
    }


}

