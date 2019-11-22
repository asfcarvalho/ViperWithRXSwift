//
//  APICalling.swift
//  ViperWithRXSwift
//
//  Created by Anderson F Carvalho on 19/11/19.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class APICalling {
    // create a method for calling api which is return a Observable
    func fetch<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: apiRequest.baseURL)
            
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let data = data, error == nil else {
                    observer.onError(error!)
                    return
                    
                }
                
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    observer.onNext( model )
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create()
        }
    }
}
