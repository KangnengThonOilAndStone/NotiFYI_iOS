import UIKit
import SnapKit
import Then

final class RoundedRectangleButton: UIView {
//    let contentView = UIView().then {
//        $0.backgroundColor = .white.withAlphaComponent(0.8)
//    }
    
    let highlightLabel = WMLabel(
        text: "",
        textColor: .POINT,
        font: .t1_1(weight: .bold),
        alignment: .center,
        lineHeight: UIFont.FontSystem.t1_1(weight: .bold).lineHeight,
        kernValue: -0.5
    )
    
    let defaultLabel = WMLabel(
        text: "",
        textColor: .black,
        font: .t1_1(weight: .bold),
        alignment: .left,
        lineHeight: UIFont.FontSystem.t1_1(weight: .bold).lineHeight,
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
//        self.addSubview(contentView)
//        contentView.addSubview(defaultLabel)
//        contentView.addSubview(highlightLabel)
//        contentView.addSubview(arrowImageView)
//        contentView.addSubview(emojiImageView)
        self.addSubview(defaultLabel)
        self.addSubview(highlightLabel)
        self.addSubview(arrowImageView)
        self.addSubview(emojiImageView)
    }
    
    func setLayout() {
//        contentView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
        
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
        self.backgroundColor = .white.withAlphaComponent(0.8)
        
        //self.layer.shadowOpacity = 0.25
        //self.clipsToBounds = true
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor

        self.layer.cornerRadius = 20
//        self.clipsToBounds = true
    }
    
}
