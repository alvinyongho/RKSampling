//
//  JackItStep.swift
//  RKSampling
//
//  Created by Alvin Ho on 1/23/17.
//  Copyright © 2017 Alvin Ho. All rights reserved.
//

import UIKit
import ResearchKit




class JackItStep: ORKActiveStep {
    static func stepViewControllerClass() -> JackItStepViewController.Type {
        return JackItStepViewController.self
    }
}
