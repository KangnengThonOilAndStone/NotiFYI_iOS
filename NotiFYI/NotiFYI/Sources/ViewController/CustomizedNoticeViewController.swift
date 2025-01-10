import UIKit
import SnapKit
import Then
import Combine
import WebKit

final class CustomizedNoticeViewController: UIViewController, UIGestureRecognizerDelegate {
    var cancellables = Set<AnyCancellable>()
    let appState = AppState.shared
    let customizedNoticeView: CustomizedNoticeView
    let webViewController = WKWebViewController()
    
    init(title: String?, subTitle: String?) {
        customizedNoticeView = CustomizedNoticeView(title: title, subTitle: subTitle)
        
        super.init(nibName: nil, bundle: nil)
        customizedNoticeView.setDelegate(self)
        customizedNoticeView.setDataSource(self)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = customizedNoticeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        addViews()
        setLayout()
        configureUI()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    func addViews() {
        
    }
    
    func setLayout() {
        
    }
    
    func configureUI() {
        
    }
}

extension CustomizedNoticeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appState.customizedNotices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CarouselCollectionViewCell.self)", for: indexPath) as! CarouselCollectionViewCell
        
        let i = indexPath.row
        let notice = appState.customizedNotices[i]
        
        let title = notice.title
        let target = notice.target
        let summary = notice.summary
        let duration = notice.duration
        let contact = notice.contact
        let url = notice.url
        
        cell.configure(title: title, target: target, summary: summary, duration: duration, contact: contact, url: url)
        cell.goDetailWebViewDelegate = self
        
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 320, height: collectionView.frame.height) // 셀 크기
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension CustomizedNoticeViewController: GoDetailWebViewProtocol {
    func goDetailWebView(url: String) {
        if let url = URL(string: url) {
            webViewController.urlString = url.absoluteString
            self.navigationController?.pushViewController(webViewController, animated: true)
        } else {
            print(url + " is not valid URL")
        }
    }
}
