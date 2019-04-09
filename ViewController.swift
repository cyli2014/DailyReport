//
//  ViewController.swift
//  DailyReport
//
//  Created by Darwin Lee on 2018/9/29.
//  Copyright © 2018年 Darwin Lee. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController, ORKTaskViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func sinClicked(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: SpeechinNoise, taskRun: nil)
        taskViewController.outputDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    @IBAction func surveyClicked(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    @IBAction func baselineClicked(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: Baseline, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func dbhlClicked(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: dBHL, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        switch (reason) {
        case .completed:
            let taskResult = taskViewController.result
            let outputDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let currentdate = Date()
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "YYYY-MM-dd"
            let dateString = dateformatter.string(from: currentdate)
            let suffix: String
            let fileName: String
            let filePath: URL
            if taskResult.identifier == "SpeechinNoise" {
                let unwrap: ORKStepResult? = taskResult.results?.compactMap{ $0 }[4] as! ORKStepResult
                let answer: ORKTextQuestionResult? = unwrap?.results?.compactMap{ $0 }[0] as! ORKTextQuestionResult
                let finalAnswer: String = answer?.answer as! String
                suffix = ".txt"
                fileName = dateString + "-15-" + taskResult.identifier + suffix
                filePath = outputDirectory.appendingPathComponent(fileName)
                try? finalAnswer.write(to: filePath, atomically: false, encoding: .utf8)
                print(finalAnswer)
            } else {
                let jsonData = try! ORKESerializer.jsonData(for: taskResult)
                suffix = ".json"
                fileName = dateString + "-3-" + taskResult.identifier + suffix
                filePath = outputDirectory.appendingPathComponent(fileName)
                try? jsonData.write(to: filePath)
            }
            // let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)
            break
        case .failed, .discarded, .saved:
            break
        }
        dismiss(animated: true, completion: nil)
    }
}
