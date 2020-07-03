import UIKit
import SnapKit

class DetailListView: UIView {
    
    // MARK: - Properties
    private(set) lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.distribution = .fill
        return stackView
    }()
    
    private var items: [DetailModel]?
    private var delegate: DetailViewDelegate?
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func setup(delegate: DetailViewDelegate?, item: [DetailModel]) {
        self.delegate = delegate
        self.items = item
        setupViewConfiguration()
    }
    
}
// MARK: - View Configuration
extension DetailListView: ViewConfiguration {
    
    func configureViews(){
        self.renderList()
    }
    
    func buildViewHierarchy() {
        addSubview(verticalStackView)
    }
    
    func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func renderList(){
        guard let itemList = self.items else {
                return
        }
        
        for itemCell in itemList{
            let detailListCell = DetailListCellView(delegate: delegate, item: itemCell)
            verticalStackView.addArrangedSubview(detailListCell)
            detailListCell.snp.makeConstraints { (make) in
                make.height.equalTo(91)
                make.width.equalToSuperview()
            }
        }
    }
    
}
