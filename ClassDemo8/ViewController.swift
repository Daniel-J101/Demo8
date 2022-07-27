//
//  ViewController.swift
//  ClassDemo8
//
//  Created by Joe Miller on 7/21/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var boxLabel: UILabel!
    @IBOutlet weak var viewBox: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleDragGesture(_ recognizer: UIPanGestureRecognizer) {
        boxLabel.text = "Drag"
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
    }
    
    @IBAction func recognizeTapGesture(recognizer: UITapGestureRecognizer)
    {
        boxLabel.text = "Tap"
        let colorRed: CGFloat = CGFloat(arc4random()) / CGFloat(RAND_MAX)
        let colorGreen: CGFloat = CGFloat(arc4random()) / CGFloat(RAND_MAX)
        let colorBlue: CGFloat = CGFloat(arc4random()) / CGFloat(RAND_MAX)
        viewBox.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1)
    }
    
    @IBAction func recognizeLongPressedGesture (recognizer: UILongPressGestureRecognizer)
    {
        boxLabel.text = "Long Press"
        viewBox.backgroundColor = UIColor.black
    }
    
    @IBAction func recognizeRotateGesture(recognizer: UIRotationGestureRecognizer)
    {
        boxLabel.text = "Rotate"
        recognizer.view!.transform = recognizer.view!.transform.rotated(by: recognizer.rotation)
        recognizer.rotation = 0
    }
    
    @IBAction func recognizePinchGesture(recognizer: UIPinchGestureRecognizer)
    {
        boxLabel.text = "Resize"
        recognizer.view!.transform = recognizer.view!.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
        recognizer.scale = 1
    }
    


}

