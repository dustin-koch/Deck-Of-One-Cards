//
//  PersonController.swift
//  DeckOfOneCard
//
//  Created by Dustin Koch on 5/13/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import Foundation


class PersonController {
    
    static let shared = PersonController()
    let baseURL = "https://swapi.co/api/"
    
    //MARK: - CRUD Functions (fetching from API)
    func fetchPersonWith(identifier: Int, completion: @escaping (Person?) -> Void) {
        guard var url = URL(string: baseURL) else { completion(nil); return }
        url.appendPathComponent("people")
        url.appendPathComponent("\(identifier)")
        
        let dataTask = URLSession.shared.dataTask(with: url) {
            (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = data else { completion(nil); return }
            let jsonDecoder = JSONDecoder()
            do {
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            } catch {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
        }
        dataTask.resume()
    }
    
}
