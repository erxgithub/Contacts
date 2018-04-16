//
//  DetailViewController.swift
//  Contacts
//
//  Created by Eric Gregor on 2018-04-15.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

import UIKit

protocol ContactProtocol {
    func addContact(lastName: String, firstName: String, email: String, phone: String, notes: String)
}

class DetailViewController: UIViewController {

    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var notes: UITextView!
    
    var delegate: ContactProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        if delegate != nil {
            let lastName = self.lastName.text ?? ""
            let firstName = self.firstName.text ?? ""
            let email = self.email.text ?? ""
            let phone = self.phone.text ?? ""
            let notes = self.notes.text ?? ""
            
            delegate?.addContact(lastName: lastName, firstName: firstName, email: email, phone: phone, notes: notes)
            navigationController?.popViewController(animated: true)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
