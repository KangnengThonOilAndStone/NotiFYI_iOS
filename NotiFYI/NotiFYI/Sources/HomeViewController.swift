import UIKit
import SnapKit
import Then

final class HomeViewController: UIViewController {
    let backgroundView = UIView()
    let backgroundCircleBlurView = UIImageView(image: .blur)
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let headerView = UIView()
    
    let nicknameLabel = WMLabel(
        text: "임시 개발하는 공룡",
        textColor: .black,
        font: .t1(weight: .bold),
        lineHeight: 24
    ).then {
        $0.textAlignment = .left
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
    }
    
    let studentInfoLabel = WMLabel(
        text: "소프트웨어응용학부・4학년",
        textColor: .gray600,
        font: .t4(weight: .medium),
        lineHeight: 16
    ).then {
        $0.textAlignment = .left
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
    }
    
    let profileImageView = UIImageView(image: .yang)
    
    let hStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 20
        $0.alignment = .center
    }
    
    let chattingButton = RoundedRectangleButton(emojiImage: .robot)
    
    let customizedNoticeButton = RoundedRectangleButton(emojiImage: .eye)

    let noticeListViewController = NoticeListViewController()
    
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
        setupChildViewController()
        addViews()
        setLayout()
        configureUI()
    }
    
    private func setupChildViewController() {
        let childVC = noticeListViewController
        
        self.addChild(childVC)
        childVC.didMove(toParent: self)

        self.contentView.addSubview(childVC.view)
    }
    
    
    func addViews() {
        view.addSubview(backgroundView)
        view.addSubview(backgroundCircleBlurView)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(headerView)
        headerView.addSubview(nicknameLabel)
        headerView.addSubview(studentInfoLabel)
        headerView.addSubview(profileImageView)
        
        contentView.addSubview(hStackView)
        hStackView.addArrangedSubview(chattingButton)
        hStackView.addArrangedSubview(customizedNoticeButton)
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
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(85)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
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
            $0.top.equalToSuperview()
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
        
        noticeListViewController.view.snp.makeConstraints {
            $0.top.equalTo(hStackView.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        backgroundView.backgroundColor = .sub3.withAlphaComponent(0.25)
        
        chattingButton.setHighlightText("AI")
        chattingButton.setText("AI 상담 봇과\n대화하기")
        customizedNoticeButton.setText("맞춤형\n공지사항")
    }
}
