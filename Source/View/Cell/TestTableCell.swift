//
//  TestTableCell.swift
//  TestRxDatasource
//
//  Created by 최형우 on 2021/12/22.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import Then
import SnapKit

final class TestTableCell: UITableViewCell{
    let testLabel = UILabel().then {
        $0.textAlignment = .center
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        setLayout()
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TestTableCell{
    func addView(){
        [testLabel].forEach{ addSubview($0) }
    }
    func setLayout(){
        testLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    func configureCell(){
        
    }
}
