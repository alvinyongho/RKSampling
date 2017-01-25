//
//  ModalViewController.swift
//  RKSampling
//
//  Created by Alvin Ho on 1/24/17.
//  Copyright © 2017 Alvin Ho. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    @IBOutlet var imageIndicator: UIImageView!

    var count = 15

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dispatchTime = DispatchTime.now() + .seconds(5)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            // your function here
            self.imageIndicator.backgroundColor = UIColor.green
            
            _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: true)

        }
        

        // Do any additional setup after loading the view.
    }

    @IBOutlet var countDownLabel: UILabel!
    
    func updateCounter() {
        if(self.count > 0) {
            self.count = self.count - 1;
            self.countDownLabel.text = String(self.count)
        }
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
