import Foundation
import UIKit

public extension CALayer {
    /// 피그마를 보고 빠르게 그림자를 추가할 수 있는 함수입니다.
    /// - Parameters:
    ///     - color: ex) UIColor(hex: "#12FF34")
    ///     - alpha: ex) 0.0 ~ 1.0
    ///     - x: 그림자 위치 조정(pt단위) ex) 0
    ///     - y: 그림자 위치 조정(pt단위) ex) 0
    ///     - blur: 피그마 기준 blur 값(pt단위) ex) 20
    ///     - spread: 피그마 기준 spread 값(pt단위) ex) 20
    @MainActor
    func addShadow(
        color: UIColor,
        alpha: Float,
        x: CGFloat,
        y: CGFloat,
        blur: CGFloat,
        spread: CGFloat
    ) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            print("windowScene을 찾지 못했습니다.")
            return
        }
        let displayScale = windowScene.screen.traitCollection.displayScale
        shadowRadius = blur / displayScale
        
        if spread == 0 {
            shadowPath = nil
        } else {
            let rect = bounds.insetBy(dx: -spread, dy: -spread)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
