//
//  DatabaseService.swift
//  SixtApp
//
//  Created by muhammad Yawar on 1/31/23.
//

import Foundation

protocol DatabaseService {
    
    associatedtype Entity
    
    typealias UpdateHandler = ((Entity, _ index: Int) -> Void)
    
    func createAll(entityType: Entity.Type,
                   objectCount: Int,
                   updateEntityHandler: UpdateHandler) throws
    
    func fetch(request: DatabaseRequest, )
}
