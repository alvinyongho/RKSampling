//
//  SurveyTask.swift
//  RKSampling
//
//  Created by Alvin Ho on 1/23/17.
//  Copyright © 2017 Alvin Ho. All rights reserved.
//

import UIKit
import ResearchKit

var SurveyTask: ORKOrderedTask {

    var steps = [ORKStep]();
    
    //TODO: Add instruction step
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Welcome to our study"
    instructionStep.detailText = "You will be specifying your most dominant hand and shaking the phone as rapidly as you can in an upwards and downwards motion for 15 seconds"
    
    steps += [instructionStep]
    //TODO: Add name step
    
    
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    
    let nameQuestionStepTitle = "What is your name?"
    let nameQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    
    steps += [nameQuestionStep]
    
    
    let dominantHandTextChoices = [
        ORKTextChoice(text: "Left", value: "Left" as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Right", value: "Right" as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Neither", value: "N/A" as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Both", value: "N/A" as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Missing a hand", value: "N/A" as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Missing both hands", value: "N/A" as NSCoding & NSCopying & NSObjectProtocol),
    ]
    
    
    let dominantHandAnswerFormat = ORKTextChoiceAnswerFormat(style: ORKChoiceAnswerStyle.singleChoice, textChoices: dominantHandTextChoices)
    
    let dominantHandQuestionStepTitle = "Which hand is your dominant hand?"
    let dominantHandQuestionStep = ORKQuestionStep(identifier: "DominantHandStep", title: dominantHandQuestionStepTitle, answer:dominantHandAnswerFormat)
    
    steps += [dominantHandQuestionStep]
    
    
    
    
    
    
    
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Alright you finished!"
    summaryStep.text = "That was easy!"
    steps += [summaryStep]
    
    
    //TODO: Add 'what is your dominant hand' question
    
    //TODO: 
    
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
    
}
