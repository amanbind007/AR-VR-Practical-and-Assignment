//
//  ViewController.swift
//  Assignment5AR
//
//  Created by Aman Bind on 10/04/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    var nodes: [SCNNode] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        sceneView.scene = scene
        
        let defaultNode = SCNNode(geometry: SCNSphere(radius: 0.2))
        defaultNode.geometry?.firstMaterial?.diffuse.contents = UIColor.systemCyan
        defaultNode.position = SCNVector3(0,0,0)
        
        sceneView.scene.rootNode.addChildNode(nodes.randomElement() ?? defaultNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.session.run(configuration)
        
        let swipeRightGesture = UISwipeGestureRecognizer (target: self, action: #selector(addShape))
        swipeRightGesture.direction = .right
        sceneView.addGestureRecognizer(swipeRightGesture)
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(addShape))
        swipeRightGesture.direction = .left
        sceneView.addGestureRecognizer(swipeLeftGesture)
        
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(addShape))
        swipeRightGesture.direction = .up
        sceneView.addGestureRecognizer(swipeUpGesture)
        
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(addShape))
        swipeRightGesture.direction = .down
        sceneView.addGestureRecognizer(swipeDownGesture)

    }
    
    @objc func addShape(){
        
        sceneView.session.pause()
        sceneView.scene.rootNode.enumerateChildNodes{(node, _) in
            node.removeFromParentNode()
        }
        
        let node1 = SCNNode(geometry: SCNSphere(radius: 0.2))
        node1.position = SCNVector3(0,0,0)
        node1.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        nodes.append(node1)
        
        let node2 = SCNNode(geometry: SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0.01))
        node2.position = SCNVector3(0,0,0)
        node2.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        nodes.append(node2)
        
        let node3 = SCNNode(geometry: SCNCone(topRadius: 0, bottomRadius: 0.2, height: 0.2))
        node3.position = SCNVector3(0,0,0)
        node3.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        nodes.append(node3)
        
        let node4 = SCNNode(geometry: SCNPyramid(width: 0.2, height: 0.2, length: 0.2))
        node4.position = SCNVector3(0,0,0)
        node4.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        nodes.append(node4)
        
        let node5 = SCNNode(geometry: SCNTorus(ringRadius: 0.3, pipeRadius: 0.05))
        node5.position = SCNVector3(0,0,0)
        node5.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        nodes.append(node5)
        
        let node6 = SCNNode(geometry: SCNTube(innerRadius: 0.3, outerRadius: 0.2, height: 0.3))
        node6.position = SCNVector3(0,0,0)
        node6.geometry?.firstMaterial?.diffuse.contents = UIColor.systemPink
        nodes.append(node6)
        
        let node7 = SCNNode(geometry: SCNCylinder(radius: 0.2, height: 0.25))
        node7.position = SCNVector3(0,0,0)
        node7.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        nodes.append(node7)
        
        sceneView.scene.rootNode.addChildNode(nodes.randomElement() ?? node1)
        
    }
    
    
    

}

