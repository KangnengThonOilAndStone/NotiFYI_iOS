import Foundation

struct CustomizedNoticeResponse: Codable {
    let status: String
    let responses: [Response]
    
    enum CodingKeys: String, CodingKey {
        case status
        case responses = "results"
    }
}

struct Response: Codable {
    let customizedNoticeEntity: CustomizedNoticeEntity
    let distance: Double
    
    enum CodingKeys: String, CodingKey {
        case customizedNoticeEntity = "metadata"
        case distance
    }
}

struct CustomizedNoticeEntity: Codable {
    /// "학습/상담"
    let category: NoticeCategory
    
    /// "2024-2 겨울방학 일본어 스터디팀 모집(간바레)"
    let title: String
    
    /// "일본취업 희망자, 2025년 4학년 학생, K-MOVE 12기 예비 연수생"
    let target: String
    
    /// "모집기한: 2024.12.27"
    let duration: String
    
    /// "2024 겨울방학 동안 일본어 스터디팀을 모집합니다."
    let summary: String
    
    /// "이정연 교수 | bijou1224@hanmail.net"
    let contact: String
    
    /// "https://web.kangnam.ac.kr/..."
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case category
        case title
        case target
        case duration = "application"
        case summary
        case contact
        case url
    }
}
