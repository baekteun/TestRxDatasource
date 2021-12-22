//
//  MySection.swift
//  TestRxDatasource
//
//  Created by 최형우 on 2021/12/22.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxDataSources

struct MySection{
    let header: String
    var items: [Item]
}


extension MySection: AnimatableSectionModelType{
    init(original: MySection, items: [Int]) {
        self = original
        self.items = items
    }
    
    typealias Item = Int
    
    var identity: String{
        return header
    }
    
    
}
