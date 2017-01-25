//
//  JackItStepViewController.swift
//  RKSampling
//
//  Created by Alvin Ho on 1/23/17.
//  Copyright © 2017 Alvin Ho. All rights reserved.
//

import UIKit
import ResearchKit

/*class DemoView: UIView {
    
}*/



/*
class JackItStepView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    
}
*/





extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 1.0
        animation.repeatDuration = 50
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}



class JackItStepViewController: ORKActiveStepViewController {

    
    @IBOutlet var testView: UIView!
    
/*    func initializeStorboardVC() -> JackItStepViewController{
        let storyboard = UIStoryboard(name: "JackItTaskStoryboard", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "JackItStepViewController") as! JackItStepViewController
        
  //      print("instnatiated")
//        return controller.view as! JackItStepView

    }
     
     
*/
    
    
    func disableNextButton(){ // hack to remove button
        for subview in self.view.subviews {
            for subview1 in subview.subviews {
                for subview2 in subview1.subviews {
                    for subview3 in subview2.subviews {
                        
                        if let button = subview3 as? UIButton {
                            button.isHidden = true
                        }
                    }
                }
            }
        }
    }
//
    func enableNextButton(){ // hack to remove button
        for subview in self.view.subviews {
            for subview1 in subview.subviews {
                for subview2 in subview1.subviews {
                    for subview3 in subview2.subviews {
                        
                        if let button = subview3 as? UIButton {
                            button.isHidden = false
                        }
                    }
                }
            }
        }
    }
    
    
    
    func addJackItMainImage(){
        let imageView = UIImageView(image: UIImage(named: "PhoneShake") )
        
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        
        imageView.contentMode = UIViewContentMode.scaleAspectFit;
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.customView?.addSubview(imageView)
        
        NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 100).isActive = true
        
        NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 200).isActive = true
        
        NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0).isActive = true
        
        imageView.shake()
        
        
        
        
        // add the label instruction
        let shakeItInstructions = UILabel()
            
        shakeItInstructions.frame = CGRect(x: 0, y: 0, width: 300, height: 120)
        shakeItInstructions.numberOfLines = 2
        shakeItInstructions.text = "Shake the phone as fast as you can for 10 seconds. "
        
        self.customView?.addSubview(shakeItInstructions)
        
        
        let button = UIButton(frame: CGRect(x: 130, y: 300, width: 100, height: 50))
        button.backgroundColor = UIColor.green
        button.setTitle("Shake It!", for: .normal)
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        self.customView?.addSubview(button)
        
        
        

//
        
        
        

    }
    func buttonClicked(sender: UIButton!){
        
        //        showModal() {
        print("BUTTON ACTION TRIGGERED")
        let modalViewController = ModalViewController()
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
        //        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        disableNextButton()
        //initializeStorboardVC();
        
        self.view.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        
        let demoView = JackItStepView()
        demoView.translatesAutoresizingMaskIntoConstraints = false
        demoView.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        self.customView = demoView
        self.customView?.superview!.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[demoView]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["demoView": demoView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[demoView]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["demoView": demoView]))
        
        self.addJackItMainImage()

    
        
        
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
