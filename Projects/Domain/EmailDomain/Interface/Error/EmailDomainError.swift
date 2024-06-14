import Foundation

public enum EmailDomainError: Error {
    case conflict
}

extension EmailDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .conflict:
            return "현재 비밀번호와 새 비밀번호가 같습니다."
        }
    }
}

public extension Error {
    func emailDomainErrorMessage() -> String {
        if let emailDomainError = self as? EmailDomainError {
            return emailDomainError.errorDescription ?? "알 수 없는 에러가 발생했습니다."
        } else { return "알 수 없는 에러가 발생했습니다." }
    }
}
