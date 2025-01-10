import UIKit
import SnapKit
import Then
import Combine

final class CustomizedNoticeView: UIView {
    let appState = AppState.shared
    var cancellables = Set<AnyCancellable>()
    
    let customNavigationBar: CustomNavigationBar
    
    let titleLabel = WMLabel(text: "AI가 키워드를 기준으로 추천했어요!", textColor: .POINT, font: .t1(weight: .bold), alignment: .center, lineHeight: 22)
    
    let keywordLabel = WMLabel(text: "", textColor: .black, font: .t6(weight: .light), alignment: .right, lineHeight: 12).then {
        $0.lineBreakMode = .byTruncatingTail
        $0.numberOfLines = 1
    }
    
    let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal // 가로 스크롤
            layout.minimumLineSpacing = 10 // 셀 간 간격
            return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }().then {
        $0.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: "\(CarouselCollectionViewCell.self)")
        $0.backgroundColor = .clear
    }
    
    init(
        title: String? = nil,
        subTitle: String? = nil
    ) {
        customNavigationBar = CustomNavigationBar(title: title, subTitle: subTitle)
        
        super.init(frame: .zero)
        
        addViews()
        setLayout()
        configureUI()
        
        let keywords = appState.selectedKeywords.joined(separator: ", ")
        let keywordsMessage = "\(keywords) 등"
        keywordLabel.text = keywordsMessage
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(_ delegate: UICollectionViewDelegate) {
        collectionView.delegate = delegate
    }
    
    func setDataSource(_ dataSource: UICollectionViewDataSource) {
        collectionView.dataSource = dataSource
    }
    
    func addViews() {
        self.addSubview(customNavigationBar)
        self.addSubview(titleLabel)
        self.addSubview(keywordLabel)
        self.addSubview(collectionView)
    }
    
    func setLayout() {
        customNavigationBar.snp.makeConstraints {
            $0.height.equalTo(85)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(customNavigationBar.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        keywordLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(keywordLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().offset(-40)
        }
    }
    
    func configureUI() {
        self.backgroundColor = .background
    }
}
