//
//  ConsentDocument.swift
//  RKSampling
//
//  Created by Alvin Ho on 1/22/17.
//  Copyright © 2017 Alvin Ho. All rights reserved.
//

import UIKit
import ResearchKit

public var ConsentDocument: ORKConsentDocument {

    let consentDocument = ORKConsentDocument()
    consentDocument.title = "I Give Consent"
    
    //Consent sections
        // Define the content section types
    let consentSectionTypes: [ORKConsentSectionType] = [
            .overview,
            .dataGathering,
            .privacy,
            .dataUse,
            .timeCommitment,
            .studySurvey,
            .studyTasks,
            .withdrawing
    ]
    
    // Create the content sections
    var consentSections: [ORKConsentSection] = consentSectionTypes.map {
        consentSectionType in
        let consentSection = ORKConsentSection(type: consentSectionType)
        consentSection.summary = "Summary of the consent section"
        consentSection.content = "Content of the consent section."
        return consentSection
        
    }
    
    consentDocument.sections = consentSections
    
    //Signature
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
    
//    
//    var reviewStep: [ORKConsentReviewStep] = [ORKConsentReviewStep(identifier: "reviewStep", signature: consentDocument.signatures![0], in: consentDocument)]
//    
//    
//    ORKCo
//    
//    
//    
//    
//    var taskViewController: [ORKTaskViewController] = ORKTaskViewController(task: <#T##ORKTask?#>, taskRun: <#T##UUID?#>)
//    
    
    return consentDocument
}
