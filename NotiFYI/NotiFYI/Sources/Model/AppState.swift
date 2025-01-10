import Foundation

final class AppState {
    static let shared = AppState()
    
    private init() { }
    
    /// 학부/과
    let major: String = "소프트웨어응용학부"
    
    /// 학년
    let grade: String = "4학년"
    
    
}
