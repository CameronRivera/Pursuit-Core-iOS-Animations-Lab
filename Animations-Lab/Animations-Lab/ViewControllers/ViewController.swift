//
//  ViewController.swift
//  AnimationsPractice
//
//  Created by Benjamin Stone on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var duration: Double = 2.0
    var moveDistance: CGFloat = 150
    
    // MARK: Create Blue Square
    lazy var blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    // MARK: Create Button Stack View
    lazy var buttonStackView: UIStackView = {
       let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 30
        return buttonStack
    }()
    // MARK: Create Up Button
    lazy var upButton: UIButton = {
       let button = UIButton()
        button.setTitle("Up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareUp(sender:)), for: .touchUpInside)
        return button
    }()
    // MARK: Create Down Button
    lazy var downButton: UIButton = {
       let button = UIButton()
        button.setTitle("Down", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareDown(sender:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: Create Left Button
    lazy var leftButton: UIButton = {
       let button = UIButton()
        button.setTitle("Left", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareLeft(sender:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: Create Right Button
    lazy var rightButton: UIButton = {
       let button = UIButton()
        button.setTitle("Right", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareRight(sender:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: Create Settings Button
    lazy var settingsButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Settings"
        button.target = self
        button.action = #selector(segue)
        return button
    }()
    
    // MARK: Blue Button Constraints
    lazy var blueSquareHeightConstaint: NSLayoutConstraint = {
        blueSquare.heightAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareWidthConstraint: NSLayoutConstraint = {
        blueSquare.widthAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareCenterXConstraint: NSLayoutConstraint = {
        blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()
    
    lazy var blueSquareCenterYConstraint: NSLayoutConstraint = {
        blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }()
    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        view.backgroundColor = UIColor.white
        navigationItem.title = "Animate the Blue Square"
    }
    // MARK: Animate Up Action
    @IBAction func animateSquareUp(sender: UIButton) {
        let oldOffset = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffset - moveDistance
        UIView.animate(withDuration: duration, delay: 0, options: [UIView.AnimationOptions.init(rawValue: 131072)], animations: {[unowned self] in
            self.view.layoutIfNeeded()
            })
//        UIView.animate(withDuration: duration) { [unowned self] in
//            self.view.layoutIfNeeded()
//        }
    }
    // MARK: Animate Down Action
    @IBAction func animateSquareDown(sender: UIButton) {
        let oldOffet = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffet + moveDistance
        UIView.animate(withDuration: duration) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: Animate Left Action
    @IBAction func animateSquareLeft(sender: UIButton){
        let oldOffSet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffSet - moveDistance
        UIView.animate(withDuration: duration){ [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    // MARK: Animate Right Action
    @IBAction func animateSquareRight(sender: UIButton){
        let oldOffSet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffSet + moveDistance
        UIView.animate(withDuration: duration){
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: Segue Function
    @IBAction func segue(sender: UIButton){
        let settingsController = SettingsController()
        settingsController.delegate = self
        settingsController.settingsView.durationStepper.value = duration
        settingsController.settingsView.offsetStepper.value = Double(moveDistance)
        navigationController?.pushViewController(settingsController, animated: true)
    }
    
    // MARK: Add Subviews
    private func addSubviews() {
        view.addSubview(blueSquare)
        addStackViewSubviews()
        view.addSubview(buttonStackView)
        navigationItem.rightBarButtonItem = settingsButton
    }
    // MARK: Add subviews to the stack view
    private func addStackViewSubviews() {
        buttonStackView.addArrangedSubview(upButton)
        buttonStackView.addArrangedSubview(downButton)
        buttonStackView.addArrangedSubview(leftButton)
        buttonStackView.addArrangedSubview(rightButton)
    }
    // MARK: Add Constraints
    private func configureConstraints() {
        constrainBlueSquare()
        // constrainUpButton()
       // constrainDownButton()
        constrainButtonStackView()
    }
    // MARK: Up button constraints
    private func constrainUpButton() {
        upButton.translatesAutoresizingMaskIntoConstraints = false
        upButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        upButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor).isActive = true
    }
    // MARK: Down Button Constraints
    private func constrainDownButton() {
        downButton.translatesAutoresizingMaskIntoConstraints = false
        downButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: Blue button constraints
    private func constrainBlueSquare() {
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueSquareHeightConstaint,
            blueSquareWidthConstraint,
            blueSquareCenterXConstraint,
            blueSquareCenterYConstraint
        ])
    }
    // MARK: Stack View Constraints
    private func constrainButtonStackView() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}

extension ViewController: SettingsControllerDelegate{
    func settingsChanged(_ settingsController: SettingsController) {
        duration = settingsController.settingsView.durationStepper.value
        moveDistance = CGFloat(settingsController.settingsView.offsetStepper.value)
    }
}
