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
    return ORKOrderedTask.speechInNoiseTask(withIdentifier: "SpeechinNoise", intendedUseDescription: "Test", options: ORKPredefinedTaskOption())
}
