//
//  JackItStepViewController.swift
//  RKSampling
//
//  Created by Alvin Ho on 1/23/17.
//  Copyright © 2017 Alvin Ho. All rights reserved.
//

import UIKit
import ResearchKit

class DemoView: UIView {
    
}


class JackItStepViewController: ORKActiveStepViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.0, green:1.0, blue:0.0, alpha:1.0)
        
        let demoView = DemoView()
        demoView.translatesAutoresizingMaskIntoConstraints = false
        demoView.backgroundColor = UIColor(red:1.0, green:0.0, blue:0.0, alpha:1.0)
        self.customView = demoView
        self.customView?.superview!.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[demoView]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["demoView": demoView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[demoView]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["demoView": demoView]))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
