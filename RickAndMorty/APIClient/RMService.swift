//
//  RMservice.swift
//  RickAndMorty
//
//  Created by Ole Hagemann on 13/02/2023.
//

import Foundation


//primary API service objet to get Rick And Morty data
final class RMService {
    static let shared = RMService()
    
    private init() {}
 
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
 
    }
}

