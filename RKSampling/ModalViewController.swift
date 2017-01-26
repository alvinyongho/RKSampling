//
//  ModalViewController.swift
//  RKSampling
//
//  Created by Alvin Ho on 1/24/17.
//  Copyright © 2017 Alvin Ho. All rights reserved.
//

import UIKit
import CoreMotion
import AudioToolbox

extension SystemSoundID {
    static func playFileNamed(fileName: String, withExtenstion fileExtension: String) {
        var sound: SystemSoundID = 0
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            
            print("soundURL is %s", soundURL)
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &sound)
            AudioServicesPlaySystemSound(sound)
        }
    }
}

class ModalViewController: UIViewController {
    @IBOutlet var imageIndicator: UIImageView!

    @IBOutlet var numShakesCounter: UILabel!
    
    var count = 15
    
    
    
    let threshold = 1.80

    let manager = CMMotionManager()

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        SystemSoundID.playFileNamed(fileName: "bellsound", withExtenstion: "mp3")
        

        
        let dispatchTime = DispatchTime.now() + .seconds(5)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            // your function here
            self.imageIndicator.backgroundColor = UIColor.green
            
            _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: true)

        }
        

        // Do any additional setup after loading the view.
    }

    @IBOutlet var countDownLabel: UILabel!
    var shakeCount = 0

    func updateCounter() {
        
        //        if manager.isAccelerometerAvailable {
        manager.accelerometerUpdateInterval = 0.2
        manager.startAccelerometerUpdates(to: OperationQueue.main) {
            [weak self] (data: CMAccelerometerData?, error: Error?) in
            if let acceleration = data?.acceleration {
                
                //                    print("DETECTING ACCELEROMETER SHIT")
                print("acceration.x: %s", acceleration.x)
                print("acceration.y: %s", acceleration.y)
                print("acceration.z: %s", acceleration.z)
                
                if (fabs(acceleration.x) > (self?.threshold)! ||
                    fabs(acceleration.y) > (self?.threshold)! ||
                    fabs(acceleration.z) > (self?.threshold)!){
                    let sensitivity: Float = 1;
                    var x1 : Float = 0
                    var x2 : Float = 0
                    var y1 : Float = 0
                    var y2 : Float = 0
                    var z1 : Float = 0
                    var z2 : Float = 0
                    
                    
                    let totalAccelInXY = sqrt(acceleration.x * acceleration.x + acceleration.y * acceleration.y)
                    
                    
                    print("totalAccelInXY: %s", totalAccelInXY)
                    
                    
                    if( (0.85 < Float(totalAccelInXY)) && (Float(totalAccelInXY) < 3.45)){
                        x1 = Float(acceleration.x)
                        y1 = Float(acceleration.y)
                        z1 = Float(acceleration.z)
                        
                        
                        if((self?.count)! > 0) {
                            print("DETECTED SHAKE EVENT")
                            
                            SystemSoundID.playFileNamed(fileName: "bellsound", withExtenstion: "mp3")
                        
                            self?.updateJacks()
                        }
                        
                        
                        let change: Float = fabs(x1-x2+y1-y2 + z1-z2);
                        if (sensitivity < change) {
                            x2 = x1;
                            y2 = y1;
                            z2 = z1;
                        }
                        
                    }
                    
                    
                }
                
                
                //                    print(rotation)
                //                    self?.imageView.transform = CGAffineTransform(rotationAngle: rotation)
            }
        }
        //        }
        
        
        if(self.count > 0) {
            self.count = self.count - 1;
            self.countDownLabel.text = String(self.count)
        }
        if(self.count == 0) {
            if(playedhorse == false){
            SystemSoundID.playFileNamed(fileName: "horse", withExtenstion: "mp3")
                playedhorse = true
            }
        }
    }
    var playedhorse = false
    
    func updateJacks(){
        if(self.count > 0){
            self.shakeCount += 1;
            self.numShakesCounter.text = String(self.shakeCount)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func donePressed(_ sender: Any) {
      

         NotificationCenter.default.post(name: NSNotification.Name(rawValue: "DoUpdateButton"), object: nil, userInfo: nil)

        
        dismiss(animated: true, completion: nil)
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
