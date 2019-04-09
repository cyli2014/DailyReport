//
//  dBHL.swift
//  DailyReport
//
//  Created by Darwin Lee on 2/14/19.
//  Copyright © 2019 Darwin Lee. All rights reserved.
//

import Foundation
import ResearchKit

public var dBHL: ORKOrderedTask {
    return ORKOrderedTask.dBHLToneAudiometryTask(withIdentifier: "dBHL", intendedUseDescription: "dBHL", options: ORKPredefinedTaskOption())
}
