import Foundation

enum API {
    case fetchNoticeList
    case fetchCustomNoticeList(keywords: [String])
}

extension API: EndPoint {
    var baseURL: URL {
        return Secrets.BASE_URL!
    }
    
    var path: String {
        switch self {
        case .fetchNoticeList:
            return Secrets.NOTICE_LIST
        case .fetchCustomNoticeList(let keywords):
            return Secrets.CUSTOM_NOTICE_LIST
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .fetchNoticeList:
            return nil
        case let .fetchCustomNoticeList(keywords):
            return ["keyword": keywords]
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var body: (any Encodable)? {
        return nil
    }
    
}
