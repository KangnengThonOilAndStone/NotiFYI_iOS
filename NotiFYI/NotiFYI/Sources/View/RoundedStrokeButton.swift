import UIKit
import SnapKit
import Then

final class RoundedStrokeButton: UIButton {
    let containerView = UIView().then {
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray500.cgColor
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = false
    }
    
    let label = WMLabel(text: "", textColor: .gray600, font: .t4(weight: .medium))
    
    init(text: String) {
        super.init(frame: .zero)
        label.text = text
        addViews()
        setLayout()
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        self.addSubview(containerView)
        containerView.addSubview(label)
    }
    
    func setLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func configureUI() {
        
    }
    
}
