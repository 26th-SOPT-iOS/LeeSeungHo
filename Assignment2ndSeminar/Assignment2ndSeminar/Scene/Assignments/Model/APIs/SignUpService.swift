//
//  SignUpService.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/05/19.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation
import Alamofire

struct SignUpService {
    
    static let signupservice = SignUpService()
    
    private func makeParameter(_ id: String,_ pwd: String,_ name: String,_ email: String,_ phone: String) -> Parameters {
        return ["id": id,
                "password": pwd,
                "name": name,
                "email": email,
                "phone": phone
        ]  
    }
    
    func signUp(id: String, pwd: String, name: String, email: String, phone: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: makeParameter(id, pwd, name, email, phone), encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { DataResponse in
            switch DataResponse.result {
            case .success:
                guard let statusCode = DataResponse.response?.statusCode else { return }
                guard let data = DataResponse.result.value else { return }
                
                let networkResult = self.judge(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error): completion(.networkFail)
                
            }
        }
    }
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200:
            return isSignUp(by: data)
        case 400:
            return .pathErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    private func isSignUp(by data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignUpData.self, from: data) else { return .pathErr }
        
        if decodedData.success {
            return .success(decodedData.message)
        } else {
            return .requestErr(decodedData.message)
            
        }
    }
}
