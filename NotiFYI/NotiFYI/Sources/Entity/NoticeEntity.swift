import Foundation

struct NoticeEntity: Codable {
    /// "선배업고, 취업잡고! 참여자 모집!"
    let title: String
    
    /// "강남대학교 재학생 및 졸업생 (각 직무별 8명 선착순)"
    let target: String
    
    /// "2025.01.08(수)~2025.01.16(목)"
    let duration: String
    
    /// "졸업생 멘토링 프로그램 참여자를 모집합니다."
    let summary: String
    
    /// "강남대학교에서 진행하는 '선배업고, 취업잡고!' 프로그램 참여자를 모집합니다. 모집 기간은 2025년 1월 8일부터 1월 16일까지입니다. 모집 직무는...
    let content: String
    
    /// "강남대학교 대학일자리플러스센터 (031-280-3433)"
    let contact: String
    
    /// "취창업"
    let category: Category
    
    /// "https://web.kangnam.ac.kr/..."
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case target
        case duration = "application"
        case summary
        case content
        case contact
        case category
        case url
    }
}

enum Category: String, Codable {
    case all = "전체"
    case haksa = "학사"
    case janghak = "장학"
    case hakseup = "학습/상담"
    case job = "취창업"
}

typealias NoticeEntitys = [NoticeEntity]
