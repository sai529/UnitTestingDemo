//
//  AlertDialog.swift
//  UnitTestingDemoUITests
//
//  Created by Aireddy Saikrishna on 01/04/21.
//

import Foundation
import UIKit

class AlertDialog {
    
    static func show(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            
        }
        alert.addAction(action)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
}
