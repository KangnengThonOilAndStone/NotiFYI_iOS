import UIKit

enum NoticeCategory: String {
    case all = "전체"
    case haksa = "학사"
    case janghak = "장학"
    case hakseup = "학습/상담"
    case job = "취창업"
    
    var color: UIColor {
        switch self {
        case .all:
            return .sunset1
        case .haksa:
            return .sunset2
        case .janghak:
            return .sunset3
        case .hakseup:
            return .sunset4
        case .job:
            return .sunset5
        }
    }
}
