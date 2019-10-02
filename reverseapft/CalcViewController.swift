//
//  ViewController.swift
//  acft
//
//  Created by Zachary Gorak on 10/15/18.
//  Copyright © 2018 Zachary Gorak. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController, UIScrollViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //TODO: add gradient to top
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.delegate = self
        self.view.addSubview(scrollview)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[scrollview]-|", options: .alignAllCenterY, metrics: nil, views: ["scrollview": scrollview]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[scrollview]-|", options: .alignAllCenterY, metrics: nil, views: ["scrollview": scrollview]))
        
        stack.axis = NSLayoutConstraint.Axis.vertical
        //stack.alignment = UIStackViewAlignment.Fill
        //stack.distribution = UIStackViewDistribution.FillProportionally
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(
            item: stack,
            attribute: NSLayoutConstraint.Attribute.topMargin,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: scrollview,
            attribute: NSLayoutConstraint.Attribute.topMargin,
            multiplier: 1.0,
            constant: 0)
        let leftConstraint = NSLayoutConstraint(
            item: stack,
            attribute: NSLayoutConstraint.Attribute.leading,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: scrollview,
            attribute: NSLayoutConstraint.Attribute.leading,
            multiplier: 1.0,
            constant: 0)
        let rightConstraint = NSLayoutConstraint(
            item: stack,
            attribute: NSLayoutConstraint.Attribute.trailing,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: scrollview,
            attribute: NSLayoutConstraint.Attribute.trailing,
            multiplier: 1.0,
            constant: 0)
        let widthCon = NSLayoutConstraint(
            item: stack,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: scrollview,
            attribute: NSLayoutConstraint.Attribute.width,
            multiplier: 1.0,
            constant: 0)
        scrollview.addSubview(stack)
        scrollview.addConstraint(widthCon)
        scrollview.addConstraint(topConstraint)
        scrollview.addConstraint(leftConstraint)
        scrollview.addConstraint(rightConstraint)
        
        //TODO: get from previous run
        segment.selectedSegmentIndex = UserDefaults().integer(forKey: "gender")
        segment.addTarget(self, action: #selector(updateValues), for: UIControl.Event.valueChanged)
        stack.addArrangedSubview(segment)
        
        self.addSeperator(stack)
        
        self.addScoreInputRow(stack, label: ageInput, title: "Age")
        ageInput.keyboardType = .numberPad
        ageInput.placeholder = "21"
        self.addDoneButton(ageInput)
        let agepl = UserDefaults().integer(forKey: "age")
        if  agepl > 0
        {
            ageInput.text = String(agepl)
        }
        
        self.addSeperator(stack)
        
        self.addScoreInputRow(stack, label: pushupInput, title: "Pushups (reps)")
        pushupInput.keyboardType = .numberPad
        pushupInput.placeholder = "42"
        self.addDoneButton(pushupInput)
        if let releasepupl = UserDefaults().string(forKey: "calc_pu") {
            pushupInput.text = releasepupl
        }
        self.addScoreRow(stack, label: pushupScore, title: "Score")
        self.addSeperator(stack)
        
        self.addScoreInputRow(stack, label: situpInput, title: "Situps (reps)")
        situpInput.keyboardType = .numberPad
        situpInput.placeholder = "53"
        self.addDoneButton(situpInput)
        if let releasepupl = UserDefaults().string(forKey: "calc_situps") {
            situpInput.text = releasepupl
        }
        self.addScoreRow(stack, label: situpScore, title: "Score")
        self.addSeperator(stack)

        self.addScoreInputRow(stack, label: runInput, title: "2-Mile Run (min:sec)")
        runInput.keyboardType = .numbersAndPunctuation
        runInput.placeholder = "15:32"
        self.addDoneButton(runInput)
        if let releasepupl = UserDefaults().string(forKey: "calc_run") {
            runInput.text = releasepupl
        }
        self.addScoreRow(stack, label: runScore, title: "Score")
        self.addSeperator(stack)

        self.addScoreRow(stack, label: totalScore, title: "Total Score")

        self.updateValues()
        
        self.startAvoidingKeyboard()
    }
    
    func addScoreInputRow(_ stackView: UIStackView, label: UITextField, title: String) {
        let row = UIStackView()
        let _title = UILabel()
        _title.text = title
        label.textAlignment = .right
        row.addArrangedSubview(_title)
        row.addArrangedSubview(label)
        stackView.addArrangedSubview(row)
    }
    
    func addScoreRow(_ stackView: UIStackView, label: UILabel, title: String){
        let deadliftRow = UIStackView()
        let deadliftLabel = UILabel()
        deadliftLabel.text = title
        deadliftRow.addArrangedSubview(deadliftLabel)
        label.text = "-"
        label.textAlignment = .right
        label.textColor = UIColor.systemGray
        deadliftRow.addArrangedSubview(label)
        stackView.addArrangedSubview(deadliftRow)
    }
    
    let segment = UISegmentedControl(items: ["MALE", "FEMALE"])
    let scrollview = UIScrollView()
    let stack = UIStackView()
    let topPicker = UIPickerView()
    let bottomPicker = UIPickerView()
    
    let ageInput = UITextField()
    let pushupScore = UILabel()
    let situpScore = UILabel()
    let situpInput = UITextField()
    
    let pushupInput = UITextField()
   
    let runScore = UILabel()
    let runInput = UITextField()
    let totalScore = UILabel()
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrolling")
        self.dismissKeyboard()
    }
    
    @objc func updateValues() {
        Score.gender = Gender(rawValue: segment.selectedSegmentIndex) ?? .male
        if let a_c = Int(ageInput.text ?? "")
        {
            Score.age = a_c
        } else {
            ageInput.text = ""
            Score.age = 21
        }
        UserDefaults().set(segment.selectedSegmentIndex, forKey: "gender")
        UserDefaults().synchronize()
        
        // reset label colors

        pushupScore.textColor = UIColor.systemGray
        situpScore.textColor = UIColor.systemGray
        runScore.textColor = UIColor.systemGray
        totalScore.textColor = UIColor.systemGray
        
        var didFail = false

        var _releasePUScore = Int(pushupInput.text ?? "0") ?? 0
        if pushupInput.text?.isEmpty ?? true {
            _releasePUScore = Int(pushupInput.placeholder ?? "0") ?? 0
        }
        let pushupReps = Score.score(forPushups: _releasePUScore)
        pushupScore.text = String(pushupReps)
        
        var _situpScore = Int(situpInput.text ?? "0") ?? 0
        if situpInput.text?.isEmpty ?? true {
            _situpScore = Int(situpInput.placeholder ?? "0") ?? 0
        }
        let situpReps = Score.score(forSitups: _situpScore)
        situpScore.text = String(situpReps)
        
        var _runText = runInput.text ?? "0"
        if runInput.text?.isEmpty ?? true {
            _runText = runInput.placeholder ?? "0"
        }
        _runText = _runText.replacingOccurrences(of: ":", with: "")
        _runText = _runText.replacingOccurrences(of: "min", with: "")
        _runText = _runText.replacingOccurrences(of: "sec", with: "")
        _runText = _runText.replacingOccurrences(of: " ", with: "")
        _runText = _runText.replacingOccurrences(of: "minutes", with: "")
        _runText = _runText.replacingOccurrences(of: "seconds", with: "")
        let runTime = Score.score(forRun: Int(_runText) ?? 0)
        runScore.text = String(runTime)

        totalScore.text = String(pushupReps + situpReps + runTime)
        
        if (pushupReps < 60) {
            pushupScore.textColor = UIColor.red
            didFail = true
        }
        if (situpReps < 60) {
            situpScore.textColor = UIColor.red
            didFail = true
        }
        if (runTime < 60) {
            runScore.textColor = UIColor.red
            didFail = true
        }
        
        if(didFail) {
            totalScore.textColor = UIColor.red
        }
    }
    
    func addDoneButton(_ label: UITextField) {
        let helperBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(dismissKeyboard))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        helperBar.setItems([flexibleSpace, doneButton], animated: true)
        label.inputAccessoryView = helperBar
        label.addTarget(self, action: #selector(updateValues), for: UIControl.Event.editingChanged)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("Laying out", self.view.frame, self.stack.frame, self.stack.frame.height)
        self.scrollview.contentSize = CGSize(width: self.stack.frame.width, height: self.stack.frame.height + (UIFont.systemFontSize * 2)) // NO idea why if I don't have extra space at the bottom things get cut off
    }
    
    func addSeperator(_ stackView: UIStackView) {
        let border = UIView()
        //border.layer.backgroundColor = UIColor.systemGray.cgColor
        border.backgroundColor = UIColor.systemGray
        let borderHeight_three = NSLayoutConstraint(
            item: border,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: stack,
            attribute: NSLayoutConstraint.Attribute.height,
            multiplier: 0.0,
            constant: 1)
        stackView.addArrangedSubview(border)
        stackView.addConstraint(borderHeight_three)
    }
}
