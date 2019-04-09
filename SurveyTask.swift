//
//  SurveyTask.swift
//  SampleResearchKit
//
//  Created by Darwin Lee on 2018/9/15.
//

import ResearchKit
import Foundation

public var SurveyTask: ORKOrderedTask {
    var steps = [ORKStep]()
    //Introduction
    let instructionStep1 = ORKInstructionStep(identifier: "IntroStep1")
    instructionStep1.title = "Activity Diary"
    instructionStep1.text = "Noise, Heearing Loss, Hearing Protection, and Injury Survey."
    steps += [instructionStep1]
    
    //Mini Form 1 to ask user to input his personal information
    let formStep1 = ORKFormStep(identifier: "Personal Information")
    formStep1.title = "Personal Information"
    formStep1.text = nil
    var formItem1 = [ORKFormItem]()
    let formItem1Question1 = ORKFormItem(identifier: "formItem1Question1", text: "Subject ID", answerFormat: ORKAnswerFormat.integerAnswerFormat(withUnit: nil))
    formItem1 += [formItem1Question1]
    
    let formItem1Question2 = ORKFormItem(identifier: "formItem1Question2", text: "Date", answerFormat: ORKAnswerFormat.dateAnswerFormat())
    formItem1 += [formItem1Question2]
    formStep1.formItems = formItem1
    steps += [formStep1]
    
    //Introduction of Daily Activities
    let instructionStep2 = ORKInstructionStep(identifier: "IntroStep2")
    instructionStep2.title = "Daily Activities"
    instructionStep2.text = "The following questions are about your daily activities."
    steps += [instructionStep2]
    
    //Mini Form 2 to ask users for their daily activities
    let formStep2 = ORKFormStep(identifier: "Daily Activities")
    formStep2.title = "Daily Activities"
    formStep2.text = nil
    var formItem2 = [ORKFormItem]()
    let formItem2Question1 = ORKFormItem(identifier: "formItem2Question1", text: "What time did you begin work today?", answerFormat: ORKAnswerFormat.timeOfDayAnswerFormat())
    formItem2 += [formItem2Question1]
    
    let formItem2Question2 = ORKFormItem(identifier: "formItem2Quesion2", text: "What time did you finish work today?", answerFormat: ORKAnswerFormat.timeOfDayAnswerFormat())
    formItem2 += [formItem2Question2]
    
    let formItem2Question3 = ORKFormItem(identifier: "formItem2Question3", text: "What work activity did you do for the longest amount of time today?", answerFormat: ORKAnswerFormat.textAnswerFormat())
    formItem2 += [formItem2Question3]
    formStep2.formItems = formItem2
    steps += [formStep2]
    
    //Introduction of Noise and Hearing Protection
    let instructionStep3 = ORKInstructionStep(identifier: "IntroStep3")
    instructionStep3.title = "Noise and Hearing Protection"
    instructionStep3.text = "The following questions are about noise and hearing protection."
    steps += [instructionStep3]
    
    //Choice Input Question
    let question4TextChoice1 = ORKTextChoice(text: "None of the time", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question4TextChoice2 = ORKTextChoice(text: "A little of the time", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question4TextChoice3 = ORKTextChoice(text: "Some of the time", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question4TextChoice4 = ORKTextChoice(text: "Most of the time", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question4TextChoice5 = ORKTextChoice(text: "All of the time", detailText: nil, value: 5 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)

    let choiceAnswerFormat4 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question4TextChoice1, question4TextChoice2, question4TextChoice3, question4TextChoice4, question4TextChoice5])
    let question4 = ORKQuestionStep(identifier: "question4", title: "How often did you use ear plugs or ear muffs when you were exposed to high noise at work today? \"High noise\" means loud enough that a person has to raise their voice to talk to someone 3 ft away.(Check one.)", answer: choiceAnswerFormat4)
    steps += [question4]
    
    let q5t1 = ORKTextChoice(text: "Foam Earplugs", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let q5t2 = ORKTextChoice(text: "Custom Earplugs", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let q5t3 = ORKTextChoice(text: "Pre-molded Earplugs", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let q5t4 = ORKTextChoice(text: "Ear Muffs", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let q5t5 = ORKTextChoice(text: "Double protection (earplugs and earmuffs)", detailText: nil, value: 5 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let q5t6 = ORKTextChoice(text: "None", detailText: nil, value: 6 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    
    let ansFormat5 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.multipleChoice, textChoices: [q5t1, q5t2, q5t3, q5t4, q5t5, q5t6])
    let q5 = ORKQuestionStep(identifier: "q5", title: "What type of hearing protection did you use at work today? (Check all that apply)", answer: ansFormat5)
    steps += [q5]

    //Scale Input Question
    let scaleAnswerFormat5 = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: nil, minimumValueDescription: nil)
    let question5 = ORKQuestionStep(identifier: "question5", title: "Please circle the noise level you spent the most time in at work today?\n 1: Normal speaking voice or quieter\n 2: As loud as a vacuum\n 3: As loud as a motorcycle\n 4: As loud as a chainsaw\n 5: As loud as a siren or louder", answer: scaleAnswerFormat5)
    steps += [question5]
    
    //Instruction of safety and near -misses
    let instructionStep4 = ORKInstructionStep(identifier: "IntroStep4")
    instructionStep4.title = "Safety and Near-Misses"
    instructionStep4.text = "The following questions are about safety and near-misses."
    steps += [instructionStep4]
    
    //Navigable Question 1
    let question6 = ORKQuestionStep(identifier: "question6", title: "Did you experience a narrow escape from injury at work today?", answer: ORKAnswerFormat.booleanAnswerFormat())
    steps += [question6]
    
    //Mini Form 3 about question 6
    let formStep3 = ORKFormStep(identifier: "miniForm3")
    formStep3.title = "Question 7"
    formStep3.text = nil
    var formItem3 = [ORKFormItem]()
    
    let formItem3Question1 = ORKFormItem(identifier: "formItem3Question1", text: "What time did this narrow escape happen?", answerFormat: ORKAnswerFormat.timeOfDayAnswerFormat())
    formItem3 += [formItem3Question1]
    
    let formItem3Question2 = ORKFormItem(identifier: "formItem3Question2", text: "Where did this narrow escape happen?", answerFormat: ORKAnswerFormat.textAnswerFormat())
    formItem3 += [formItem3Question2]
    
    let formItem3Question3 = ORKFormItem(identifier: "formItem3Question3", text: "What were you doing when this narrow escape happened?", answerFormat: ORKAnswerFormat.textAnswerFormat())
    formItem3 += [formItem3Question3]
    
    let question6TextChoice1 = ORKTextChoice(text: "No treatment", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question6TextChoice2 = ORKTextChoice(text: "First aid treatment only", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question6TextChoice3 = ORKTextChoice(text: "Non-emergency medical treatment", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question6TextChoice4 = ORKTextChoice(text: "Emergency medical treatment", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat6 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question6TextChoice1, question6TextChoice2, question6TextChoice3, question6TextChoice4])
    let formItem3Question4 = ORKFormItem(identifier: "formItem3Question4", text: "What treatment do you think you would have needed if you had not escaped?", answerFormat: choiceAnswerFormat6)
    formItem3 += [formItem3Question4]
    
    formStep3.formItems = formItem3
    steps += [formStep3]
    
    //Navigable Question 2
    let question7 = ORKQuestionStep(identifier: "question7", title: "Did you have an incident at work today that resulted in damage to a tool, equipment, vehicle, or the facility, but no injuries to you or others?", answer: ORKAnswerFormat.booleanAnswerFormat())
    steps += [question7]
    
    //Mini Form 4 about question 7
    let formStep4 = ORKFormStep(identifier: "miniForm4")
    formStep4.title = "Question 7"
    formStep4.text = nil
    var formItem4 = [ORKFormItem]()
    
    let formItem4Question1 = ORKFormItem(identifier: "formItem4Question1", text: "What time did this incident happen?", answerFormat: ORKAnswerFormat.timeOfDayAnswerFormat())
    formItem4 += [formItem4Question1]
    
    let formItem4Question2 = ORKFormItem(identifier: "formItem4Question2", text: "Where did this incident happen?", answerFormat: ORKAnswerFormat.textAnswerFormat())
    formItem4 += [formItem4Question2]
    
    let formItem4Question3 = ORKFormItem(identifier: "formItem4Question3", text: "What were you doing when this incident happened?", answerFormat: ORKAnswerFormat.textAnswerFormat())
    formItem4 += [formItem4Question3]
    
    let f4q4 = ORKFormItem(identifier: "f4q4", text: "Were you wearing hearing protection at the time the incident happened?", answerFormat: ORKAnswerFormat.booleanAnswerFormat())
    formItem4 += [f4q4]
    
    let question7TextChoice1 = ORKTextChoice(text: "Almost no damage, hardly noticeable", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question7TextChoice2 = ORKTextChoice(text: "Slight damage, but no repair required", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question7TextChoice3 = ORKTextChoice(text: "Some damage, repair required", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question7TextChoice4 = ORKTextChoice(text: "Major damage - large repair or replacement", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat7 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question7TextChoice1, question7TextChoice2, question7TextChoice3, question7TextChoice4])
    let formItem4Question4 = ORKFormItem(identifier: "formItem4Question4", text: "How much damage would you say the incident caused?", answerFormat: choiceAnswerFormat7)
    formItem4 += [formItem4Question4]
    
    formStep4.formItems = formItem4
    steps += [formStep4]
    
    //Navigable Question 3
    let question8 = ORKQuestionStep(identifier: "question8", title: "Were you injured at work today? Include any injury, even if you did not need first aid or medical treatment.", answer: ORKAnswerFormat.booleanAnswerFormat())
    steps += [question8]
    
    //Mini Form 5 about question 8
    let formStep5 = ORKFormStep(identifier: "miniForm5")
    formStep5.title = "Question 8"
    formStep5.text = nil
    var formItem5 = [ORKFormItem]()
    
    let formItem5Question1 = ORKFormItem(identifier: "formItem5Question1", text: "What time did this injury happen?", answerFormat: ORKAnswerFormat.timeOfDayAnswerFormat())
    formItem5 += [formItem5Question1]
    
    let f5q2 = ORKFormItem(identifier: "f5q2", text: "Where did this injury happen?", answerFormat: ORKAnswerFormat.textAnswerFormat())
    formItem5 += [f5q2]
    
    let formItem5Question2 = ORKFormItem(identifier: "formItem5Question2", text: "What type of injury did you get?", answerFormat: ORKAnswerFormat.textAnswerFormat())
    formItem5 += [formItem5Question2]
    
    let f5q4 = ORKFormItem(identifier: "f5q4", text: "Were you wearing hearing protection at the time the injury happened?", answerFormat: ORKAnswerFormat.booleanAnswerFormat())
    formItem5 += [f5q4]
    
    let formItem5Question3 = ORKFormItem(identifier: "formItem5Question3", text: "What body part was injured?", answerFormat: ORKAnswerFormat.textAnswerFormat())
    formItem5 += [formItem5Question3]
    
    let formItem5Question4 = ORKFormItem(identifier: "formItem4Question4", text: "What were you doing when this injury happened?", answerFormat: ORKAnswerFormat.textAnswerFormat())
    formItem4 += [formItem5Question4]
    
    let question8TextChoice1 = ORKTextChoice(text: "No treatment", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question8TextChoice2 = ORKTextChoice(text: "First aid treatment only", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question8TextChoice3 = ORKTextChoice(text: "Non-emergency medical treatment", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question8TextChoice4 = ORKTextChoice(text: "Emergency medical treatment", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat8 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question8TextChoice1, question8TextChoice2, question8TextChoice3, question8TextChoice4])
    let formItem5Question5 = ORKFormItem(identifier: "formItem3Question4", text: "What treatment did your injury require, if any?", answerFormat: choiceAnswerFormat8)
    formItem5 += [formItem5Question5]
    
    formStep5.formItems = formItem5
    steps += [formStep5]
    
    //Instruction of safety and near -misses
    let instructionStep5 = ORKInstructionStep(identifier: "IntroStep5")
    instructionStep5.title = "Sleep"
    instructionStep5.text = "The following questions are about sleep."
    steps += [instructionStep5]
    
    //Mini Form 6 about sleep
    let formStep6 = ORKFormStep(identifier: "miniForm6")
    formStep6.title = "Sleep"
    formStep6.text = nil
    var formItem6 = [ORKFormItem]()
    
    let scaleAnswerFormat9 = ORKAnswerFormat.scale(withMaximumValue: 9, minimumValue: 1, defaultValue: 5, step: 1, vertical: false, maximumValueDescription: nil, minimumValueDescription: nil)
    let formItem6Question1 = ORKFormItem(identifier: "formItem6Question1", text: "Circle the number from 1 to 9 that best reflects your current level of sleepiness:\n 1: Extremely alert\n 3: Alert\n 5: Neither alert nor sleepy\n 7: Sleepy - but no difficulty remaining awake\n 9: Extrmemly sleepy - fighting sleep", answerFormat: scaleAnswerFormat9)
    formItem6 += [formItem6Question1]
    
    let numericAnswerFormat10 = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "hours")
    numericAnswerFormat10.maximum = 24
    numericAnswerFormat10.minimum = 0

    let formItem6Question2 = ORKFormItem(identifier: "formItem6Question2", text: "How many hours did you sleep last night (not number of hours spent in bed)?", answerFormat: numericAnswerFormat10)
    formItem6 += [formItem6Question2]
    
    let scaleAnswerFormat11 = ORKAnswerFormat.scale(withMaximumValue: 10, minimumValue: 1, defaultValue: 5, step: 1, vertical: false, maximumValueDescription: "Best sleep possible", minimumValueDescription: "Worst sleep possible")
    let formItem6Question3 = ORKFormItem(identifier: "formItem6Question3", text: "How well did you sleep last night?", answerFormat: scaleAnswerFormat11)
    formItem6 += [formItem6Question3]
    
    formStep6.formItems = formItem6
    steps += [formStep6]
    
    //Instruction of stress
    let instructionStep6 = ORKInstructionStep(identifier: "IntroStep6")
    instructionStep6.title = "Stress"
    instructionStep6.text = "The following question is about stress."
    steps += [instructionStep6]
    
    //Scale Input Question
    let scaleAnswerFormat12 = ORKAnswerFormat.scale(withMaximumValue: 7, minimumValue: 1, defaultValue: 4, step: 1, vertical: false, maximumValueDescription: nil, minimumValueDescription: nil)
    let question12 = ORKQuestionStep(identifier: "question12", title: "Please rate the overall level of stress you experienced today?\n 1: Not very stressful\n 2: Very little stress\n 3: A little stress\n 4: Some stress\n 5: Much stress\n 6: Very much stress\n 7: Caused panic", answer: scaleAnswerFormat12)
    steps += [question12]
    
    //Instruction of demands
    let instructionStep7 = ORKInstructionStep(identifier: "IntroStep7")
    instructionStep7.title = "Demands"
    instructionStep7.text = "The following questions are about demands."
    steps += [instructionStep7]
    
    //Mini Form 7 about demands
    let formStep7 = ORKFormStep(identifier: "miniForm7", title: "Demands", text: nil)
    formStep7.text = "Please rate the demands that were placed on you at work today."
    var formItem7 = [ORKFormItem]()
    
    let scaleAnswerFormat13 = ORKAnswerFormat.scale(withMaximumValue: 9, minimumValue: 1, defaultValue: 5, step: 1, vertical: false, maximumValueDescription: "Very high", minimumValueDescription: "Very low")
    
    let formItem7Question1 = ORKFormItem(identifier: "formItem7Question1", text: "Mental demand - How mentally demanding was your work?", answerFormat: scaleAnswerFormat13)
    formItem7 += [formItem7Question1]
    
    let formItem7Question2 = ORKFormItem(identifier: "formItem7Question2", text: "Physical demand - How physically demanding was your work?", answerFormat: scaleAnswerFormat13)
    formItem7 += [formItem7Question2]
    
    let formItem7Question3 = ORKFormItem(identifier: "formItem7Question3", text: "Time demand - How hurried or rushed was the pace of your work?", answerFormat: scaleAnswerFormat13)
    formItem7 += [formItem7Question3]
    
    let formItem7Question4 = ORKFormItem(identifier: "formItem7Question4", text: "Effort - How hard did you have to work today to accomplish your level of performance?", answerFormat: scaleAnswerFormat13)
    formItem7 += [formItem7Question4]
    
    let formItem7Question5 = ORKFormItem(identifier: "formItem7Question5", text: "Frustration - How insecure, discouraged, irritated, stressed, and annoyed were you at work?", answerFormat: scaleAnswerFormat13)
    formItem7 += [formItem7Question5]
    
    formStep7.formItems = formItem7
    steps += [formStep7]
    
    //Summary
    let completionStep = ORKCompletionStep(identifier: "SummaryStep")
    completionStep.title = "Thank you!"
    completionStep.text = "You have completed the activity diary."
    steps += [completionStep]
    
    let task = ORKNavigableOrderedTask(identifier: "Daily", steps: steps)
    
    let question6Predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "question6"), expectedAnswer: false)
    let predicateNavigationRule1 = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(resultPredicate: question6Predicate, destinationStepIdentifier: "question7")])
    task.setNavigationRule(predicateNavigationRule1, forTriggerStepIdentifier: "question6")
    
    let question7Predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "question7"), expectedAnswer: false)
    let predicateNavigationRule2 = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(resultPredicate: question7Predicate, destinationStepIdentifier: "question8")])
    task.setNavigationRule(predicateNavigationRule2, forTriggerStepIdentifier: "question7")
    
    let question8Predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "question8"), expectedAnswer: false)
    let predicateNavigationRule3 = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(resultPredicate: question8Predicate, destinationStepIdentifier: "IntroStep5")])
    task.setNavigationRule(predicateNavigationRule3, forTriggerStepIdentifier: "question8")
    
    return task
}
