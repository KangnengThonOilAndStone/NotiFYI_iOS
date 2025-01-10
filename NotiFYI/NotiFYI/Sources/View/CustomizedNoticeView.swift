import UIKit
import SnapKit
import Then

final class CustomizedNoticeView: UIView {
    let customNavigationBar: CustomNavigationBar
    
    init(title: String? = nil, subTitle: String? = nil) {
        customNavigationBar = CustomNavigationBar(title: title, subTitle: subTitle)

        super.init(frame: .zero)
        
        addViews()
        setLayout()
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        self.addSubview(customNavigationBar)
    }
    
    func setLayout() {
        customNavigationBar.snp.makeConstraints {
            $0.height.equalTo(45)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    func configureUI() {
        self.backgroundColor = .background
    }
}
