//
//  Network.swift
//  Interview
//
//  Created by Chris Anderson on 4/15/21.
//

import Foundation
import Alamofire

struct Network {
    func getContent(completion: @escaping (Result<[Chapter], Error>) -> Void) {
        AF.request("https://hallow.com/interview/data.json", method: .get)
            .responseDecodable(of: [Chapter].self) { response in
                if let error = response.error {
                    completion(.failure(error))
                }

                // TODO: Map the network request data to models
        }
    }
}
