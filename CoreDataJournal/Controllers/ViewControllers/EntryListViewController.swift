//
//  EntryListViewController.swift
//  CoreDataJournal
//
//  Created by Myles Cashwell on 4/26/21.
//

import UIKit

class EntryListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        EntryController.shared.fetchEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEntryDetailVC" {
            guard let destinationVC = segue.destination as? EntryViewController,
                  let indexPath = tableView.indexPathForSelectedRow else { return }
            let entry = EntryController.shared.entries[indexPath.row]
            destinationVC.entries = entry
        }
    }
}

//MARK: - Extensions
extension EntryListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as? EntryTableViewCell else { return UITableViewCell() }
        
        let entry = EntryController.shared.entries[indexPath.row]
        cell.configure(for: entry)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entrytoDelete = EntryController.shared.entries[indexPath.row]
            EntryController.shared.deleteEntry(entry: entrytoDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
