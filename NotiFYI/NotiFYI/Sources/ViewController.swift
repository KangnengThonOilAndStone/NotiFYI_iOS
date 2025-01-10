import UIKit
import SnapKit
import Then
import Tabman
import Pageboy

class ViewController: TabmanViewController {
    let backgroundView = UIView()
    let backgroundCircleBlurView = UIImageView(image: .blur)
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let nicknameLabel = UILabel().then {
        $0.text = "임시 개발하는 공룡"
        $0.textColor = .black
        $0.font = UIFont.FontSystem.t1(weight: .bold).font
        $0.textAlignment = .left
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
    }
    
    let studentInfoLabel = UILabel().then {
        $0.text = "소프트웨어응용학부・4학년"
        $0.textColor = .gray600
        $0.font = UIFont.FontSystem.t4(weight: .medium).font
        $0.textAlignment = .left
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
    }
    
    let profileImageView = UIImageView(image: .yang)
    
    let hStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 5
        $0.alignment = .center
    }
    
    let chattingButton = RoundedRectangleButton(emojiImage: .robot)
    
    let customizedNoticeButton = RoundedRectangleButton(emojiImage: .eye)
    
    let noticeTitleLabel = UILabel().then {
        $0.text = "공지사항"
        $0.font = UIFont.FontSystem.t1(weight: .bold).font
        $0.textAlignment = .left
    }
    
    let noticeSubTitleLabel = UILabel().then {
        $0.text = "AI가 공지사항 내용을 한 줄로 요약했어요"
        $0.font = UIFont.FontSystem.t4(weight: .medium).font
        $0.textAlignment = .left
    }
        
    let tabBarView = UIView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        addViews()
        setLayout()
        configureUI()
        configureTabman()
    }
    
    /// Tabman 페이지 변경 감지 메소드
    override func pageboyViewController(
        _ pageboyViewController: PageboyViewController,
        didScrollToPageAt index: TabmanViewController.PageIndex,
        direction: PageboyViewController.NavigationDirection,
        animated: Bool
    ) {
        print("Tabman 탭이 변경됨", index)
    }
    
    /// Tabman 탭 터치 이벤트 감지 메소드
    override func bar(
        _ bar: any TMBar,
        didRequestScrollTo index: PageboyViewController.PageIndex
    ) {
        super.bar(bar, didRequestScrollTo: index)
        print("Tabman 탭 눌림:", index)
    }
    
    
    func addViews() {
        view.addSubview(backgroundView)
        view.addSubview(backgroundCircleBlurView)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(nicknameLabel)
        contentView.addSubview(studentInfoLabel)
        contentView.addSubview(profileImageView)
        
        contentView.addSubview(hStackView)
        hStackView.addArrangedSubview(chattingButton)
        hStackView.addArrangedSubview(customizedNoticeButton)
        
        contentView.addSubview(noticeTitleLabel)
        contentView.addSubview(noticeSubTitleLabel)
        contentView.addSubview(tabBarView)
    }
    
    func setLayout() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        backgroundCircleBlurView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
            $0.width.equalToSuperview() // 가로 스크롤 방지
        }

        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(profileImageView.snp.leading).offset(-10)
        }
        
        studentInfoLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(profileImageView.snp.leading).offset(-10)
        }
        
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(85)
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-25)
        }
        
        hStackView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
        
        chattingButton.snp.makeConstraints {
            $0.height.equalTo(134)
        }
        
        customizedNoticeButton.snp.makeConstraints {
            $0.height.equalTo(134)
        }
        
        noticeTitleLabel.snp.makeConstraints {
            $0.top.equalTo(hStackView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(10)
        }
        
        noticeSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(noticeTitleLabel.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
        
        tabBarView.snp.makeConstraints {
            $0.top.equalTo(noticeSubTitleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(10)
            $0.height.equalTo(36)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        backgroundView.backgroundColor = .sub3.withAlphaComponent(0.25)

        chattingButton.setHighlightText("AI")
        chattingButton.setText("AI 상담 봇과\n대화하기")
        customizedNoticeButton.setText("맞춤형\n공지사항")
    }
    
    func configureTabman() {
        self.dataSource = self
        let bar = TMBar.ButtonBar()

        // 배경색
        bar.backgroundView.style = .clear
        
        // 간격 설정
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        bar.layout.contentMode = .fit
        bar.layout.transitionStyle = .snap
        bar.layout.interButtonSpacing = 0

        // 버튼 글씨 커스텀
        bar.buttons.customize { button in
            button.tintColor = .gray600
            button.selectedTintColor = .gray900
            button.font = .FontSystem.t5(weight: .light).font
            button.selectedFont = .FontSystem.t5(weight: .medium).font
        }

        // indicator
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.tintColor = .POINT
        bar.indicator.overscrollBehavior = .compress
        addBar(bar, dataSource: self, at: .custom(view: tabBarView, layout: nil))
    }

}

extension ViewController: PageboyViewControllerDataSource, TMBarDataSource {
    public func numberOfViewControllers(
        in pageboyViewController: Pageboy.PageboyViewController
    ) -> Int {
        5
    }

    public func viewController(
        for pageboyViewController: Pageboy.PageboyViewController,
        at index: Pageboy.PageboyViewController.PageIndex
    ) -> UIViewController? {
        return UIViewController(nibName: nil, bundle: nil)
    }

    public func defaultPage(
        for pageboyViewController: Pageboy.PageboyViewController
    ) -> Pageboy.PageboyViewController
        .Page? {
        nil
    }

    public func barItem(
        for bar: Tabman.TMBar,
        at index: Int
    ) -> Tabman.TMBarItemable {
        switch index {
        case 0: return TMBarItem(title: "전체")
        case 1: return TMBarItem(title: "학사")
        case 2: return TMBarItem(title: "장학")
        case 3: return TMBarItem(title: "학습/상담")
        case 4: return TMBarItem(title: "취창업")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
}
