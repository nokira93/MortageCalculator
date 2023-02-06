//
//  ViewController.swift
//  MortageCalculator
//
//  Created by Artur on 23/01/2023.
//


import UIKit

class ViewController: UIViewController {
    
    var mortageCalculatorLabel = UILabel()
    var purchaseLabel = UILabel()
    var downPaymentLabel = UILabel()
    var repaymentTimeLabel = UILabel()
    var interestRateLabel = UILabel()
    var loanAmountLabel = UILabel()
    var loanpriceLabel = UILabel()
    var estimatedLabel = UILabel()
    var estimatedPriceLabel = UILabel()
    var button = UIButton()
    var purchaseSlider = UISlider()
    var downSlider = UISlider()
    var repaymentSlider = UISlider()
    var interestSlider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
        
        mortageCalculatorLabel.text = "Mortage calculator"
        mortageCalculatorLabel.font = UIFont.boldSystemFont(ofSize: 33)
        
        purchaseSlider.configuration(min: 100000, max: 2000000)
        purchaseSlider.addTarget(self, action: #selector(purchaseSliderChanged(senderSlider:)), for: .valueChanged)
        
        let purchaseCurrentValue = purchaseSlider.value / 1000000
        let purchaseRounded = String(format: "%.0f", purchaseCurrentValue)
        purchaseSlider.value = Float(purchaseRounded)! * 1000000
        purchaseLabel.text = "Purchase price: $\(purchaseRounded),000,000"
        
        purchaseLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        downSlider.configuration(min: 0, max: 950000)

        downSlider.addTarget(self, action: #selector(downSliderChanged(senderSlider:)), for: .valueChanged)
        
        let downCurrentValue = downSlider.value / 1000
        let downRounded = String(format: "%.0f", downCurrentValue)
        downSlider.value = Float(downRounded)! * 1000
        downPaymentLabel.text = "Down payment: $\(downRounded),000"
        downPaymentLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        repaymentSlider.configuration(min: 0, max: 50)
        repaymentSlider.addTarget(self, action: #selector(repaymentSliderChanged(senderSlider:)), for: .valueChanged)
        
        repaymentTimeLabel.text = "Repayment time: \(Int(repaymentSlider.value)) years"
        repaymentTimeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        interestSlider.configuration(min: 0, max: 30)
        interestSlider.addTarget(self, action: #selector(interestSliderChanged(senderSlider:)), for: .valueChanged)
        
        interestRateLabel.text = "Interest rate: \(interestSlider.value) %"
        interestRateLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        loanAmountLabel.text = "Loan amount"
        loanAmountLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        loanpriceLabel.text = "$ \(String(purchaseSlider.value - downSlider.value))"
        loanpriceLabel.font = UIFont.boldSystemFont(ofSize: 40)
        
        estimatedLabel.text = "Estimated pr. month:"
        estimatedLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        estimatedPriceLabel.text = "$ 0"
        estimatedPriceLabel.font = UIFont.boldSystemFont(ofSize: 40)
        
        button.backgroundColor = .systemIndigo
        button.setTitle("Get a mortagege quote", for: .normal)
        button.addTarget(self, action: #selector(pressButton(_ :)), for: .touchUpInside)
        
        [mortageCalculatorLabel, purchaseSlider, purchaseLabel, downSlider, downPaymentLabel, repaymentSlider, repaymentTimeLabel, interestSlider, interestRateLabel, loanpriceLabel, estimatedLabel, estimatedPriceLabel, loanAmountLabel, loanAmountLabel, button].forEach {view.addSubview($0)}
        
        mortageCalculatorLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailling: nil, padding: .init(top: 20, left: 40, bottom: 0, right: 0))
        purchaseLabel.anchor(top: mortageCalculatorLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailling: nil, padding: .init(top: 30, left: 40, bottom: 0, right: 0))
        purchaseSlider.anchor(top: purchaseLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailling: view.trailingAnchor, padding:.init(top: 20, left: 40, bottom: 0, right: 40))
        downPaymentLabel.anchor(top: purchaseSlider.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailling: nil, padding: .init(top: 40, left: 40, bottom: 0, right: 0))
        downSlider.anchor(top: downPaymentLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailling: view.trailingAnchor, padding:.init(top: 20, left: 40, bottom: 0, right: 40))
        repaymentTimeLabel.anchor(top: downSlider.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailling: nil, padding: .init(top: 40, left: 40, bottom: 0, right: 0))
        repaymentSlider.anchor(top: repaymentTimeLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailling: view.trailingAnchor, padding:.init(top: 20, left: 40, bottom: 0, right: 40))
        interestRateLabel.anchor(top: repaymentSlider.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailling: nil, padding: .init(top: 40, left: 40, bottom: 0, right: 0))
        interestSlider.anchor(top: interestRateLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailling: view.trailingAnchor, padding:.init(top: 20, left: 40, bottom: 0, right: 40))
        loanAmountLabel.anchor(top: interestSlider.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailling: nil, padding: .init(top: 40, left: 40, bottom: 0, right: 0))
        loanpriceLabel.anchor(top: loanAmountLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailling: nil, padding: .init(top: 20, left: 40, bottom: 0, right: 0))
        estimatedLabel.anchor(top: loanpriceLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailling: nil, padding: .init(top: 20, left: 40, bottom: 0, right: 0))
        estimatedPriceLabel.anchor(top: estimatedLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailling: nil, padding: .init(top: 20, left: 40, bottom: 0, right: 0))
        button.anchor(top: estimatedPriceLabel.bottomAnchor, leading: nil, bottom: nil, trailling: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 300, height: 80))
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    }
    @objc func pressButton(_ button: UIButton) {
        if purchaseSlider.value > downSlider.value {
        let monthlyPayment = String(Calculaction.Calculate(loanAmount: Double(purchaseSlider.value - downSlider.value), interestRate: Double(interestSlider.value), numberOfPayments: Double(repaymentSlider.value)))
        let value = Float(monthlyPayment)
        let dupa = String(format: "%.2f", value as! CVarArg)
        estimatedPriceLabel.text = "$ \(dupa)"
        loanpriceLabel.text = "$ \(String(purchaseSlider.value - downSlider.value))"
        } else {
            estimatedPriceLabel.text = "$ 0"
            loanpriceLabel.text = "$ 0"
        }}
    
    @objc func purchaseSliderChanged(senderSlider: UISlider) {
    var currentValue = purchaseSlider.value / 1000
    if currentValue < 1000 {
        let rounded = String(format: "%.0f", currentValue)
        purchaseSlider.value = Float(rounded)! * 1000
        purchaseLabel.text = "Purchase price: $\(rounded),000"}
    else {
        currentValue = currentValue / 1000
        let rounded = String(format: "%.2f", currentValue)
        purchaseSlider.value = Float(rounded)! * 1000000
        let final = DecimalSeparator.convert(myString: rounded, 1, ",")
        purchaseLabel.text = "Purchase price: $\(final)0,000"
    }
    }
    @objc func downSliderChanged(senderSlider: UISlider) {
    let currentValue = downSlider.value / 1000
    let rounded = String(format: "%.0f", currentValue)
    downSlider.value = Float(rounded)! * 1000
    downPaymentLabel.text = "Down payment : $\(rounded),000"
    }
    @objc func repaymentSliderChanged(senderSlider: UISlider) {
    let step: Float = 1
    let currentValue = round((repaymentSlider.value - repaymentSlider.minimumValue) / step)
    repaymentSlider.value = currentValue
    repaymentTimeLabel.text = "Repayment time: \(Int(repaymentSlider.value)) years"
    }
    @objc func interestSliderChanged(senderSlider: UISlider) {
    let rounded = String(format: "%.1f", interestSlider.value)
    interestRateLabel.text = "Interest rate: \(rounded) %"
    }
}
