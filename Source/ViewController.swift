import UIKit
import Then
import RxDataSources
import RxCocoa
import RxSwift
import SnapKit

class ViewController: UIViewController {
    
    private let tableView = UITableView().then {
        $0.register(TestTableCell.self, forCellReuseIdentifier: TestTableCell.ReusableID)
    }
    
    private let dataSources  = RxTableViewSectionedReloadDataSource<MySection>(configureCell: {
        source, tableview, index, item in
        let cell = tableview.dequeueReusableCell(withIdentifier: TestTableCell.ReusableID, for: index) as! TestTableCell
        cell.testLabel.text = "\(item)"
        
        return cell
    })
    
    private let disposeBag: DisposeBag = .init()
    
    private let testData = [
        MySection(header: "Test", items: [1, 2, 3, 4, 5]),
        MySection(header: "Test2", items: [5, 3, 4, 1, 2]),
        MySection(header: "Test3", items: [5, 3, 11, 1, 2]),
        MySection(header: "Test4", items: [5, 2, 4, 1, 2])
    ]
    
    private let relay = BehaviorRelay<[MySection]>(value: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        view.backgroundColor = .white
        relay.accept(testData)
        
        dataSources.titleForHeaderInSection = { ds, i in
            return ds.sectionModels[i].header
        }
        
        dataSources.sectionIndexTitles = { ds in
            return ds.sectionModels.map { $0.header }
        }
        
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        relay
            .bind(to: tableView.rx.items(dataSource: dataSources))
            .disposed(by: disposeBag)
    }

}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = dataSources[indexPath]
        
        return CGFloat(40 + item*10)
    }
}
