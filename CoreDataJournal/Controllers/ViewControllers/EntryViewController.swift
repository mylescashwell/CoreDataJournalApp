//
//  EntryViewController.swift
//  CoreDataJournal
//
//  Created by Myles Cashwell on 4/26/21.
//

import UIKit

class EntryViewController: UIViewController {
    
    //MARK: - Properties
    var entries: Entry?
    
    //MARK: - Outlets
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryBodyTextView: UITextView!
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    //MARK: - Actions
    @IBAction func clearTextButton(_ sender: Any) {
        entryTitleTextField.text = ""
        entryBodyTextView.text = ""
    }
    @IBAction func saveButton(_ sender: Any) {
        guard let entryTitle = entryTitleTextField.text, !entryTitle.isEmpty,
              let entryBody = entryBodyTextView.text, !entryBody.isEmpty else { return }
        if let entry = entries {
            entry.entryTitle = entryTitle
            entry.entryBodyText = entryBody
            EntryController.shared.updateEntry(entry)
        } else {
            EntryController.shared.createEntry(title: entryTitle, body: entryBody)
        }
        navigationController?.popViewController(animated: true)
    }
    

    //MARK: - Functions
    func updateViews() {
        guard let entry = entries else { return }
        entryTitleTextField.text = entry.entryTitle
        entryBodyTextView.text = entry.entryBodyText
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
