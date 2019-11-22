//
//  PeopleVC.swift
//  ViperWithRXSwift
//
//  Created by Anderson F Carvalho on 19/11/19.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PeopleVC: UIViewController {
    
    private let cellName = "cell"
    let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!
    let presenter = PeoplePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellName)
        
        
        
        presenter.getPeople().bind(to: tableView.rx.items(cellIdentifier: cellName, cellType: UITableViewCell.self)) { (row, element, cell) in
            
            cell.textLabel?.text = element.name
        }.disposed(by: disposeBag)
        
        
    }
    
    

}
