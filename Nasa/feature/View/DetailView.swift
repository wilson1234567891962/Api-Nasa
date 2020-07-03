import UIKit
import SnapKit

class DetailView: UIView {
    // MARK: - properties
    private(set) lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        return view
    }()
    
    private(set) lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: - First section
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var lineSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    // MARK: - Second section
    
    private lazy var detailListView: DetailListView = {
        let view = DetailListView()
        return view
    }()
    
    private weak var delegate: DetailViewDelegate?
    // MARK: - init
    
    init(delegate: DetailViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     // MARK: - Setup View
    
    func setupView(cards: [DetailModel]) {
        detailListView.setup(delegate: delegate, item: cards)
    }
    
}

// MARK: - View Configuration
extension DetailView: ViewConfiguration {
    func configureViews(){
        titleLabel.text = "NASA API"
    }
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(lineSeparator)
        containerView.addSubview(detailListView)
        
    }
    func setupConstraints() {
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
        }
        
        lineSeparator.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(0)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        detailListView.snp.makeConstraints { (make) in
            make.top.equalTo(lineSeparator.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
    }
}
