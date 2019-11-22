//
//  PeoplePresenter.swift
//  ViperWithRXSwift
//
//  Created by Anderson F Carvalho on 19/11/19.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PeoplePresenter {
    
    let disposeBag = DisposeBag()
    
    func getPeople() -> Observable<[Person]> {
        let peopleDataModule = PeopleDataModule()
        
        return Observable.create { obs in
            
            
            
            peopleDataModule.requestFetch().subscribe(onNext: { (people) in
                return obs.onNext(people.people ?? [])
            }, onError: { (error) in
                print(error)
            })
        }
        
    }
    
    func getTeste() -> Observable<[String]> {
        return Observable.just(["Teste 1", "Teste 2"])
    }
    
}
