import UIKit
import SnapKit
import Then

final class CustomizedNoticeViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let customizedNoticeView: CustomizedNoticeView
    
    init(title: String?, subTitle: String?) {
        customizedNoticeView = CustomizedNoticeView(title: title, subTitle: subTitle)

        super.init(nibName: nil, bundle: nil)
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
