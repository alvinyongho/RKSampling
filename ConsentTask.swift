//
//  ConsentTask.swift
//  RKSampling
//
//  Created by Alvin Ho on 1/23/17.
//  Copyright © 2017 Alvin Ho. All rights reserved.
//

import UIKit
import ResearchKit


public var ConsentTask: ORKOrderedTask {
    var steps = [ORKStep]() // initiallize an ORK Step
    
    var consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    
    steps += [visualConsentStep]
    
    
    // ConsentReviewStep
    // Get the first signature
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: consentDocument.signatures![0], in: consentDocument)
    
    reviewConsentStep.text = "Review Consent"
    reviewConsentStep.reasonForConsent = "Consent to join study for RKSampling"
    
    steps += [reviewConsentStep]
    
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps);
    
}
