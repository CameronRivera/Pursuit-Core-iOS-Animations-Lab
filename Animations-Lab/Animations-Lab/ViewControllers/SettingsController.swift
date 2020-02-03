//
//  SettingsController.swift
//  Animations-Lab
//
//  Created by Cameron Rivera on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

enum AnimationOptions: Int{
    case `repeat` = 8
    case curveEaseIn = 65536
    case curveEaseOut = 131072
    case curveLinear = 196608
    case autoReverse = 16
}

protocol SettingsControllerDelegate: AnyObject{
    func settingsChanged(_ settingsController: SettingsController)
}

class SettingsController: UIViewController {

    let settingsView = SettingsView()
    let animationOptions = ["Repeat", "Auto Reverse", "Curve Linear", "Curve East Out", "Curve Ease In"]
    var indexOfRowSelected = -1
    
    override func loadView(){
        view = settingsView
    }
    
    weak var delegate: SettingsControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        settingsView.durationLabel.text = "Current Animation duration: \(settingsView.durationStepper.value)"
        settingsView.offsetLabel.text = "Current Offset: \(settingsView.offsetStepper.value)"
    }
    
    private func setUp(){
        view.backgroundColor = .systemBackground
        setUpRightBarButton()
        stepperSetUp()
        settingsView.pickerView.delegate = self
        settingsView.pickerView.dataSource = self
    }
    
    private func setUpRightBarButton(){
        navigationItem.rightBarButtonItem = settingsView.rightBarButton
        settingsView.rightBarButton.target = self
        settingsView.rightBarButton.action = #selector(saveChanges)
    }
    
    private func stepperSetUp(){
        settingsView.durationStepper.addTarget(self, action: #selector(durationStepperChanged), for: .touchUpInside)
        settingsView.offsetStepper.addTarget(self, action: #selector(offsetStepperChanged), for: .touchUpInside)
    }
    
    @IBAction func saveChanges(_ sender: UIBarButtonItem){
        delegate?.settingsChanged(self)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func durationStepperChanged(_ sender: UIStepper){
        settingsView.durationLabel.text = "Current Animation duration: \(settingsView.durationStepper.value)"
    }
    
    @IBAction func offsetStepperChanged(_ sender: UIStepper){
        settingsView.offsetLabel.text = "Current Offset: \(settingsView.offsetStepper.value)"
    }

}

extension SettingsController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animationOptions.count
    }
}

extension SettingsController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(animationOptions[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        indexOfRowSelected = row
    }
}
