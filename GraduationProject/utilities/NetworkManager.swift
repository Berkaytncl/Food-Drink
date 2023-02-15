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

    func APICall<T: Codable>(type: ItemType, parameters:[String:Any]? = nil, handler: @escaping (_ result: T) -> (Void)) {
        
        AF.request(type.url, method: type.httpMethod, encoding: type.encoding).response { response in
            switch response.result {
            case .success(_):
                if let data = response.data {
                    do {
                        let decode = try JSONDecoder().decode(T.self, from: data)
                        handler(decode)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

enum ItemType {
    case bringAllFoodURL
    case bringTheBasketURL
    case addToBasketURL
    case deleteFromBasketURL
}

protocol ItemProperties {
    var url: String { get }
    var httpMethod: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
}

extension ItemType: ItemProperties {
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
    
    var encoding: Alamofire.ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
}
