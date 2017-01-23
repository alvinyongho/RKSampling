//
//  ViewController.swift
//  RKSampling
//
//  Created by Alvin Ho on 1/22/17.
//  Copyright © 2017 Alvin Ho. All rights reserved.
//

import UIKit
import ResearchKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Actions
    @IBAction func consentTapped(sender: AnyObject){
        // taskRunUUID --> taskRun: nil which means we're not restoring a previous state
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    


}

extension ViewController : ORKTaskViewControllerDelegate {
    
    // Handles task results here in didFinishWith:reason:error and all it does right now is dismiss the view controller
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        taskViewController.dismiss(animated: true, completion: nil)
    }
}
