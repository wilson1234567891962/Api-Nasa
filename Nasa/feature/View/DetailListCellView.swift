import UIKit
import SnapKit

class DetailListCellView: UIView {
    
    
    // MARK: - Properties
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var containerSubItem: UIStackView = {
             let stackView = UIStackView()
             stackView.axis = .vertical
             return stackView
    }()
    
    private lazy var subContainerView: UIView = {
            let cardContainerView = UIView()
            return cardContainerView
    }()
    
    private lazy var titleHeader: UILabel = {
           let label = UILabel()
           label.textColor = .red
           label.numberOfLines = 2
           return label
    }()
    
    private lazy var valueTitle: UILabel = {
           let label = UILabel()
           label.textColor = .red
           label.numberOfLines = 2
           return label
    }()
    
    private lazy var dateHeader: UILabel = {
        let label = UILabel()
        label.textColor = .red
        return label
    }()
       
    private lazy var dateValue: UILabel = {
       let label = UILabel()
       label.textColor = .red
       return label
    }()
       
    private lazy var lineSeparator: UIView = {
           let view = UIView()
        view.backgroundColor = .black
           return view
    }()
    
    private var item: DetailModel
    private var delegate: DetailViewDelegate?
    
    // MARK: - init
    init( delegate: DetailViewDelegate? , item: DetailModel) {
        self.delegate = delegate
        self.item = item
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - configurations
extension DetailListCellView: ViewConfiguration {
    
    func configureViews() {
        backgroundColor = .white
        titleHeader.text = "Titulo: "
        valueTitle.text = self.item.title
        dateHeader.text = "Fecha: "
        dateValue.text =  self.item.date
    }
    
    func buildViewHierarchy() {
        addSubview(containerStackView)
        addSubview(containerSubItem)
        addSubview(lineSeparator)
    
        containerSubItem.addArrangedSubview(subContainerView)
        
        subContainerView.addSubview(titleHeader)
        subContainerView.addSubview(valueTitle)
        subContainerView.addSubview(dateHeader)
        subContainerView.addSubview(dateValue)
    }
    
    func setupConstraints() {
        
        containerStackView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(23)
            make.trailing.equalToSuperview().offset(-19)
        }
        
       containerSubItem.snp.makeConstraints { (make) in
            make.height.equalTo(32)
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-66)
            make.bottom.equalTo(subContainerView.snp.top).offset(-20)
        }
        
        subContainerView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-66)
            make.bottom.equalTo(self.snp.bottomMargin).offset(-24)
        }
      
        titleHeader.snp.makeConstraints { (make) in
            make.height.equalTo(16)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalTo(valueTitle.snp.leading).offset(-8)
            make.bottom.equalTo(dateHeader.snp.top).offset(-8)
        }
        
        valueTitle.snp.makeConstraints { (make) in
            make.height.equalTo(16)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(dateValue.snp.top).offset(-8)
        }
        
        dateHeader.snp.makeConstraints { (make) in
            make.height.equalTo(16)
            make.leading.equalToSuperview()
            make.trailing.equalTo(dateValue.snp.leading).offset(-6)
        }
               
        dateValue.snp.makeConstraints { (make) in
             make.height.equalTo(16)
             make.trailing.equalToSuperview()
        }
        
        lineSeparator.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
              
    }
}

