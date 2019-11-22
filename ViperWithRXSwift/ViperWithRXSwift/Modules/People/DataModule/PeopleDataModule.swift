//
//  PeopleDataModule.swift
//  ViperWithRXSwift
//
//  Created by Anderson F Carvalho on 19/11/19.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public enum ToPresenterError: Error {
     case error
}

class PeopleDataModule {
    
    let disposeBag = DisposeBag()
    
    
    func requestFetch() -> Observable<People> {
        let apiRequest = APIRequest()
        apiRequest.baseURL = URL(string: "http://webhook.site/4d87d1ad-24aa-4ec0-8839-bfdac4670d41")
        
        let result: Observable<People> = APICalling().fetch(apiRequest: apiRequest)
        
        return result
    }
}
