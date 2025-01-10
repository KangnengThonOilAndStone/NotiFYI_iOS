import Foundation

extension String {
    /// String을 Data로 변환하는 메소드
    func toData(using encoding: String.Encoding = .utf8) -> Data? {
        return self.data(using: encoding)
    }
}
