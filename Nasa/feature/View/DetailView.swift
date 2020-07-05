import Foundation
import SnapKit

class DetailView: UIView {
    
    // MARK: - Properties
    
    private(set) lazy var tableView: DetailTableView = {
        let tableView = DetailTableView(delegate: self.delegate)
        return tableView
    }()
    
    private var delegate: DetailViewDelegate?
    
    // MARK: - init
    init(delegate: DetailViewDelegate? ) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constraints
extension DetailView: ViewConfiguration {
    
    func configureViews() {
        self.backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
