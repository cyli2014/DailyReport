//
//  SpeechinNoise.swift
//  DailyReport
//
//  Created by Darwin Lee on 2018/9/30.
//  Copyright © 2018年 Darwin Lee. All rights reserved.
//

import Foundation
import ResearchKit

public var SpeechinNoise: ORKOrderedTask {
    var steps = [ORKStep]()
    
    let sentence1 = ORKOrderedTask.speechInNoiseTask(withIdentifier: "SpeechinNoise", intendedUseDescription: "Test", options: ORKPredefinedTaskOption())
    steps += [sentence1]
    
    let sentence2 = ORKOrderedTask.speechInNoiseTask(withIdentifier: "SpeechinNoise", intendedUseDescription: "Test", options: ORKPredefinedTaskOption())
    steps += [sentence2]
    
    let task = ORKNavigableOrderedTask(identifier: "speechsteps", steps: steps)
    
    return task
}
