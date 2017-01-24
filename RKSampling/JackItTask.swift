//
//  JackItTask.swift
//  RKSampling
//
//  Created by Alvin Ho on 1/23/17.
//  Copyright © 2017 Alvin Ho. All rights reserved.
//

import UIKit
import ResearchKit
import AudioToolbox

/**
 Wraps a SystemSoundID.
 
 A class is used in order to provide appropriate cleanup when the sound is
 no longer needed.
 */

class SystemSound {
    var soundID: SystemSoundID = 0
    
    init?(soundURL: URL) {
        if AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID) != noErr {
            return nil
        }
    }
    
    deinit {
        AudioServicesDisposeSystemSoundID(soundID)
    }
}


var JackItTask: ORKOrderedTask {

    
//    let successSoundURL = Bundle.main.url(forResource:"tap", withExtension: "aif")!
//    let successSound = SystemSound(soundURL: successSoundURL)!
//    return ORKOrderedTask.reactionTime(withIdentifier: "ReactionTime", intendedUseDescription: "test", maximumStimulusInterval: 10, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: successSound.soundID, timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])

    let activeStep = JackItStep(identifier: "JAS_id")
    activeStep.title = "Demo Step"
    var endStep = ORKCompletionStep(identifier: "JASes_id")
    endStep.title = "Well done"
    endStep.text = "thank you"
    
    return ORKOrderedTask(identifier: "ts_id", steps: [activeStep,endStep])
    
    
    //
    
//    return ORKOrderedTask.reactionTime(withIdentifier: "JackIt", intendedUseDescription: "This is just for demonstration purposes. Unless you consented to be a part of the ranking ladder", maximumStimulusInterval: 1, minimumStimulusInterval: 2, thresholdAcceleration: 5, numberOfAttempts: 999, timeout: 30, successSound: 0, timeoutSound: 0, failureSound: 0, options: nil)
    
    //("AudioTask", intendedUseDescription: "A sentence prompt will be given to you to read.", speechInstruction: "These are the last dying words of Joseph of Aramathea", shortSpeechInstruction: "The Holy Grail can be found in the Castle of Aaaaaaaaaaah", duration: 10, recordingSettings: nil, options: nil)
}
