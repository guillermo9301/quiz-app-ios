//
//  ResultDataController.swift
//  EP3_PRACTICE
//
//  Created by Guillermo on 9/12/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ResultsModel")
    
    init () {
        container.loadPersistentStores {description, error in
            if let error = error {
                print("F no cargó la data \(error.localizedDescription)")
            }
        }
    }
    
    func saveResult(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Se grabo la data wuu!")
        } catch {
            let nsError = error as NSError
            fatalError("Error raro \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addResult(name: String, score: Int16, date: Date, context: NSManagedObjectContext ) {
        let result = Results(context: context)
        result.id = UUID()
        result.name = name
        result.date = Date()
        result.score = score
        
        saveResult(context: context)
    }
}
