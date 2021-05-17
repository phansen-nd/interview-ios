//
//  Network.swift
//  Interview
//
//  Created by Chris Anderson on 4/15/21.
//

import Foundation
import Alamofire

struct Network {
    func getContent(completion: @escaping (Result<[Day], Error>) -> Void) {
        AF.request("https://hallow.com/interview/activity.json", method: .get)
            .responseDecodable(of: [Day].self) { response in
                if let error = response.error {
                    completion(.failure(error))
                }

                print(response.result)
                // TODO: Finish passing results back & map to months
        }
    }
}
