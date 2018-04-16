//
//  DataManager.swift
//  Contacts
//
//  Created by Eric Gregor on 2018-04-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

import UIKit
import CoreData

class DataManager {
    static var contacts: [Contact] = []

    static func fetchContacts() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext

        let lastNameSort = NSSortDescriptor(key: "lastName", ascending: true)
        let firstNameSort = NSSortDescriptor(key: "firstName", ascending: true)
        
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        fetchRequest.sortDescriptors = [lastNameSort, firstNameSort]

        do {
            let contactsArray = try context?.fetch(fetchRequest)
            DataManager.contacts = contactsArray ?? []
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    static func addContact(lastName: String, firstName: String, email: String, phone: String, notes: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Contact", in: context!)
        
        let newContact = Contact(entity: entity!, insertInto: context)
        
        newContact.lastName = lastName
        newContact.firstName = firstName
        newContact.email = email
        newContact.phone = phone
        newContact.notes = notes
        
        do {
            try context?.save()
        }
        catch let error as NSError {
            fatalError("Error: \(error.localizedDescription)")
        }
        
        DataManager.contacts.append(newContact)
    }
    
    static func deleteContact(contact: Contact) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext

        context?.delete(contact)
        
        do {
            try context?.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
