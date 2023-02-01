//
//  CoreDataService.swift
//  SixtApp
//
//  Created by muhammad Yawar on 1/31/23.
//

import Foundation
import CoreData

struct CoreDataServiceImpl: DatabaseService {
    
    typealias Entity = NSManagedObject
    
    let coredataStack: CoreDataStack
    
    func createAll(entityType: Entity.Type,
                   objectCount: Int,
                   updateEntityHandler: UpdateHandler) throws {
        
        let context = coredataStack.backgroundContext
        try context.performAndWait {
            
            for index in 0..<objectCount {
                
                let entity = entityType.init(context: context)
                updateEntityHandler(entity, index)
            }
            try save(context: context)
        }
    }
}

extension CoreDataServiceImpl {
    
    func save(context: NSManagedObjectContext) throws {
        
        guard context.hasChanges else { return }
        try context.save()
    }
}

public final class CoreDataStack {
    
    let modelFileName: String
    
    init(fileName: String) {
        
        modelFileName = fileName
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: modelFileName)
            container.loadPersistentStores { description, error in
                if let error = error {
                    fatalError("Unable to load persistent stores: \(error)")
                }
            }
            return container
    }()
    
    var viewContext: NSManagedObjectContext {
        
        return persistentContainer.viewContext
    }
    var backgroundContext: NSManagedObjectContext {
        
        return persistentContainer.newBackgroundContext()
    }
}
