//
//  AccountSummaryViewController+Networking.swift
//  Bankey
//
//  Created by Dishant Nagpal on 28/11/23.
//

import Foundation
import UIKit

enum NetwokingError : Error {
    case serverError
    case decodingError
}

struct Profile : Codable {
    
    let id : String
    let firstName : String
    let lastName : String
    
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
}


extension AccountSummaryViewController {
    func fetchProfile(forUserId : String, completion : @escaping (Result<Profile,NetwokingError>)->Void){
        guard let url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(forUserId)") else{
            completion(.failure(.serverError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            DispatchQueue.main.async{
                guard error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                guard let data = data else {
                    completion(.failure(.serverError))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let profile = try decoder.decode(Profile.self, from: data)
                    completion(.success(profile))
                }
                catch{
                    completion(.failure(.decodingError))
                }
            }
        }
        task.resume()
    }
}
