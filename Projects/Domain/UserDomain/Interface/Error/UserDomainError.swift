import Foundation

public enum UserDomainError: Error {
    case unauthorized
}

extension UserDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "비밀번호가 일치하지 않습니다."
        }
    }
}

public extension Error {
    func userDomainErrorMessage() -> String {
        if let userDomainError = self as? UserDomainError {
            return userDomainError.errorDescription ?? "알 수 없는 에러가 발생했습니다."
        } else { return "알 수 없는 에러가 발생했습니다." }
    }
}
