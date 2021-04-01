//
//  ViewController.swift
//  UnitTestingDemo
//
//  Created by Aireddy Saikrishna on 01/04/21.
//

import UIKit
import CoreData

enum LoginStatus {
    case login
    case logout
}
class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var username = "sai"
    var password = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        if validateLogin(username, password) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func checkValidation(_ loginStatus: LoginStatus)->Bool {
        switch loginStatus {
        case .login:
            return true
        case .logout:
            return false
        @unknown default:
            return false
        }
    }
    
    func validateLogin(_ username: String,_ password: String)->Bool {
        guard usernameTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false else {
            AlertDialog.show("Please enter credentials")
            return false
        }
        guard let user = usernameTextField.text, let pass = passwordTextField.text else { return false }
        guard user == username && pass == password else {
            AlertDialog.show("Invalid Credentials")
            return false
        }
        return true
    }
}

extension ViewController : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

extension ViewController : DataBase {
    func save() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)!
        let managedObject = NSManagedObject(entity: entity, insertInto: context)
        managedObject.setValue("sai", forKey: "username")
        do {
            try context.save()
        } catch let err {
            
        }
    }
    
    func retrieve()->[NSManagedObject] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            return try (context.fetch(fetchRequest) as? [NSManagedObject])!
        }catch let _{ }
        return []
    }
}

protocol DataBase {
    func save()
    func retrieve()->[NSManagedObject]
}
