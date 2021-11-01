//
//  HomeViewController.swift
//  OperationsOnNumbers
//
//  Created by Mac on 14/09/21.
//
/*
 Program - Accept two numbers pass it to another page and perform operations on it and pass back result and diplay result
*/

import UIKit

class HomeViewController: UIViewController {
    //
    //MARK: Outlets
    //
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var secondNumberTextFielField: UITextField!
    @IBOutlet weak var resultDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Page"
        if resultDataLabel.text?.isEmpty == true {
            resultDataLabel.isHidden = true
            resultLabel.isHidden = true
        }
    }
    
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func navigationWithData(){
        if let operationViewControllerObj = storyboard?.instantiateViewController(withIdentifier: "OpertionsViewController") as? OpertionsViewController {
            guard let num1 = firstNumberTextField.text else {
                return
            }
            let number1 = Int(num1)
            guard let num2 = secondNumberTextFielField.text else {
                return
            }
            let number2 = Int(num2)
            if number1 == nil || number2 == nil{
                showAlert(title: "Warning", message: "Please enter numbers only!!!")
            } else {
                operationViewControllerObj.number1 = number1
                operationViewControllerObj.number2 = number2
                operationViewControllerObj.delegate = self
                navigationController?.pushViewController(operationViewControllerObj, animated: true)
            }
        } else {
            print("Unable to locate OpertionsViewController in storyboard!!!")
        }
    }
    
    private func validateInput(){
        if firstNumberTextField.text?.isEmpty==true||secondNumberTextFielField.text?.isEmpty==true {
            showAlert(title: "Waring", message: "Enter numbers!!!")
        } else {
            navigationWithData()
        }
    }
    
    @IBAction func operationsBtnAction(_ sender: Any) {
        validateInput()
    }
}
//
//MARK: OperationsViewControllerProtocol
//
extension HomeViewController: OperationsViewControllerProtocol {
    func passedResult(_ result: Int) {
        resultDataLabel.isHidden = false
        resultLabel.isHidden = false
        resultDataLabel.text = String(result)
    }
}
