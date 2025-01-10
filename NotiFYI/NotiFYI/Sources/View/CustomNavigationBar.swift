import UIKit
import SnapKit
import Then

final class CustomNavigationBar: UIView {
    let arrowImageView = UIImageView(image: .arrowLeft)
    
    let vStackView = UIStackView()
    
    let titleLabel = WMLabel(text: "", textColor: .black, font: .t3(weight: .bold), alignment: .center, lineHeight: 24)
    let subTitleLabel = WMLabel(text: "", textColor: .gray500, font: .t5(weight: .medium), alignment: .center, lineHeight: 16)
    
    init(title: String? = nil, subTitle: String? = nil) {
        super.init(frame: .zero)
        titleLabel.text = title
        subTitleLabel.text = subTitle
        addViews()
        setLayout()
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        self.addSubview(arrowImageView)
        self.addSubview(vStackView)
        
        if titleLabel.text != nil {
            vStackView.addArrangedSubview(titleLabel)
        }
        
        if subTitleLabel.text != nil {
            vStackView.addArrangedSubview(subTitleLabel)
        }
    }
    
    func setLayout() {
        arrowImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(32)
            $0.centerY.equalToSuperview()
        }
        vStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(arrowImageView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().inset(72)
        }
    }
    
    func configureUI() {
        self.backgroundColor = .clear
        
        vStackView.axis = .vertical
        vStackView.distribution = .fill
        vStackView.spacing = 5
    }
}
