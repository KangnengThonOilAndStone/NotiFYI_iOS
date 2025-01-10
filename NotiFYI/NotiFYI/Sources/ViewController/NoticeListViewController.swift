import UIKit
import SnapKit
import Then
import Tabman
import Pageboy

final class NoticeListViewController: TabmanViewController {
    let noticeTitleLabel = WMLabel(
        text: "공지사항",
        textColor: .black,
        font: UIFont.FontSystem.t1(weight: .bold)
    ).then {
        $0.textAlignment = .left
    }
    
    let noticeSubTitleLabel = WMLabel(
        text: "AI가 공지사항 내용을 한 줄로 요약했어요",
        textColor: .gray500,
        font: UIFont.FontSystem.t4(weight: .medium)
    ).then {
        $0.textAlignment = .left
    }
        
    let tabBarView = UIView()
    
    let tableView = SelfSizedTableView().then {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        $0.register(NoticeCell.self, forCellReuseIdentifier: "\(NoticeCell.self)")
        //$0.bounces = false
        $0.backgroundColor = .clear
    }
    
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
        view.addSubview(noticeTitleLabel)
        view.addSubview(noticeSubTitleLabel)
        view.addSubview(tabBarView)
        view.addSubview(tableView)
    }
    
    func setLayout() {
        noticeTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        noticeSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(noticeTitleLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(20)
        }
        
        tabBarView.snp.makeConstraints {
            $0.top.equalTo(noticeSubTitleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(10)
            $0.height.equalTo(36)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(tabBarView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
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

extension NoticeListViewController: PageboyViewControllerDataSource, TMBarDataSource {
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

extension NoticeListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(NoticeCell.self)", for: indexPath) as? NoticeCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configure(category: .all, title: "2025 강냉톤 참가모집", summary: "전액 지원에 푸짐한 상품과 상금, 상장까지 받아갈 수 있는 절호의 기회!", views: 84)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("셀이 눌림")
    }
        
}
