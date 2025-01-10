import Foundation

public enum APIError: Error {
    case unknown
    case custom(message: String = "알 수 없는 오류가 발생하였습니다", code: Int = 999)
    case timeout
    case decodingError(DecodingError)
    case badRequest       // 400번대 오류
    case unauthorized     // 401 Unauthorized
    case forbidden        // 403 Forbidden
    case notFound         // 404 Not Found
    case serverError      // 500번대 오류
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "알 수 없는 오류가 발생하였습니다."
        case let .custom(message, _):
            return message
        case .timeout:
            return "타임 아웃 에러입니다."
        case let .decodingError(error):
            return error.fullDescription
        case .badRequest:
            return "잘못된 요청입니다."
        case .unauthorized:
            return "인증 오류입니다."
        case .forbidden:
            return "권한 없음입니다."
        case .notFound:
            return "요청한 것을 찾을 수 없습니다."
        case .serverError:
            return "서버 오류입니다."
        }
    }
}

extension Error {
    public var asAPIError: APIError {
        if let decodingError = self.asDecodingError {
            return APIError.decodingError(decodingError)
        } else if let urlError = self.asURLError, urlError.code == .timedOut {
            return APIError.timeout
        } else {
            return self as? APIError ?? .unknown
        }
    }
    
    var asDecodingError: DecodingError? {
        return self as? DecodingError
    }
    
    var asURLError: URLError? {
        return self as? URLError
    }
}
