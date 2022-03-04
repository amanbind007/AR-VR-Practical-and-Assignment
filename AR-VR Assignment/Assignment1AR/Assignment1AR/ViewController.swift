//
//  ViewController.swift
//  Assignment1AR
//
//  Created by Aman Bind on 04/03/22.
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
        self.sceneView.showsStatistics = true
        self.sceneView.debugOptions = [.showFeaturePoints,.showWorldOrigin]
        let scene = SCNScene()
        self.sceneView.scene = scene
        
        
        let node = SCNNode()
        node.geometry = SCNCylinder(radius: 0.2, height: 0.2)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.position = SCNVector3(0,0,0)
        self.sceneView.scene.rootNode.addChildNode(node)
        
    }


}

