//
//  ViewController.swift
//  Screenshot
//
//  Created by MAC on 25.04.2019.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btnImage.isHidden = true
        
    }

    @IBOutlet weak var btn: NSLayoutConstraint!
    
    @IBAction func btn(_ sender: Any) {
        
        let screenshot = self.view.takeScreenshot()
        
        // detail view controller
        image = screenshot
        
        btnImage.isHidden = false
    }
    
}

extension UIView {
    
    func takeScreenshot() -> UIImage {
        
        //begin
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // draw view in that context.
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // get iamge
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if image != nil {
            return image!
        }
        
        return UIImage()
        
    }
    
}
