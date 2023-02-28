//
//  NetworkManager.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 10.02.2023.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func APICall<T: Codable>(type: APICallType, parameters:[String:Any]? = nil, handler: @escaping (_ result: T?) -> ()) {
        AF.request(type.url, method: type.httpMethod, parameters: parameters).response { response in
            switch response.result {
            case .success(_):
                if let data = response.data {
                    do {
                        let decode = try JSONDecoder().decode(T.self, from: data)
                        handler(decode)
                    } catch {
                        handler(nil)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

enum APICallType {
    case bringAllFoodURL
    case bringTheBasketURL
    case addToBasketURL
    case deleteFromBasketURL
}

protocol APICallProperties {
    var url: String { get }
    var httpMethod: HTTPMethod { get }
}

extension APICallType: APICallProperties {
    var url: String {
        switch self {
        case .bringAllFoodURL:
            return Constants.URLs.bringAllFoodURL
        case .bringTheBasketURL:
            return Constants.URLs.bringTheBasketURL
        case .addToBasketURL:
            return Constants.URLs.addToBasketURL
        case .deleteFromBasketURL:
            return Constants.URLs.deleteFromBasketURL
        }
    }
    
    var httpMethod: Alamofire.HTTPMethod {
        switch self {
        case .bringAllFoodURL:
            return .get
        case .bringTheBasketURL, .addToBasketURL, .deleteFromBasketURL:
            return .post
        }
    }
}
