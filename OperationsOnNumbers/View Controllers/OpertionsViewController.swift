//
//  OpertionsViewController.swift
//  OperationsOnNumbers
//
//  Created by Mac on 14/09/21.
//

import UIKit
//
//MARK: OperationsViewControllerProtocol
//
protocol OperationsViewControllerProtocol: AnyObject {
    func passedResult(_ result: Int)
}

class OpertionsViewController: UIViewController {
    //
    //MARK: Outlets
    //
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    
    weak var delegate: OperationsViewControllerProtocol?
    var number1: Int?
    var number2: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Operations Page"
        firstNumberLabel.text = String(number1 ?? 0)
        secondNumberLabel.text = String(number2 ?? 0)
    }
    //
    //MARK: addition
    //
    @IBAction func additionBtnAction(_ sender: Any) {
        let result = number1! + number2!
        delegate?.passedResult(result)
        navigationController?.popViewController(animated: true)
    }
    //
    //MARK: substraction
    //
    @IBAction func substractionBtnAction(_ sender: Any) {
        let result = number1! - number2!
        delegate?.passedResult(result)
        navigationController?.popViewController(animated: true)
    }
    //
    //MARK: multiplication
    //
    @IBAction func multiplyBtnAction(_ sender: Any) {
        let result = number1! * number2!
        delegate?.passedResult(result)
        navigationController?.popViewController(animated: true)
    }
    //
    //MARK: division
    //
    @IBAction func divisionBtnAction(_ sender: Any) {
        let result = number1! / number2!
        delegate?.passedResult(result)
        navigationController?.popViewController(animated: true)
    }
    
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    //
    //MARK: square
    //
    @IBAction func squareBtnAction(_ sender: Any) {
        if numberTextField.text?.isEmpty == true {
            showAlert(title: "Warning", message: "Enter number in textfield first!!!")
        }else{
            guard let num = numberTextField.text else {
                return
            }
            if let number = Int(num) {
                let result = number * number
                delegate?.passedResult(result)
                navigationController?.popViewController(animated: true)
            } else {
                showAlert(title: "Warning", message: "Enter number only!!!")
            }
        }
    }
    
}
