import UIKit
import SnapKit

class DetailListCellView: UIView {
    
    // MARK: - Properties
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
     // MARK: - Card section
    lazy var cardIconView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var cardIconImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    // MARK: - separator
    
    private lazy var lineSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
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

    @objc func onTouchCell(_ sender: UITapGestureRecognizer){
          delegate?.didSelectItem(item: self.item)
    }

}

// MARK: - configurations
extension DetailListCellView: ViewConfiguration {
    
    func configureViews() {
        backgroundColor = .white
        loadImage(urlToLoad: item.url ?? "https://api.nasa.gov/planetary/apod/static/default_apod_image.jpg")
    }
    
    func loadImage(urlToLoad: String) {
        do {
            let url = URL(string:urlToLoad)
            let data = try Data(contentsOf: url!)
            self.cardIconImageView.image = UIImage(data: data)
        }
        catch{
            print(error)
        }
    }
    
    func buildViewHierarchy() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(cardIconView)
        cardIconView.addSubview(cardIconImageView)
        addSubview(lineSeparator)
    }
    
    func setupConstraints() {
       
        containerStackView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(23)
            make.trailing.equalToSuperview().offset(-19)
        }

        cardIconView.snp.makeConstraints { (make) in
            make.width.equalTo(0)
            make.top.bottom.equalToSuperview()
        }

        cardIconImageView.snp.makeConstraints { (make) in
            make.height.equalTo(64)
            make.center.equalToSuperview()
        }
        
        lineSeparator.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    
    }
}
