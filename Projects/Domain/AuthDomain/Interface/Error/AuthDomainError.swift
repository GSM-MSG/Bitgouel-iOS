import Foundation

public enum AuthDomainError: Error {
    case unauthorized
    case forbidden
    case notFound
    case conflict
}

extension AuthDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "유효하지 않은 리프레시 토큰입니다."

        case .forbidden:
            return "아직 회원가입 대기 중인 유저입니다."

        case .notFound:
            return "존재하지 않는 리프레시 토큰입니다."

        case .conflict:
            return "이미 가입된 유저의 정보를 기입하였습니다."
        }
    }
}

public extension Error {
    func authDomainErrorMessage() -> String {
        if let authDomainError = self as? AuthDomainError {
            return authDomainError.errorDescription ?? "알 수 없는 에러가 발생했습니다."
        } else { return "알 수 없는 오류가 발생했습니다." }
    }
}
