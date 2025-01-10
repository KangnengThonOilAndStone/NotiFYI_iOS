import UIKit
import SnapKit
import Then

final class NoticeCell: UITableViewCell {
    var category: NoticeCategory!
    
    let containerView = UIView().then {
        $0.backgroundColor = .white
            //.withAlphaComponent(0.8)
        $0.layer.cornerRadius = 12
    }
    
    let categoryBackgroundView = UIView().then {
        $0.layer.cornerRadius = 7
    }
    
    let categoryLabel = WMLabel(
        text: "",
        textColor: .black,
        font: .t6(weight: .bold)
    ).then {
        $0.lineBreakMode = .byTruncatingTail
    }
    
    let titleLabel = WMLabel(
        text: "",
        textColor: .black,
        font: .t3(weight: .bold),
        kernValue: -0.5
    ).then {
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
    }
    
    let descriptionLabel = WMLabel(
        text: "",
        textColor: .gray600,
        font: .t5(weight: .medium)
    ).then {
        $0.numberOfLines = 2
        $0.lineBreakMode = .byTruncatingTail
        $0.lineBreakStrategy = .hangulWordPriority
    }
    
    let viewsLabel = WMLabel(
        text: "",
        textColor: .gray500,
        font: .t6(weight: .light)
    ).then {
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setLayout()
        configureUI()
        setAction()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
        self.viewsLabel.text = nil
    }
    
    func configure(category: NoticeCategory, title: String, summary: String, views: Int) {
        self.category = category
        categoryBackgroundView.backgroundColor = category.color
        categoryLabel.text = category.rawValue
        
        self.titleLabel.text = title
        self.descriptionLabel.text = summary
        self.viewsLabel.text =  "현재 \(views) 명이 조회했어요!"
    }
    
}

private extension NoticeCell {
    func addViews() {
        self.contentView.addSubview(containerView)
        containerView.addSubview(categoryBackgroundView)
        categoryBackgroundView.addSubview(categoryLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(viewsLabel)
    }
    
    func setLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        categoryBackgroundView.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(20)
            $0.top.leading.equalToSuperview().offset(10)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(categoryBackgroundView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
        
        viewsLabel.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(10)
        }
        
    }
    
    func configureUI() {
        self.backgroundColor = .clear
        self.layer.addShadow(color: .black, alpha: 0.15, x: 4, y: 4, blur: 20, spread: 0)
    }
    
    func setAction() {
        
    }
}
