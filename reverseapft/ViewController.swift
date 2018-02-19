//
//  ViewController.swift
//  reverseapft
//
//  Created by twodayslate on 10/14/14.
//  Copyright (c) 2014 twodayslate. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIScrollViewDelegate {

    var situpPicker : UIPickerView! = nil
    var pushupPicker : UIPickerView! = nil
    var runPicker : UIPickerView! = nil
    var valueLabel : UILabel! = nil
    var segment : UISegmentedControl! = nil
    var runLabel : UILabel! = nil
    var pushupLabel : UILabel! = nil
    var situpLabel : UILabel! = nil
    var inputAge : UITextField! = nil
    let prefs : UserDefaults = UserDefaults()
    
    var scrollview : UIScrollView! = nil
    var stack : UIStackView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// hide status bar
		// https://stackoverflow.com/questions/46543470/hide-status-bar-swift-4
		let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
		statusBar.isHidden = false
		
        scrollview = UIScrollView()
        //TODO: add gradient to top
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.delegate = self
        self.view.addSubview(scrollview)
		self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollview]|", options: .alignAllCenterY, metrics: nil, views: ["scrollview": scrollview]))
		self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollview]|", options: .alignAllCenterY, metrics: nil, views: ["scrollview": scrollview]))
        
        stack = UIStackView()
		stack.axis = UILayoutConstraintAxis.vertical
        //stack.alignment = UIStackViewAlignment.Fill
        //stack.distribution = UIStackViewDistribution.FillProportionally
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(
            item: stack,
			attribute: NSLayoutAttribute.topMargin,
			relatedBy: NSLayoutRelation.equal,
            toItem: scrollview,
			attribute: NSLayoutAttribute.topMargin,
            multiplier: 1.0,
			constant: UIApplication.shared.statusBarFrame.size.height + 10)
        let leftConstraint = NSLayoutConstraint(
            item: stack,
			attribute: NSLayoutAttribute.leading,
			relatedBy: NSLayoutRelation.equal,
            toItem: scrollview,
			attribute: NSLayoutAttribute.leading,
            multiplier: 1.0,
            constant: 20)
        let rightConstraint = NSLayoutConstraint(
            item: stack,
			attribute: NSLayoutAttribute.trailing,
			relatedBy: NSLayoutRelation.equal,
            toItem: scrollview,
			attribute: NSLayoutAttribute.trailing,
            multiplier: 1.0,
            constant: 20)
        let widthCon = NSLayoutConstraint(
            item: stack,
			attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.equal,
            toItem: scrollview,
            attribute: NSLayoutAttribute.width,
            multiplier: 1.0,
            constant: -60)
        scrollview.addSubview(stack)
        scrollview.addConstraint(widthCon)
        scrollview.addConstraint(topConstraint)
        scrollview.addConstraint(leftConstraint)
        scrollview.addConstraint(rightConstraint)
        
		prefs.register(defaults: [
			"gender":0,
			"age":21,
			"pushups": 30,
			"situps": 30,
			"run":30])
        
        segment = UISegmentedControl(items: ["MALE", "FEMALE"]);
        //TODO: get from previous run
		segment.selectedSegmentIndex = prefs.integer(forKey: "gender")
		segment.addTarget(self, action: #selector(ViewController.updateChanged), for: UIControlEvents.valueChanged)
        stack.addArrangedSubview(segment)
        
        let border_zero = UIView()
		border_zero.layer.backgroundColor = UIColor.gray.cgColor
		border_zero.backgroundColor = UIColor.gray
        let borderHeight_zero = NSLayoutConstraint(
            item: border_zero,
			attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: stack,
            attribute: NSLayoutAttribute.height,
            multiplier: 0.0,
            constant: 1)
        stack.addArrangedSubview(border_zero)
        stack.addConstraint(borderHeight_zero)
        
        let row_one = UIStackView()
        let nameLabel_one = UILabel()
        nameLabel_one.text = "Age"
        row_one.addArrangedSubview(nameLabel_one)
        inputAge = UITextField()
		inputAge.keyboardType = UIKeyboardType.numberPad
		inputAge.text = String(prefs.integer(forKey: "age"))
        inputAge.placeholder = "21"
        
		inputAge.textAlignment = NSTextAlignment.right
		inputAge.addTarget(self, action: #selector(ViewController.updateChanged), for: UIControlEvents.editingChanged)
        // you have to set the frame size otherwise the buttons will not work
		let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        let helperBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
		let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.dismissKeyboard))
        helperBar.setItems([flexibleSpace, doneButton], animated: true)
        inputAge.inputAccessoryView = helperBar
        row_one.addArrangedSubview(inputAge)
        let inputCon = NSLayoutConstraint(
            item: inputAge,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.lessThanOrEqual,
            toItem: row_one,
            attribute: NSLayoutAttribute.width,
            multiplier: 1.0,
            constant: 0)
        row_one.addConstraint(inputCon)
        stack.addArrangedSubview(row_one)
        
        let border = UIView()
        border.layer.backgroundColor = UIColor.gray.cgColor
        border.backgroundColor = UIColor.gray
        border.clipsToBounds = true
		border.isHidden = false
        let borderHeight = NSLayoutConstraint(
            item: border,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: stack,
            attribute: NSLayoutAttribute.height,
            multiplier: 0.0,
            constant: 1)
        stack.addArrangedSubview(border)
        stack.addConstraint(borderHeight)
        
        
        let row_two = UIStackView()
        let column_one = UIStackView()
        column_one.axis = UILayoutConstraintAxis.vertical
        let nameLabel_two = UILabel()
        nameLabel_two.text = "Pushups"
        nameLabel_two.textAlignment = NSTextAlignment.center
        column_one.addArrangedSubview(nameLabel_two)
        pushupPicker = UIPickerView()
        pushupPicker.delegate = self
        pushupPicker.dataSource = self
        //TODO: get from previous run
		pushupPicker.selectRow(prefs.integer(forKey: "pushups"), inComponent: 0, animated: true)
        column_one.addArrangedSubview(pushupPicker)
        row_two.addArrangedSubview(column_one)
        let thirdWidthConstraint_one = NSLayoutConstraint(
            item: column_one,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.equal,
            toItem: row_two,
            attribute: NSLayoutAttribute.width,
            multiplier: (1.0/3.0),
            constant: 0)
        row_two.addConstraint(thirdWidthConstraint_one)
        
        let column_two = UIStackView()
        column_two.axis = UILayoutConstraintAxis.vertical
        let nameLabel_three = UILabel()
        nameLabel_three.text = "Situps"
        nameLabel_three.textAlignment = NSTextAlignment.center
        column_two.addArrangedSubview(nameLabel_three)
        situpPicker = UIPickerView()
        situpPicker.delegate = self
        situpPicker.dataSource = self
        //TODO: get from previous run
		situpPicker.selectRow(prefs.integer(forKey: "situps"), inComponent: 0, animated: true)
        column_two.addArrangedSubview(situpPicker)
                row_two.addArrangedSubview(column_two)
        let thirdWidthConstraint_two = NSLayoutConstraint(
            item: column_two,
			attribute: NSLayoutAttribute.width,
			relatedBy: NSLayoutRelation.equal,
            toItem: row_two,
			attribute: NSLayoutAttribute.width,
            multiplier: (1.0/3.0),
            constant: 0)
        row_two.addConstraint(thirdWidthConstraint_two)
        
        let column_three = UIStackView()
        column_three.axis = UILayoutConstraintAxis.vertical
        let nameLabel_four = UILabel()
        nameLabel_four.text = "Run"
        nameLabel_four.textAlignment = NSTextAlignment.center
        column_three.addArrangedSubview(nameLabel_four)
        runPicker = UIPickerView()
        runPicker.delegate = self
        runPicker.dataSource = self
        //TODO: get from previous run
		runPicker.selectRow(prefs.integer(forKey: "run"), inComponent: 0, animated: true)
        column_three.addArrangedSubview(runPicker)
                row_two.addArrangedSubview(column_three)
        let thirdWidthConstraint_three = NSLayoutConstraint(
            item: column_three,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.equal,
            toItem: row_two,
            attribute: NSLayoutAttribute.width,
            multiplier: (1.0/3.0),
            constant: 0)
        row_two.addConstraint(thirdWidthConstraint_three)
        
        stack.addArrangedSubview(row_two) //pickers
        
        let border_two = UIView()
        border_two.layer.backgroundColor = UIColor.gray.cgColor
        border_two.backgroundColor = UIColor.gray
        let borderHeight_two = NSLayoutConstraint(
            item: border_two,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: stack,
            attribute: NSLayoutAttribute.height,
            multiplier: 0.0,
            constant: 1)
        stack.addArrangedSubview(border_two)
        stack.addConstraint(borderHeight_two)
        
        let row_three = UIStackView()
        let nameLabel_five = UILabel()
        nameLabel_five.text = "Total Score"
        row_three.addArrangedSubview(nameLabel_five)
        valueLabel = UILabel()
        valueLabel.text = "-"
        valueLabel.textAlignment = NSTextAlignment.right
        valueLabel.textColor = UIColor.gray
        row_three.addArrangedSubview(valueLabel)
        stack.addArrangedSubview(row_three)
        
        let border_three = UIView()
        border_three.layer.backgroundColor = UIColor.gray.cgColor
        border_three.backgroundColor = UIColor.gray
        let borderHeight_three = NSLayoutConstraint(
            item: border_three,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: stack,
            attribute: NSLayoutAttribute.height,
            multiplier: 0.0,
            constant: 1)
        stack.addArrangedSubview(border_three)
        stack.addConstraint(borderHeight_three)
        
        let row_four = UIStackView()
        let nameLabel_six = UILabel()
        nameLabel_six.text = "Pushups"
        row_four.addArrangedSubview(nameLabel_six)
        pushupLabel = UILabel()
        pushupLabel.text = "-"
        pushupLabel.textAlignment = NSTextAlignment.right
        pushupLabel.textColor = UIColor.gray
        row_four.addArrangedSubview(pushupLabel)
        stack.addArrangedSubview(row_four)
        
        let border_four = UIView()
        border_four.layer.backgroundColor = UIColor.gray.cgColor
        border_four.backgroundColor = UIColor.gray
        let borderHeight_four = NSLayoutConstraint(
            item: border_four,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: stack,
            attribute: NSLayoutAttribute.height,
            multiplier: 0.0,
            constant: 1)
        stack.addArrangedSubview(border_four)
        stack.addConstraint(borderHeight_four)
        
        let row_five = UIStackView()
        let nameLabel_seven = UILabel()
        nameLabel_seven.text = "Situps"
        row_five.addArrangedSubview(nameLabel_seven)
        situpLabel = UILabel()
        situpLabel.text = "-"
        situpLabel.textAlignment = NSTextAlignment.right
        situpLabel.textColor = UIColor.gray
        row_five.addArrangedSubview(situpLabel)
        stack.addArrangedSubview(row_five)
        
        let border_five = UIView()
        border_five.layer.backgroundColor = UIColor.gray.cgColor
        border_five.backgroundColor = UIColor.gray
        let borderHeight_five = NSLayoutConstraint(
            item: border_five,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: stack,
            attribute: NSLayoutAttribute.height,
            multiplier: 0.0,
            constant: 1)
        stack.addArrangedSubview(border_five)
        stack.addConstraint(borderHeight_five)
        
        let row_six = UIStackView()
        let nameLabel_eight = UILabel()
        nameLabel_eight.text = "Run"
        row_six.addArrangedSubview(nameLabel_eight)
        runLabel = UILabel()
        runLabel.text = "-"
        runLabel.textAlignment = NSTextAlignment.right
        runLabel.textColor = UIColor.gray
        row_six.addArrangedSubview(runLabel)
        stack.addArrangedSubview(row_six)
        
        self.updateChanged()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(self.view.frame)
		self.scrollview.contentSize = CGSize(width: self.view.frame.width, height: stack.frame.height + UIApplication.shared.statusBarFrame.size.height+40)
    }

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.dismissKeyboard()
    }
	
	@objc func dismissKeyboard() {
        print("dismissing keyboard")
        self.resignFirstResponder()
        self.view.endEditing(false)
        updateChanged()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@objc func updateChanged() {
		self.pickerView(pushupPicker, didSelectRow: pushupPicker.selectedRow(inComponent: 0), inComponent: 0)
		self.pickerView(situpPicker, didSelectRow: situpPicker.selectedRow(inComponent: 0), inComponent: 0)
		self.pickerView(runPicker, didSelectRow: runPicker.selectedRow(inComponent: 0), inComponent: 0)
    }
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return 71
    }

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row + 30)
    }
    
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let newValue : Int = row + 30;
        print("value selected = \(newValue)")
		let sum = runPicker.selectedRow(inComponent: 0) + pushupPicker.selectedRow(inComponent: 0) + situpPicker.selectedRow(inComponent: 0) + 90
        print("new sum = \(sum)")
        valueLabel.text = String(sum)
        
        switch pickerView {
        case pushupPicker:
			prefs.set(row, forKey: "pushups")
            break
        case situpPicker:
			prefs.set(row, forKey: "situps")
            break
        case runPicker:
			prefs.set(row, forKey: "run")
            break
        default:
            break
        }
		
		let gender : NSString! = segment.titleForSegment(at: segment.selectedSegmentIndex)! as NSString
		prefs.set(segment.selectedSegmentIndex, forKey: "gender")
        
        print("gender = \(gender)")
        
        //println(inputAge.text)
        var age : Int! = Int(inputAge.text!)
        if (age == nil) {
            age = 21
            inputAge.text = "" //placeholder is 21
        }
		prefs.set(age, forKey: "age")
        print("age = \(age)")
        
        
       
        
        switch pickerView {
        case runPicker: print("Changing run value")
		if(gender.isEqual(to: "MALE")) {
                if(age < 22) {
                    runLabel.text = String(maleRun21[row])
                } else if(age < 27) {
                    runLabel.text = String(maleRun26[row])
                } else if(age < 32) {
                    runLabel.text = String(maleRun31[row])
                } else if(age < 37) {
                    runLabel.text = String(maleRun36[row])
                } else if(age < 42) {
                    runLabel.text = String(maleRun41[row])
                } else if(age < 47) {
                    runLabel.text = String(maleRun46[row])
                } else if(age < 52) {
                    runLabel.text = String(maleRun51[row])
                } else if(age < 57) {
                    runLabel.text = String(maleRun56[row])
                } else if(age < 62) {
                    runLabel.text = String(maleRun61[row])
                } else {
                    runLabel.text = String(maleRun[row])
                }
            } else  { // is FEMALE
                if(age < 22) {
                    runLabel.text = String(femaleRun21[row])
                } else if(age < 27) {
                    runLabel.text = String(femaleRun26[row])
                } else if(age < 32) {
                    runLabel.text = String(femaleRun31[row])
                } else if(age < 37) {
                    runLabel.text = String(femaleRun36[row])
                } else if(age < 42) {
                    runLabel.text = String(femaleRun41[row])
                } else if(age < 47) {
                    runLabel.text = String(femaleRun46[row])
                } else if(age < 52) {
                    runLabel.text = String(femaleRun51[row])
                } else if(age < 57) {
                    runLabel.text = String(femaleRun56[row])
                } else if(age < 62) {
                    runLabel.text = String(femaleRun61[row])
                } else {
                    runLabel.text = String(femaleRun[row])
                }
            }
        case situpPicker: print("Changing situp value")
		if(gender.isEqual(to: "MALE")) {
                if(age < 22) {
                    situpLabel.text = String(maleSitup21[row])
                } else if(age < 27) {
                    situpLabel.text = String(maleSitup26[row])
                } else if(age < 32) {
                    situpLabel.text = String(maleSitup31[row])
                } else if(age < 37) {
                    situpLabel.text = String(maleSitup36[row])
                } else if(age < 42) {
                    situpLabel.text = String(maleSitup41[row])
                } else if(age < 47) {
                    situpLabel.text = String(maleSitup46[row])
                } else if(age < 52) {
                    situpLabel.text = String(maleSitup51[row])
                } else if(age < 57) {
                    situpLabel.text = String(maleSitup56[row])
                } else if(age < 62) {
                    situpLabel.text = String(maleSitup61[row])
                } else {
                    situpLabel.text = String(maleSitup[row])
                }
            } else  { // is FEMALE
                if(age < 22) {
                    situpLabel.text = String(femaleSitup21[row])
                } else if(age < 27) {
                    situpLabel.text = String(femaleSitup26[row])
                } else if(age < 32) {
                    situpLabel.text = String(femaleSitup31[row])
                } else if(age < 37) {
                    situpLabel.text = String(femaleSitup36[row])
                } else if(age < 42) {
                    situpLabel.text = String(femaleSitup41[row])
                } else if(age < 47) {
                    situpLabel.text = String(femaleSitup46[row])
                } else if(age < 52) {
                    situpLabel.text = String(femaleSitup51[row])
                } else if(age < 57) {
                    situpLabel.text = String(femaleSitup56[row])
                } else if(age < 62) {
                    situpLabel.text = String(femaleSitup61[row])
                } else {
                    situpLabel.text = String(femaleSitup[row])
                }
            }
        default: print("Changing pushup value")
		if(gender.isEqual(to: "MALE")) {
                if(age < 22) {
                    pushupLabel.text = String(malePushup21[row])
                } else if(age < 27) {
                    pushupLabel.text = String(malePushup26[row])
                } else if(age < 32) {
                    pushupLabel.text = String(malePushup31[row])
                } else if(age < 37) {
                    pushupLabel.text = String(malePushup36[row])
                } else if(age < 42) {
                    pushupLabel.text = String(malePushup41[row])
                } else if(age < 47) {
                    pushupLabel.text = String(malePushup46[row])
                } else if(age < 52) {
                    pushupLabel.text = String(malePushup51[row])
                } else if(age < 57) {
                    pushupLabel.text = String(malePushup56[row])
                } else if(age < 62) {
                    pushupLabel.text = String(malePushup61[row])
                } else {
                    pushupLabel.text = String(malePushup[row])
                }
            } else  { // is FEMALE
                if(age < 22) {
                    pushupLabel.text = String(femalePushup21[row])
                } else if(age < 27) {
                    pushupLabel.text = String(femalePushup26[row])
                } else if(age < 32) {
                    pushupLabel.text = String(femalePushup31[row])
                } else if(age < 37) {
                    pushupLabel.text = String(femalePushup36[row])
                } else if(age < 42) {
                    pushupLabel.text = String(femalePushup41[row])
                } else if(age < 47) {
                    pushupLabel.text = String(femalePushup46[row])
                } else if(age < 52) {
                    pushupLabel.text = String(femalePushup51[row])
                } else if(age < 57) {
                    pushupLabel.text = String(femalePushup56[row])
                } else if(age < 62) {
                    pushupLabel.text = String(femalePushup61[row])
                } else {
                    pushupLabel.text = String(femalePushup[row])
                }
            }
        }
    }
}

