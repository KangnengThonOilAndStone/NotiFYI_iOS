import UIKit
import SnapKit
import Then

final class RoundedRectangleButton: UIButton {
    let contentView = UIView().then {
        $0.isUserInteractionEnabled = false
        $0.backgroundColor = .white.withAlphaComponent(0.8)
        $0.layer.cornerRadius = 20
    }
    
    let highlightLabel = WMLabel(
        text: "",
        textColor: .POINT,
        font: .t3(weight: .bold),
        alignment: .center,
        lineHeight: 25,
        kernValue: -0.5
    )
    
    let defaultLabel = WMLabel(
        text: "",
        textColor: .black,
        font: .t3(weight: .bold),
        alignment: .left,
        lineHeight: 25,
        kernValue: -0.5
    ).then {
        $0.numberOfLines = 0
        $0.lineBreakStrategy = .hangulWordPriority
    }
    
    let arrowImageView = UIImageView(image: .arrowRightGray)
    
    let emojiImage: UIImage

    lazy var emojiImageView = UIImageView(image: emojiImage)
    
    init(emojiImage: UIImage) {
        self.emojiImage = emojiImage
        super.init(frame: .zero)
        addViews()
        setLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHighlightText(_ text: String) {
        self.highlightLabel.text = text
    }

    func setText(_ text: String) {
        self.defaultLabel.text = text
    }
    
    func addViews() {
        self.addSubview(contentView)
        contentView.addSubview(defaultLabel)
        contentView.addSubview(highlightLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(emojiImageView)
    }
    
    func setLayout() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        highlightLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(12)
        }
        defaultLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(12)
            $0.trailing.equalTo(arrowImageView.snp.leading).offset(5)
        }
        arrowImageView.snp.makeConstraints {
            $0.width.equalTo(23)
            $0.height.equalTo(20)
            $0.top.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(16.5)
        }
        emojiImageView.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.bottom.trailing.equalToSuperview().inset(20)
        }
        
    }
    
    func configureUI() {
        self.backgroundColor = .clear
        
        contentView.layer.addShadow(color: .black, alpha: 0.15, x: 4, y: 4, blur: 20, spread: 0)
    }
    
}
