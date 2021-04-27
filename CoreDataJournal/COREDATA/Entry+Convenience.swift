//
//  Entry+Convenience.swift
//  CoreDataJournal
//
//  Created by Myles Cashwell on 4/26/21.
//

import CoreData

extension Entry {
    @discardableResult convenience init(entryTitle: String, entryBodyText: String, entryTimeStamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context, uuid: String = UUID().uuidString) {
        self.init(context: context)
        self.entryTitle = entryTitle
        self.entryBodyText = entryBodyText
        self.entryTimeStamp = entryTimeStamp
        self.uuid = uuid
    }
}

extension Entry {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
