import UIKit
import SnapKit
import Then
import Combine
import WebKit

protocol GoDetailWebViewProtocol: AnyObject {
    func goDetailWebView(url: String)
}

final class CarouselCollectionViewCell: UICollectionViewCell {
    var cancellables = Set<AnyCancellable>()
    weak var goDetailWebViewDelegate: GoDetailWebViewProtocol?
    
    let containerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.POINT.cgColor
    }

    let infomationLabel = WMLabel(text: "AI가 요약했어요!", textColor: .POINT, font: .t6(weight: .light))
    
    let titleLabel = WMLabel(text: "", textColor: .black, font: .t3(weight: .bold), alignment: .left).then {
        $0.lineBreakStrategy = .hangulWordPriority
        $0.numberOfLines = 0
    }
    
    let targetLabel = WMLabel(text: "참여 대상", textColor: .black, font: .t4(weight: .bold), alignment: .left, lineHeight: 20)
    let targetContentLabel = WMLabel(text: "", textColor: .black, font: .t4(weight: .light), alignment: .left).then {
        $0.lineBreakStrategy = .hangulWordPriority
        $0.numberOfLines = 0
    }

    let summaryLabel = WMLabel(text: "활동 내용", textColor: .black, font: .t4(weight: .bold), alignment: .left, lineHeight: 20)
    let summaryContentLabel = WMLabel(text: "", textColor: .black, font: .t4(weight: .light), alignment: .left).then {
        $0.lineBreakStrategy = .hangulWordPriority
        $0.numberOfLines = 0
    }
    
    let durationLabel = WMLabel(text: "운영", textColor: .black, font: .t4(weight: .bold), alignment: .left, lineHeight: 20)
    let durationContentLabel = WMLabel(text: "", textColor: .black, font: .t4(weight: .light), alignment: .left).then {
        $0.lineBreakStrategy = .hangulWordPriority
        $0.numberOfLines = 0
    }
    
    let contactLabel = WMLabel(text: "연락", textColor: .black, font: .t4(weight: .bold), alignment: .left, lineHeight: 20)
    let contactContentLabel = WMLabel(text: "", textColor: .black, font: .t4(weight: .light), alignment: .left).then {
        $0.lineBreakMode = .byTruncatingTail
        $0.lineBreakStrategy = .hangulWordPriority
        $0.numberOfLines = 0
    }
    
    var url: String = ""
    let webButton = RoundedStrokeButton(text: "상세 보기")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setLayout()
        configureUI()
        
        webButton.tapPublisher.sink { [weak self] _ in
            guard let self else { return }
            print("상세 보기 버튼 눌림", url)
            self.goDetailWebViewDelegate?.goDetailWebView(url: self.url)
        }.store(in: &cancellables)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, target: String, summary: String, duration: String, contact: String, url: String) {
        self.titleLabel.text = title
        self.targetContentLabel.text = target
        self.summaryContentLabel.text = summary
        self.durationContentLabel.text = duration
        self.contactContentLabel.text = contact
        self.url = url
    }
    
    func addViews() {
        contentView.addSubview(infomationLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(targetLabel)
        contentView.addSubview(targetContentLabel)
        contentView.addSubview(summaryLabel)
        contentView.addSubview(summaryContentLabel)
        contentView.addSubview(durationLabel)
        contentView.addSubview(durationContentLabel)
        contentView.addSubview(contactLabel)
        contentView.addSubview(contactContentLabel)
        
        contentView.addSubview(webButton)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalToSuperview().offset(66)
        }
        
        infomationLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(44)
        }
        
        // 참여 대상
        targetLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        targetContentLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().offset(20)
            $0.top.equalTo(targetLabel.snp.bottom)
        }
        
        // 활동 내용
        summaryLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(targetContentLabel.snp.bottom).offset(10)
        }
        
        summaryContentLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().offset(20)
            $0.top.equalTo(summaryLabel.snp.bottom)
        }
        
        // 운영
        durationLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(summaryContentLabel.snp.bottom).offset(10)
        }
        
        durationContentLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().offset(20)
            $0.top.equalTo(durationLabel.snp.bottom)
        }
        
        // 연락
        contactLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(durationContentLabel.snp.bottom).offset(10)
        }
        
        contactContentLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().offset(20)
            $0.top.equalTo(contactLabel.snp.bottom)
            $0.bottom.equalTo(webButton.snp.top).priority(.low)
        }
        
        // 웹 이동 버튼
        webButton.snp.makeConstraints {
            $0.width.equalTo(250)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
        }
        
    }
    
    func configureUI() {
        self.backgroundColor = .clear
    }
    
}
