import Foundation

final class AppState {
    static let shared = AppState()
    
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    var notices: [NoticeEntity] = []
    
    /// 학부/과
    let major: String = "소프트웨어응용학부"
    
    /// 학년
    let grade: String = "4학년"
    
    private init() {
        guard let noticeEntitys = try? decoder.decode(NoticeEntitys.self, from: dummyJson) else { return }
        notices = noticeEntitys
    }
    
}
