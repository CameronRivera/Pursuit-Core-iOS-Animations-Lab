//
//  MainView.swift
//  Animations-Lab
//
//  Created by Cameron Rivera on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    public lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Animation duration: \(durationStepper.value)"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var offsetLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Offset: \(offsetStepper.value)"
        label.textAlignment = .center
        return label
    }()
    
    // MARK: Create Stepper
    lazy var durationStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 2.0
        stepper.maximumValue = 20.0
        stepper.minimumValue = 0.0
        stepper.stepValue = 1.0
        return stepper
    }()
    
    lazy var offsetStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 150
        stepper.maximumValue = 500
        stepper.minimumValue = 0
        stepper.stepValue = 10
        return stepper
    }()
    
    lazy var pickerView: UIPickerView = {
       let picker = UIPickerView()
        return picker
    }()
    
    lazy var rightBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.title = "Save Changes"
        return barButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setUpDurationLabelConstraints()
        setUpDurationStepperConstraints()
        setUpOffsetLabelConstraints()
        setUpOffsetStepperConstraints()
        setUpPickerConstraints()
    }
    
    private func setUpDurationLabelConstraints(){
        addSubview(durationLabel)
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([durationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20), durationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), durationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20)])
    }
    
    private func setUpDurationStepperConstraints(){
        addSubview(durationStepper)
        durationStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([durationStepper.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 20), durationStepper.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
    
    private func setUpOffsetLabelConstraints(){
        addSubview(offsetLabel)
        offsetLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([offsetLabel.topAnchor.constraint(equalTo: durationStepper.bottomAnchor, constant: 40), offsetLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), offsetLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20)])
    }
    
    private func setUpOffsetStepperConstraints(){
        addSubview(offsetStepper)
        offsetStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([offsetStepper.topAnchor.constraint(equalTo: offsetLabel.bottomAnchor, constant: 20), offsetStepper.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
    
    private func setUpPickerConstraints(){
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([pickerView.topAnchor.constraint(equalTo: offsetStepper.bottomAnchor, constant: 20), pickerView.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }

}
