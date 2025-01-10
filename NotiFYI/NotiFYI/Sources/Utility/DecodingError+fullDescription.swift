import Foundation

public extension DecodingError {
    var fullDescription: String {
        switch self {
        case let .typeMismatch(type, context):
            return """
                    타입이 맞지 않습니다.\n
                    \(type) 타입에서 오류 발생:\n
                    codingPath: \(context.codingPath)\n
                    debugDescription: \(context.debugDescription)\n
                    underlyingError: \(context.underlyingError?.localizedDescription ?? "none")
                    """
        case let .valueNotFound(type, context):
            return """
                    값을 찾을 수 없습니다.\n
                    \(type) 타입에서 오류 발생:\n
                    codingPath: \(context.codingPath)\n
                    debugDescription: \(context.debugDescription)\n
                    underlyingError: \(context.underlyingError?.localizedDescription ?? "none")
                    """
        case let .keyNotFound(key, context):
            return """
                    키 \(key) 를 찾을 수 없습니다:\n
                    codingPath: \(context.codingPath)\n
                    debugDescription: \(context.debugDescription)\n
                    underlyingError: \(context.underlyingError?.localizedDescription ?? "none")
                    """
        case let .dataCorrupted(context):
            return """
                    데이터 손실 에러입니다.\n
                    codingPath: \(context.codingPath)\n
                    debugDescription: \(context.debugDescription)\n
                    underlyingError: \(context.underlyingError?.localizedDescription ?? "none")
                    """
        default:
            return "알 수 없는 디코딩에 실패했습니다."
        }
    }
}
