//
//  ReusableID.swift
//  TestRxDatasource
//
//  Created by 최형우 on 2021/12/22.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit

protocol reuseIdentifiable{
    static var ReusableID: String { get }
}

extension reuseIdentifiable{
    static var ReusableID: String{
        return String(describing: self)
    }
}

extension UITableViewCell: reuseIdentifiable {}
extension UICollectionViewCell: reuseIdentifiable {}
