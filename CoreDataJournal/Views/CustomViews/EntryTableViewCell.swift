//
//  EntryTableViewCell.swift
//  CoreDataJournal
//
//  Created by Myles Cashwell on 4/26/21.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    
    //MARK: - Functions
    func configure(for entry: Entry) {
        titleLabel.text = entry.entryTitle
        timeStampLabel.text = entry.entryTimeStamp?.formatToString()
    }
}
