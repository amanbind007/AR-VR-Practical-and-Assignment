//
//  ViewController.swift
//  BoxARApp
//
//  Created by Aman Bind on 23/02/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        sceneView.showsStatistics = true
        let scene = SCNScene()
        sceneView.scene = scene
        
        addBoxToScene()
    }
    
    private func addBoxToScene(){
        let box = SCNBox(width: 0.3, height: 0.1, length: 0.1, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.green
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(0,0, 0)
        sceneView.scene.rootNode.addChildNode(boxNode)
        
        
    }


}

