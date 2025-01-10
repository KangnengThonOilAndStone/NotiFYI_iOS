import Foundation

struct NoticeResponse: Codable {
    let summary: String
    let response: [NoticeFaissResponse]
    let recommendedPosts: [String]
    
    enum CodingKeys: String, CodingKey {
        case summary = "response"
        case response = "faiss_results"
        case recommendedPosts = "recommended_posts"
    }
}

struct NoticeFaissResponse: Codable {
    let id: String
    let metadata: NoticeEntity
    let pageContent: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case id
        case metadata
        case pageContent = "page_content"
        case type
    }
}

struct NoticeEntity: Codable {
    /// "장학"
    let category: NoticeCategory
    
    /// "선배업고, 취업잡고! 참여자 모집!"
    let title: String
    
    /// "강남대학교 재학생 및 졸업생 (각 직무별 8명 선착순)"
    let target: String
    
    /// "2025.01.08(수)~2025.01.16(목)"
    let duration: String
    
    /// "졸업생 멘토링 프로그램 참여자를 모집합니다."
    let summary: String
    
    /// "강남대학교 대학일자리플러스센터 (031-280-3433)"
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
