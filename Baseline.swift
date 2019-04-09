//
//  Baseline.swift
//  DailyReport
//
//  Created by Darwin Lee on 2018/11/14.
//  Copyright © 2018 Darwin Lee. All rights reserved.
//

import Foundation
import ResearchKit

public var Baseline: ORKOrderedTask {
    var steps = [ORKStep]()
    //Introduction
    let instructionStep1 = ORKInstructionStep(identifier: "IntroStep1")
    instructionStep1.title = "Baseline Survey"
    instructionStep1.text = "Baseline Noise, Hearing Loss, Hearing Protection, and Injury Survey"
    steps += [instructionStep1]
    
    //Mini Form 1 to ask user's basic information
    let formStep1 = ORKFormStep(identifier: "formStep1", title: "Basic Information", text: nil)
    var formItem1 = [ORKFormItem]()
    let formItem1Question1 = ORKFormItem(identifier: "formItem1Question1", text: "Subject ID", answerFormat: ORKAnswerFormat.integerAnswerFormat(withUnit: nil))
    formItem1 += [formItem1Question1]
    
    let formItem1Question2 = ORKFormItem(identifier: "formItem1Question2", text: "Name", answerFormat: ORKAnswerFormat.textAnswerFormat(withMaximumLength: 30))
    formItem1 += [formItem1Question2]
    
    let formItem1Question3 = ORKFormItem(identifier: "formItem1Question3", text: "Date", answerFormat: ORKAnswerFormat.dateAnswerFormat())
    formItem1 += [formItem1Question3]
    
    formStep1.formItems = formItem1
    steps += [formStep1]
    
    //Introduction of p1
    let instructionStep2 = ORKInstructionStep(identifier: "IntroStep2")
    instructionStep2.title = "Part 1"
    instructionStep2.text = "The following questions are about you and your employment."
    steps += [instructionStep2]
    
    //Mini Form 2 for part1
    let formStep2 = ORKFormStep(identifier: "formStep2", title: "You and Your Employment", text: nil)
    var formItem2 = [ORKFormItem]()
    
    let formItem2Question5 = ORKFormItem(identifier: "formItem2Question5", text: "What is your current job title?", answerFormat: ORKAnswerFormat.textAnswerFormat(withMaximumLength: 100))
    formItem2 += [formItem2Question5]
    
    let numericAnswerFormat2 = ORKAnswerFormat.integerAnswerFormat(withUnit: "years")
    numericAnswerFormat2.minimum = 0

    let formItem2Question6 = ORKFormItem(identifier: "formItem2Question6", text: "How long have you worked in your current job for your current employer?", answerFormat: numericAnswerFormat2)
    formItem2 += [formItem2Question6]
    
    let numericAnswerFormat3 = ORKAnswerFormat.integerAnswerFormat(withUnit: "hours/week")
    numericAnswerFormat3.minimum = 0
    numericAnswerFormat3.maximum = 168
    let formItem2Question7 = ORKFormItem(identifier: "formItem2Question7", text: "How many hours per week do you usually work in your current job?", answerFormat: numericAnswerFormat3)
    formItem2 += [formItem2Question7]

    let formItem2Question8 = ORKFormItem(identifier: "formItem2Question8", text: "What is the total amount of time you have worked in this industry?", answerFormat: numericAnswerFormat2)
    formItem2 += [formItem2Question8]
    
    formStep2.formItems = formItem2
    steps += [formStep2]
    
    //instruction of part2
    let instructionStep3 = ORKInstructionStep(identifier: "IntroStep3")
    instructionStep3.title = "Part 2"
    instructionStep3.text = "The following questions are about health and fitness"
    steps += [instructionStep3]
    
    //question 5
    let question5TextChoice1 = ORKTextChoice(text: "Excellent", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question5TextChoice2 = ORKTextChoice(text: "Very Good", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question5TextChoice3 = ORKTextChoice(text: "Good", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question5TextChoice4 = ORKTextChoice(text: "Fair", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question5TextChoice5 = ORKTextChoice(text: "Poor", detailText: nil, value: 5 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat5 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question5TextChoice1, question5TextChoice2, question5TextChoice3, question5TextChoice4, question5TextChoice5])
    let question5 = ORKQuestionStep(identifier: "question5", title: "In general, would you say your health is", answer: choiceAnswerFormat5)
    steps += [question5]
    
    //Mini Form 3
    let formStep3 = ORKFormStep(identifier: "formStep3", title: "Part2", text: "The following questions are about activities you might do during a typical day. Does your health now limit you in these activities? If so, how much?")
    var formItem3 = [ORKFormItem]()
    
    let question6TextChoice1 = ORKTextChoice(text: "YES, limited a lot", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question6TextChoice2 = ORKTextChoice(text: "YES, limited a little", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question6TextChoice3 = ORKTextChoice(text: "NO, not limited at all", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat6 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question6TextChoice1, question6TextChoice2, question6TextChoice3])
    let formItem3Question1 = ORKFormItem(identifier: "formItem3Question1", text: "Moderate activities such as moving a table, pushing a vacuum cleaner, bowling, or playing golf.", answerFormat: choiceAnswerFormat6)
    formItem3 += [formItem3Question1]
    let formItem3Question2 = ORKFormItem(identifier: "formItem3Question2", text: "Climbing several flights of stairs.", answerFormat: choiceAnswerFormat6)
    formItem3 += [formItem3Question2]
    formStep3.formItems = formItem3
    steps += [formStep3]
    
    //Mini Form 4
    let formStep4 = ORKFormStep(identifier: "formStep4", title: "Part2", text: "During the past 4 weeks, have you had any of the following problems with your work or other regular daily activities as a result of your physical health?")
    var formItem4 = [ORKFormItem]()
    let formItem4Question1 = ORKFormItem(identifier: "formItem4Question1", text: "Accomplished less than you would like.", answerFormat: ORKAnswerFormat.booleanAnswerFormat())
    formItem4 += [formItem4Question1]
    
    let formItem4Question2 = ORKFormItem(identifier: "formItem4Question2", text: "Were limited in the kind of work or other activities.", answerFormat: ORKAnswerFormat.booleanAnswerFormat())
    formItem4 += [formItem4Question2]
    formStep4.formItems = formItem4
    steps += [formStep4]
    
    //Mini Form 5
    let formStep5 = ORKFormStep(identifier: "formStep5", title: "Part2", text: "During the past 4 weeks, have you had any of the following problems with your work or other regular daily activities as a result of your emotional problems (such as feeling depressed or anxious)?")
    var formItem5 = [ORKFormItem]()
    let formItem5Question1 = ORKFormItem(identifier: "formItem5Question1", text: "Accomplished less than you would like.", answerFormat: ORKAnswerFormat.booleanAnswerFormat())
    formItem5 += [formItem5Question1]
    
    let formItem5Question2 = ORKFormItem(identifier: "formItem5Question2", text: "Were limited in the kind of work or other activities.", answerFormat: ORKAnswerFormat.booleanAnswerFormat())
    formItem5 += [formItem5Question2]
    formStep5.formItems = formItem5
    steps += [formStep5]
    
    //question 12
    let question12TextChoice1 = ORKTextChoice(text: "Not at all", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question12TextChoice2 = ORKTextChoice(text: "A bit", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question12TextChoice3 = ORKTextChoice(text: "Moderately", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question12TextChoice4 = ORKTextChoice(text: "Quite a bit", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question12TextChoice5 = ORKTextChoice(text: "Extremely", detailText: nil, value: 5 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat12 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question12TextChoice1, question12TextChoice2, question12TextChoice3, question12TextChoice4, question12TextChoice5])
    let question12 = ORKQuestionStep(identifier: "question12", title: "During the past 4 weeks, how much did pain interfere with your normal work (including work outside the home and housework)?", answer: choiceAnswerFormat12)
    steps += [question12]
    
    //Mini Form 6
    let formStep6 = ORKFormStep(identifier: "formStep6", title: "Part 2", text: "These questions are about how you have been feeling during the past 4 weeks. \n For each question, please give the one answer that comes closest to the way you have been feeling. \n How much of the time during the past 4 weeks...")
    var formItem6 = [ORKFormItem]()
    let question13TextChoice1 = ORKTextChoice(text: "All of the time", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question13TextChoice2 = ORKTextChoice(text: "Most of the time", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question13TextChoice3 = ORKTextChoice(text: "A good bit of the time", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question13TextChoice4 = ORKTextChoice(text: "Some of the time", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question13TextChoice5 = ORKTextChoice(text: "A little of the time", detailText: nil, value: 5 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question13TextChoice6 = ORKTextChoice(text: "None of the time", detailText: nil, value: 6 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat13 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question13TextChoice1, question13TextChoice2, question13TextChoice3, question13TextChoice4, question13TextChoice5, question13TextChoice6])
    let formItem6Question1 = ORKFormItem(identifier: "formItem6Question1", text: "Have you felt calm and peaceful?", answerFormat: choiceAnswerFormat13)
    formItem6 += [formItem6Question1]
    
    let formItem6Question2 = ORKFormItem(identifier: "formItem6Question2", text: "Did you have a lot of energy?", answerFormat: choiceAnswerFormat13)
    formItem6 += [formItem6Question2]
    
    let formItem6Question3 = ORKFormItem(identifier: "formItem6Question3", text: "Have you felt down-hearted and blue?", answerFormat: choiceAnswerFormat13)
    formItem6 += [formItem6Question3]
    
    formStep6.formItems = formItem6
    steps += [formStep6]
    
    //question 16
    let question16 = ORKQuestionStep(identifier: "question16", title: "During the past 4 weeks, how much of the time has your physical health or emotional problems interfered with your social activities (like visiting friends, relatives, etc.)?", answer: choiceAnswerFormat13)
    steps += [question16]
    
    //question 17
    let question17 = ORKQuestionStep(identifier: "question17", title: "How would you describe your overall fitness?", answer: choiceAnswerFormat5)
    steps += [question17]
    
    //Introduction for Part 3
    let instructionStep4 = ORKInstructionStep(identifier: "IntroStep4")
    instructionStep4.title = "Part 3"
    instructionStep4.text = "The following questions are about noise exposure and hearing."
    steps += [instructionStep4]
    
    //Mini Form 7
    let formStep7 = ORKFormStep(identifier: "formStep7", title: "Noise Exposure and Hearing", text: nil)
    var formItem7 = [ORKFormItem]()
    let choiceAnswerFormat18 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question13TextChoice6, question13TextChoice5, question13TextChoice4, question13TextChoice2, question13TextChoice1])
    let formItem7Question1 = ORKFormItem(identifier: "formItem7Question1", text: "How often are you exposed to high noise at work? \"High noise\" means loud enough that a person has to raise their voice to talk to someone 3 ft away.", answerFormat: choiceAnswerFormat18)
    formItem7 += [formItem7Question1]
    
    let numericAnswerFormat1 = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "years")
    numericAnswerFormat1.maximum = 100
    numericAnswerFormat1.minimum = 0
    
    let formItem7Question2 = ORKFormItem(identifier: "formItem7Quesition2", text: "For how many years have you worked in high noise?", answerFormat: numericAnswerFormat1)
    formItem7 += [formItem7Question2]
    
    let question20TextChoice1 = ORKTextChoice(text: "Good", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question20TextChoice2 = ORKTextChoice(text: "A little trouble", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question20TextChoice3 = ORKTextChoice(text: "A lot of trouble", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question20TextChoice4 = ORKTextChoice(text: "Deaf or nearly deaf", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat20 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question20TextChoice1, question20TextChoice2, question20TextChoice3, question20TextChoice4])
    let formItem7Question3 = ORKFormItem(identifier: "formItem7Question3", text: "How would you rate your hearing?", answerFormat: choiceAnswerFormat20)
    formItem7 += [formItem7Question3]
    
    let formItem7Question4 = ORKFormItem(identifier: "formItem7Question4", text: "Do you have any difficulties with your hearing?", answerFormat: ORKAnswerFormat.booleanAnswerFormat())
    formItem7 += [formItem7Question4]
    
    formStep7.formItems = formItem7
    steps += [formStep7]
    
    //question22
    let question22 = ORKQuestionStep(identifier: "question22", title: "Have you ever seen a doctor about problems with your ears?", answer: ORKAnswerFormat.booleanAnswerFormat())
    steps += [question22]
    
    //explaination for question22
    let question22ex = ORKQuestionStep(identifier: "question22ex")
    question22ex.title = "Part 3"
    question22ex.question = "If yes, please explain."
    question22ex.answerFormat = ORKAnswerFormat.textAnswerFormat()
    steps += [question22ex]
    
    //Mini Form 8
    let formStep8 = ORKFormStep(identifier: "formStep8", title: "Part 3 cont'd", text: nil)
    var formItem8 = [ORKFormItem]()
    
    let formItem8Question1 = ORKFormItem(identifier: "formItem8Question1", text: "Have you ever been told by a doctor that you had a hearing loss?", answerFormat: ORKAnswerFormat.booleanAnswerFormat())
    formItem8 += [formItem8Question1]
    
    let question24TextChoice1 = ORKTextChoice(text: "Yes", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question24TextChoice2 = ORKTextChoice(text: "No", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question24TextChoice3 = ORKTextChoice(text: "Don't Know", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat24 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question24TextChoice1, question24TextChoice2, question24TextChoice3])
    let formItem8Question2 = ORKFormItem(identifier: "formItem8Question2", text: "In the past year have you had buzzing, ringing, or noise in your ears?", answerFormat: choiceAnswerFormat24)
    formItem8 += [formItem8Question2]
    
    let question25TextChoice1 = ORKTextChoice(text: "Mild", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question25TextChoice2 = ORKTextChoice(text: "Moderate", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question25TextChoice3 = ORKTextChoice(text: "Severe", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question25TextChoice4 = ORKTextChoice(text: "Don't Know", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat25 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question25TextChoice1, question25TextChoice2, question25TextChoice3, question25TextChoice4])
    let formItem8Question3 = ORKFormItem(identifier: "formItem8Question3", text: "How severe is this noise in your ears in its worst form?", answerFormat: choiceAnswerFormat25)
    formItem8 += [formItem8Question3]
    
    let formItem8Question4 = ORKFormItem(identifier: "formItem8Quesion4", text: "Does this noise cause you to have problems getting to sleep?", answerFormat: choiceAnswerFormat24)
    formItem8 += [formItem8Question4]
    
    let formItem8Question5 = ORKFormItem(identifier: "formItem8Question5", text: "How often do you have this noise in your ears after spending time in high noise at work?", answerFormat: choiceAnswerFormat13)
    formItem8 += [formItem8Question5]
    
    formStep8.formItems = formItem8
    steps += [formStep8]
    
    //Introduction of part 4
    let instructionStep5 = ORKInstructionStep(identifier: "IntroStep5")
    instructionStep5.title = "Part 4"
    instructionStep5.text = "The following questions are about hearing protection."
    steps += [instructionStep5]
    
    //question28
    let numAnsFormat2 = ORKAnswerFormat.integerAnswerFormat(withUnit: "% of time in high noise")
    numAnsFormat2.maximum = 100
    numAnsFormat2.minimum = 0
    
    let question28 = ORKQuestionStep(identifier: "question28", title: "How often do you usually use ear plugs or ear muffs when you are exposed to high noise at work? \"High noise\" means loud enough that person has to raise their voice to talk to someone about 3 feet away.", answer: numAnsFormat2)
    steps += [question28]
    
    let q29t1 = ORKTextChoice(text: "Foam Earplugs", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let q29t2 = ORKTextChoice(text: "Custom Earplugs", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let q29t3 = ORKTextChoice(text: "Pre-molded Earplugs", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let q29t4 = ORKTextChoice(text: "Ear Muffs", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let q29t5 = ORKTextChoice(text: "Double protection (earplugs and earmuffs)", detailText: nil, value: 5 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let q29t6 = ORKTextChoice(text: "None", detailText: nil, value: 6 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    
    let ansFormat29 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.multipleChoice, textChoices: [q29t1, q29t2, q29t3, q29t4, q29t5, q29t6])
    let q29 = ORKQuestionStep(identifier: "q29", title: "What type of hearing protection do you primarily use at work? (Check all that apply)", answer: ansFormat29)
    steps += [q29]
    
    //question29
    let question29TextChoice1 = ORKTextChoice(text: "a", detailText: "You are not clear as to when you should wear them", value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question29TextChoice2 = ORKTextChoice(text: "b", detailText: "You can't hear properly to do your work (e.g., warning signals, machine performance)", value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question29TextChoice3 = ORKTextChoice(text: "c", detailText: "You can't communicate properly with other workers", value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question29TextChoice4 = ORKTextChoice(text: "d", detailText: "They are uncomfortable", value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question29TextChoice5 = ORKTextChoice(text: "e", detailText: "They get in the way of other safety equipment", value: 5 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question29TextChoice6 = ORKTextChoice(text: "f", detailText: "You are used to noise at work", value: 6 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question29TextChoice7 = ORKTextChoice(text: "g", detailText: "Your co-workers often don't wear them", value: 7 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question29TextChoice8 = ORKTextChoice(text: "h", detailText: "Your co-workers find it funny when you wear them", value: 8 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question29TextChoice9 = ORKTextChoice(text: "i", detailText: "Someone else does something noisy without warning", value: 9 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat29 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.multipleChoice, textChoices: [question29TextChoice1, question29TextChoice2, question29TextChoice3, question29TextChoice4, question29TextChoice5, question29TextChoice6, question29TextChoice7, question29TextChoice8, question29TextChoice9])
    let question29 = ORKQuestionStep(identifier: "question29", title: "At times when you don't wear earmuffs or earplugs when exposed to noise, it is because: (please check all that apply)", answer: choiceAnswerFormat29)
    steps += [question29]
    
    //other reason for question29
    let question29ex = ORKQuestionStep(identifier: "question29ex", title: "Please include other reasons not listed above. If no, please skip.", answer: ORKAnswerFormat.textAnswerFormat())
    steps += [question29ex]
    
    //introduction for part 5
    let instructionStep6 = ORKInstructionStep(identifier: "IntroStep6")
    instructionStep6.title = "Part 5"
    instructionStep6.text = "The following questions are about stress."
    steps += [instructionStep6]
    
    //Mini Form 9
    let formStep9 = ORKFormStep(identifier: "formStep9", title: "Stress", text: nil)
    var formItem9 = [ORKFormItem]()
    
    let part5TextChoice1 = ORKTextChoice(text: "Never", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let part5TextChoice2 = ORKTextChoice(text: "Almost never", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let part5TextChoice3 = ORKTextChoice(text: "Sometimes", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let part5TextChoice4 = ORKTextChoice(text: "Fairly often", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let part5TextChoice5 = ORKTextChoice(text: "Very often", detailText: nil, value: 5 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormatPart5 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [part5TextChoice1, part5TextChoice2, part5TextChoice3, part5TextChoice4, part5TextChoice5])
    
    let formItem9Question1 = ORKFormItem(identifier: "formItem9Question1", text: "In the last month, how often have you been upset because of something that happened unexpectedly?", answerFormat: choiceAnswerFormatPart5)
    formItem9 += [formItem9Question1]
    
    let formItem9Question2 = ORKFormItem(identifier: "formItem9Question2", text: "In the last month, how often have you felt that you were unable to control the important things in your life?", answerFormat: choiceAnswerFormatPart5)
    formItem9 += [formItem9Question2]
    
    let formItem9Question3 = ORKFormItem(identifier: "formItem9Question3", text: "In the last month, how often have you felt nervous and \"stressed\"?", answerFormat: choiceAnswerFormatPart5)
    formItem9 += [formItem9Question3]
    
    let formItem9Question4 = ORKFormItem(identifier: "formItem9Question4", text: "In the last month, how often have you felt confident about your ability to handle your personal problems?", answerFormat: choiceAnswerFormatPart5)
    formItem9 += [formItem9Question4]
    
    let formItem9Question5 = ORKFormItem(identifier: "formItem9Question5", text: "In the last month, how often have you felt that things were going your way?", answerFormat: choiceAnswerFormatPart5)
    formItem9 += [formItem9Question5]
    
    let formItem9Question6 = ORKFormItem(identifier: "formItem9Question6", text: "In the last month, how often have you found that you could not cope with all the things that you had to do?", answerFormat: choiceAnswerFormatPart5)
    formItem9 += [formItem9Question6]
    
    let formItem9Question7 = ORKFormItem(identifier: "formItem9Question7", text: "In the last month, how often have you been able to control irritations in your life?", answerFormat: choiceAnswerFormatPart5)
    formItem9 += [formItem9Question7]
    
    let formItem9Question8 = ORKFormItem(identifier: "formItem9Question8", text: "In the last month, how often have you felt that you were on top of things?", answerFormat: choiceAnswerFormatPart5)
    formItem9 += [formItem9Question8]
    
    let formItem9Question9 = ORKFormItem(identifier: "formItem9Question9", text: "In the last month, how often have you been angered because of things that happened that were outside of your control?", answerFormat: choiceAnswerFormatPart5)
    formItem9 += [formItem9Question9]
    
    let formItem9Question10 = ORKFormItem(identifier: "formItem9Question10", text: "In the last month, how often have you felt difficulties were piling up so high that you could not overcome them?", answerFormat: choiceAnswerFormatPart5)
    formItem9 += [formItem9Question10]
    
    formStep9.formItems = formItem9
    steps += [formStep9]
    
    //Instruction of part 6
    let instructionStep7 = ORKInstructionStep(identifier: "IntroStep7")
    instructionStep7.title = "Part 6"
    instructionStep7.text = "The following questions are about injuries."
    steps += [instructionStep7]
    
    //Question 40
    let question40 = ORKQuestionStep(identifier: "question40", title: "In the last month have you had any injuries, health conditions, or medical treatments that affected your ability to balance or walk?", answer: ORKAnswerFormat.booleanAnswerFormat())
    steps += [question40]
    
    //Question40 other reasons
    let question40ex = ORKQuestionStep(identifier: "question40ex", title: "If yes, please explain.", answer: ORKAnswerFormat.textAnswerFormat())
    steps += [question40ex]
    
    //question 41
    let question41 = ORKQuestionStep(identifier: "question41", title: "In the last month, have you had any injuries, health conditions, or medical treatments that affected your ability to do your normal work?", answer: ORKAnswerFormat.booleanAnswerFormat())
    steps += [question41]
    
    //question 41 explaination
    let question41ex = ORKQuestionStep(identifier: "question41ex", title: "If yes, please explain.", answer: ORKAnswerFormat.textAnswerFormat())
    steps += [question41ex]
    
    //question 42
    let numericAnswerFormat42 = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "times")
    numericAnswerFormat42.minimum = 0
    let question42 = ORKQuestionStep(identifier: "question42", title: "Over your lifetime, about how many times have you been seriously injured at work? Serious injuries require first aid treatment, treatment in a medical clinic or office, or treatment at a hospital.", answer: numericAnswerFormat42)
    steps += [question42]
    
    //question 43
    let question43 = ORKQuestionStep(identifier: "question43", title: "In the last year, about how many total times have you been injured at work? This includes all injuries, even minor injuries that did not require first aid or other treatment.", answer: numericAnswerFormat42)
    steps += [question43]
    
    //question 44
    let question44 = ORKQuestionStep(identifier: "question44", title: "In the last year, about how many times have you been seriously injured at work? Serious injuries require treatment in a medical clinic or office, or treatment at a hospital.", answer: numericAnswerFormat42)
    steps += [question44]
    
    //question 45
    let question45 = ORKQuestionStep(identifier: "question45", title: "In the last year, for your worst work-related injury, what were you doing at the time of injury?", answer: ORKAnswerFormat.booleanAnswerFormat(withYesString: "Got injured in last year, click to specify", noString: "Not injured in last year"))
    steps += [question45]
    
    //question 45 explanation
    let question45ex = ORKQuestionStep(identifier: "question45ex", title: "If yes, please give as much detail as possible.", answer: ORKAnswerFormat.textAnswerFormat())
    steps += [question45ex]
    
    //question 46
    let question46TextChoice1 = ORKTextChoice(text: "No medical care", value: 1 as NSCoding & NSCopying & NSObjectProtocol)
    let question46TextChoice2 = ORKTextChoice(text: "First aid at work", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
    let question46TextChoice3 = ORKTextChoice(text: "Treatment in a medical clinic or office", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    let question46TextChoice4 = ORKTextChoice(text: "Treatment at hospital", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
    let question46TextChoice5 = ORKTextChoice(text: "Other", value: 5 as NSCoding & NSCopying & NSObjectProtocol)
    let choiceAnswerFormat46 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question46TextChoice1, question46TextChoice2, question46TextChoice3, question46TextChoice4, question46TextChoice5])
    let question46 = ORKQuestionStep(identifier: "question46", title: "In the last year, for your worst work-related injury, what type of medical care did you receive?", answer: choiceAnswerFormat46)
    steps += [question46]
    
    //question 46 explaination
    let question46ex = ORKQuestionStep(identifier: "question46ex", title: "If you choose other type, please specify.", answer: ORKAnswerFormat.textAnswerFormat())
    steps += [question46ex]
    
    //question 47
    let question47TextChoice1 = ORKTextChoice(text: "Did not miss any work and worked regular job.", value: 1 as NSCoding & NSCopying & NSObjectProtocol)
    let question47TextChoice2 = ORKTextChoice(text: "Did not miss any work but could not do regular job", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
    let question47TextChoice3 = ORKTextChoice(text: "Missed work for at least one day", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    let choiceAnswerFormat47 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question47TextChoice1, question47TextChoice2, question47TextChoice3])
    let question47 = ORKQuestionStep(identifier: "question47", title: "In the last year, for your worst work-related injury, how much work did you miss?", answer: choiceAnswerFormat47)
    steps += [question47]
    
    //question 47 explaination
    let numericAnswerFormat47 = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "days")
    numericAnswerFormat42.minimum = 0
    let question47ex = ORKQuestionStep(identifier: "question47ex", title: "If you missed work for at least one day, how many days do you missed exactly?", answer: numericAnswerFormat47)
    steps += [question47ex]
    
    //question 48
    let question48TextChoice1 = ORKTextChoice(text: "Head", value: 1 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice2 = ORKTextChoice(text: "Eyes", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice3 = ORKTextChoice(text: "Face", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice4 = ORKTextChoice(text: "Mouth/teeth", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice5 = ORKTextChoice(text: "Neck", value: 5 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice6 = ORKTextChoice(text: "Shoulder", value: 6 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice7 = ORKTextChoice(text: "Arm", value: 7 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice8 = ORKTextChoice(text: "Hand", value: 8 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice9 = ORKTextChoice(text: "Chest", value: 9 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice10 = ORKTextChoice(text: "Spine", value: 10 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice11 = ORKTextChoice(text: "Waist", value: 11 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice12 = ORKTextChoice(text: "Hip", value: 12 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice13 = ORKTextChoice(text: "Thigh", value: 13 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice14 = ORKTextChoice(text: "Knee", value: 14 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice15 = ORKTextChoice(text: "Lower leg", value: 15 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice16 = ORKTextChoice(text: "Ankle", value: 16 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice17 = ORKTextChoice(text: "Foot", value: 17 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice18 = ORKTextChoice(text: "Abdomen", value: 18 as NSCoding & NSCopying & NSObjectProtocol)
    let question48TextChoice19 = ORKTextChoice(text: "Other", value: 19 as NSCoding & NSCopying & NSObjectProtocol)
    let choiceAnswerFormat48 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.multipleChoice, textChoices: [question48TextChoice1, question48TextChoice2, question48TextChoice3, question48TextChoice4, question48TextChoice5, question48TextChoice6, question48TextChoice7, question48TextChoice8, question48TextChoice9, question48TextChoice10, question48TextChoice11, question48TextChoice12, question48TextChoice13, question48TextChoice14, question48TextChoice15, question48TextChoice16, question48TextChoice17, question48TextChoice18, question48TextChoice19])
    let question48 = ORKQuestionStep(identifier: "question48", title: "In the last year, for your worst work-related injury, what body part or parts were injured? Please check all that apply.", answer: choiceAnswerFormat48)
    steps += [question48]
    
    //question 48 explanation
    let question48ex = ORKQuestionStep(identifier: "question48ex", title: "If you choose other, please specify.", answer: ORKAnswerFormat.textAnswerFormat())
    steps += [question48ex]
    
    //question 49
    let question49TextChoice1 = ORKTextChoice(text: "Contusions/abrasions", value: 1 as NSCoding & NSCopying & NSObjectProtocol)
    let question49TextChoice2 = ORKTextChoice(text: "Burns/scalds", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
    let question49TextChoice3 = ORKTextChoice(text: "Concussions", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    let question49TextChoice4 = ORKTextChoice(text: "Cuts/lacerations", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
    let question49TextChoice5 = ORKTextChoice(text: "Punctured wounds", value: 5 as NSCoding & NSCopying & NSObjectProtocol)
    let question49TextChoice6 = ORKTextChoice(text: "Amputations", value: 6 as NSCoding & NSCopying & NSObjectProtocol)
    let question49TextChoice7 = ORKTextChoice(text: "Dislocations", value: 7 as NSCoding & NSCopying & NSObjectProtocol)
    let question49TextChoice8 = ORKTextChoice(text: "Fractures (simple/compound)", value: 8 as NSCoding & NSCopying & NSObjectProtocol)
    let question49TextChoice9 = ORKTextChoice(text: "Sprains/strains", value: 9 as NSCoding & NSCopying & NSObjectProtocol)
    let question49TextChoice10 = ORKTextChoice(text: "Asphyxiation", value: 10 as NSCoding & NSCopying & NSObjectProtocol)
    let question49TextChoice11 = ORKTextChoice(text: "Internal bleeding", value: 11 as NSCoding & NSCopying & NSObjectProtocol)
    let question49TextChoice12 = ORKTextChoice(text: "Electric shock", value: 12 as NSCoding & NSCopying & NSObjectProtocol)
    let question49TextChoice13 = ORKTextChoice(text: "Other", value: 13 as NSCoding & NSCopying & NSObjectProtocol)
    let choiceAnswerFormat49 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.multipleChoice, textChoices: [question49TextChoice1, question49TextChoice2, question49TextChoice3, question49TextChoice4, question49TextChoice5, question49TextChoice6, question49TextChoice7, question49TextChoice8, question49TextChoice9, question49TextChoice10, question49TextChoice11, question49TextChoice12, question49TextChoice13])
    let question49 = ORKQuestionStep(identifier: "question49", title: "In the last year, for your worst work-related injury, what type of injury did you sustain? Please check all that apply.", answer: choiceAnswerFormat49)
    steps += [question49]
    
    //question 49 explaination
    let question49ex = ORKQuestionStep(identifier: "question49ex", title: "If you choose other, please specify.", answer: ORKAnswerFormat.textAnswerFormat())
    steps += [question49ex]
    
    //question 50
    let question50TextChoice1 = ORKTextChoice(text: "Never or almost never", value: 1 as NSCoding & NSCopying & NSObjectProtocol)
    let question50TextChoice2 = ORKTextChoice(text: "Less than half of your work days", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
    let question50TextChoice3 = ORKTextChoice(text: "About half of your work days", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    let question50TextChoice4 = ORKTextChoice(text: "More than half of your work days", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
    let question50TextChoice5 = ORKTextChoice(text: "Every work day or almost every work day", value: 5 as NSCoding & NSCopying & NSObjectProtocol)
    let question50TextChoice6 = ORKTextChoice(text: "Don't know", value: 6 as NSCoding & NSCopying & NSObjectProtocol)
    let choiceAnswerFormat50 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question50TextChoice1, question50TextChoice2, question50TextChoice3, question50TextChoice4, question50TextChoice5])
    let question50 = ORKQuestionStep(identifier: "question50", title: "In the last year, how often do you think were you almost in an accident or almost injured at work?", answer: choiceAnswerFormat50)
    steps += [question50]
    
    //question 51
    let question51 = ORKQuestionStep(identifier: "question51", title: "In the last year, how many times were you almost in an accident that could have resulted in a serious injury?", answer: numericAnswerFormat42)
    steps += [question51]
    
    //question 52
    let question52 = ORKQuestionStep(identifier: "question52", title: "In the last year, how many times were you involved in an incident that resulted in damage or breakage to a tool, equipment, vehicle, or facility, but no injuries to you or others?", answer: numericAnswerFormat42)
    steps += [question52]
    
    //Instruction of part 7
    let instructionStep8 = ORKInstructionStep(identifier: "IntroStep8")
    instructionStep8.title = "Part 7"
    instructionStep8.text = "The following questions are about safety."
    steps += [instructionStep8]
    
    //question 53
    let question53 = ORKQuestionStep(identifier: "question53", title: "Please read the two statements carefully and choose the one which is most true for you. Please choose either a or b.", answer: ORKAnswerFormat.booleanAnswerFormat(withYesString: "Safety is at the forefront of my mind when working", noString: "Safety is important, but other factors sometimes limit my ability to work safely"))
    steps += [question53]
    
    //question 54
    let question54 = ORKQuestionStep(identifier: "quesiton54", title: "Please read the two statements carefully and choose the one which is most true for you. Please choose either a or b.", answer: ORKAnswerFormat.booleanAnswerFormat(withYesString: "Injuries occur at work because people don't take enough interest in safety", noString: "Injuries at work will always occur, no matter how hard people try to prevent them"))
    steps += [question54]
    
    //Mini form 10 about question55-64
    let formStep10 = ORKFormStep(identifier: "miniForm10")
    formStep10.title = "Part 7"
    formStep10.text = "Think about your current job. Do you agree or disagree that each of the following words or phrases describes your job? Choose one answer for each statement."
    
    var formItem10 = [ORKFormItem]()
    let question55TextChoice1 = ORKTextChoice(text: "1", detailText: "Strongly disagree", value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question55TextChoice2 = ORKTextChoice(text: "2", detailText: "Disagree", value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question55TextChoice3 = ORKTextChoice(text: "3", detailText: "Neither agree nor disagree", value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question55TextChoice4 = ORKTextChoice(text: "4", detailText: "Agree", value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question55TextChoice5 = ORKTextChoice(text: "5", detailText: "Strongly agree", value: 5 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat55 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question55TextChoice1, question55TextChoice2, question55TextChoice3, question55TextChoice4, question55TextChoice5])
    
    let formItem10Question1 = ORKFormItem(identifier: "formItem10Question1", text: "Dangerous", answerFormat: choiceAnswerFormat55)
    formItem10 += [formItem10Question1]
    let formItem10Question2 = ORKFormItem(identifier: "formItem10Question2", text: "Safe", answerFormat: choiceAnswerFormat55)
    formItem10 += [formItem10Question2]
    let formItem10Question3 = ORKFormItem(identifier: "formItem10Question3", text: "Hazardous", answerFormat: choiceAnswerFormat55)
    formItem10 += [formItem10Question3]
    let formItem10Question4 = ORKFormItem(identifier: "formItem10Question4", text: "Risky", answerFormat: choiceAnswerFormat55)
    formItem10 += [formItem10Question4]
    let formItem10Question5 = ORKFormItem(identifier: "formItem10Question5", text: "Unhealthy", answerFormat: choiceAnswerFormat55)
    formItem10 += [formItem10Question5]
    let formItem10Question6 = ORKFormItem(identifier: "formItem10Question6", text: "Could get hurt easily", answerFormat: choiceAnswerFormat55)
    formItem10 += [formItem10Question6]
    let formItem10Question7 = ORKFormItem(identifier: "formItem10Question7", text: "Unsafe", answerFormat: choiceAnswerFormat55)
    formItem10 += [formItem10Question7]
    let formItem10Question8 = ORKFormItem(identifier: "formItem10Question8", text: "Fear for health", answerFormat: choiceAnswerFormat55)
    formItem10 += [formItem10Question8]
    let formItem10Question9 = ORKFormItem(identifier: "formItem10Question9", text: "Chance of death", answerFormat: choiceAnswerFormat55)
    formItem10 += [formItem10Question9]
    let formItem10Question10 = ORKFormItem(identifier: "formItem10Question10", text: "Scary", answerFormat: choiceAnswerFormat55)
    formItem10 += [formItem10Question10]
    
    formStep10.formItems = formItem10
    steps += [formStep10]
    
    //Instruction for part 8
    let instructionStep9 = ORKInstructionStep(identifier: "IntroStep9")
    instructionStep9.title = "Part 8"
    instructionStep9.text = "The following questions are about sleepiness."
    steps += [instructionStep9]
    
    //Mini form 11
    let formStep11 = ORKFormStep(identifier: "miniForm11")
    formStep11.title = "Part 8"
    formStep11.text = "On any given day, how likely are you to doze off or fall asleep in the following situations?"
    var formItem11 = [ORKFormItem]()
    
    let question65TextChoice1 = ORKTextChoice(text: "1", detailText: "No chance of nodding off", value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question65TextChoice2 = ORKTextChoice(text: "2", detailText: "Slight chance of nodding off", value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question65TextChoice3 = ORKTextChoice(text: "3", detailText: "Moderate chance of sleeping", value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let question65TextChoice4 = ORKTextChoice(text: "4", detailText: "High chance of falling asleep", value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
    let choiceAnswerFormat65 = ORKAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [question65TextChoice1, question65TextChoice2, question65TextChoice3, question65TextChoice4])
    
    let formItem11Question1 = ORKFormItem(identifier: "formItem11Question1", text: "Sitting inactive in a public place", answerFormat: choiceAnswerFormat65)
    formItem11 += [formItem11Question1]
    
    let formItem11Question2 = ORKFormItem(identifier: "formItem11Question2", text: "Sitting and reading", answerFormat: choiceAnswerFormat65)
    formItem11 += [formItem11Question2]
    
    let formItem11Question3 = ORKFormItem(identifier: "formItem11Question3", text: "Watching TV", answerFormat: choiceAnswerFormat65)
    formItem11 += [formItem11Question3]
    
    let formItem11Question4 = ORKFormItem(identifier: "formItem11Question4", text: "As a passenger in a car for an hour without a break", answerFormat: choiceAnswerFormat65)
    formItem11 += [formItem11Question4]
    
    let formItem11Question5 = ORKFormItem(identifier: "formItem11Question5", text: "Lying down in the afternoon when time permits", answerFormat: choiceAnswerFormat65)
    formItem11 += [formItem11Question5]
    
    let formItem11Question6 = ORKFormItem(identifier: "formItem11Question6", text: "Sitting and talking to someone", answerFormat: choiceAnswerFormat65)
    formItem11 += [formItem11Question6]
    
    let formItem11Question7 = ORKFormItem(identifier: "formItem11Question7", text: "Sitting quietly after lunch without alcohol", answerFormat: choiceAnswerFormat65)
    formItem11 += [formItem11Question7]
    
    let formItem11Question8 = ORKFormItem(identifier: "formItem11Question8", text: "In a car, while stopped for a few minutes in traffic", answerFormat: choiceAnswerFormat65)
    formItem11 += [formItem11Question8]
    
    formStep11.formItems = formItem11
    steps += [formStep11]
    
    //Instruction step for part 9
    let instructionStep10 = ORKInstructionStep(identifier: "IntroStep10")
    instructionStep10.title = "Part 9"
    instructionStep10.text = "The following questions are about fatigue."
    steps += [instructionStep10]
    
    //Mini form 12 about part 9
    let formStep12 = ORKFormStep(identifier: "formStep12")
    formStep12.title = "Part 9"
    formStep12.text = "During the last week, I have found that: "
    
    var formItem12 = [ORKFormItem]()
    
    let scaleAnswerFormat73 = ORKAnswerFormat.scale(withMaximumValue: 7, minimumValue: 1, defaultValue: 4, step: 1, vertical: false, maximumValueDescription: "Agree", minimumValueDescription: "Disagree")
    
    let formItem12Question1 = ORKFormItem(identifier: "formItem12Question1", text: "My motivation is lower when I am fatigued.", answerFormat: scaleAnswerFormat73)
    formItem12 += [formItem12Question1]
    
    let formItem12Question2 = ORKFormItem(identifier: "formItem12Question2", text: "Exercise brings on my fatigue.", answerFormat: scaleAnswerFormat73)
    formItem12 += [formItem12Question2]
    
    let formItem12Question3 = ORKFormItem(identifier: "formItem12Question3", text: "I am easily fatigued.", answerFormat: scaleAnswerFormat73)
    formItem12 += [formItem12Question3]
    
    let formItem12Question4 = ORKFormItem(identifier: "formItem12Question4", text: "Fatigue interferes with my physical functioning.", answerFormat: scaleAnswerFormat73)
    formItem12 += [formItem12Question4]
    
    let formItem12Question5 = ORKFormItem(identifier: "formItem12Question5", text: "Fatigue causes frequent problems for me.", answerFormat: scaleAnswerFormat73)
    formItem12 += [formItem12Question5]
    
    let formItem12Question6 = ORKFormItem(identifier: "formItem12Question6", text: "My fatigue prevents sustained physical functioning.", answerFormat: scaleAnswerFormat73)
    formItem12 += [formItem12Question6]
    
    let formItem12Question7 = ORKFormItem(identifier: "formItem12Question7", text: "Fatigue interferes with carrying out certain duties and responsibiities.", answerFormat: scaleAnswerFormat73)
    formItem12 += [formItem12Question7]
    
    let formItem12Question8 = ORKFormItem(identifier: "formItem12Question8", text: "Fatigue is among my three most disabling symptoms.", answerFormat: scaleAnswerFormat73)
    formItem12 += [formItem12Question8]
    
    let formItem12Question9 = ORKFormItem(identifier: "formItem12Question9", text: "Fatigue interferes with my work, family or social life.", answerFormat: scaleAnswerFormat73)
    formItem12 += [formItem12Question9]
    
    formStep12.formItems = formItem12
    steps += [formStep12]
    
    // Instruction step for part 10
    let ins10 = ORKInstructionStep(identifier: "ins10")
    ins10.title = "Part 10"
    ins10.text = "The following questions are about you."
    steps += [ins10]
    
    // Mini form about part 10
    let fs10 = ORKFormStep(identifier: "fs10")
    fs10.title = "Part 10"
    fs10.text = "About you"
    
    var fi10 = [ORKFormItem]()
    
    let formItem2Question1 = ORKFormItem(identifier: "formItem2Question1", text: "Date of Birth", answerFormat: ORKAnswerFormat.dateAnswerFormat())
    fi10 += [formItem2Question1]
    
    let formItem2Question2 = ORKFormItem(identifier: "formItem2Question2", text: "Age", answerFormat: numericAnswerFormat1)
    fi10 += [formItem2Question2]
    
    let formItem2q3 = ORKFormItem(identifier: "formItem2q3", text: "Gender", answerFormat: ORKAnswerFormat.booleanAnswerFormat(withYesString: "Male", noString: "Female"))
    fi10 += [formItem2q3]
    
    let formItem2Question3 = ORKFormItem(identifier: "formItem2Question3", text: "Height", answerFormat: ORKAnswerFormat.heightAnswerFormat(with: ORKMeasurementSystem.USC))
    fi10 += [formItem2Question3]
    
    let formItem2Question4 = ORKFormItem(identifier: "formItem2Question4", text: "Weight", answerFormat: ORKAnswerFormat.weightAnswerFormat(with: ORKMeasurementSystem.USC))
    fi10 += [formItem2Question4]
    
    fs10.formItems = fi10
    steps += [fs10]
    
    //Instruction step
    let instructionStep11 = ORKInstructionStep(identifier: "IntroStep11")
    instructionStep11.title = "Thank you!"
    instructionStep11.text = "Thank you for your participation!"
    steps += [instructionStep11]
    
    let task = ORKNavigableOrderedTask(identifier: "Baseline", steps: steps)
    
    let question45Predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "question45"), expectedAnswer: false)
    let predicateNavigationRule1 = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(resultPredicate: question45Predicate, destinationStepIdentifier: "question50")])
    task.setNavigationRule(predicateNavigationRule1, forTriggerStepIdentifier: "question45")
    
    return task
}
