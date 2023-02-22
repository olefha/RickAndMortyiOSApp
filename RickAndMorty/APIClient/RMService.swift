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
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
 
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting rmType: T.Type,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            do {
                let jsonResult = try JSONDecoder().decode(rmType.self, from: data)
                //completion(.success(jsonResult as! String)) //feeeeil
            }
            catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
    
}

