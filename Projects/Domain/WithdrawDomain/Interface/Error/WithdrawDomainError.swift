import Foundation

public enum WithdrawDomainError: Error {
    case forbidden
    case internalServerError
}

extension WithdrawDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .forbidden:
            return "권한이 없습니다."
        case .internalServerError:
            return "알 수 없는 에러가 발생했습니다. 지속될 시 문의 주세요."
        }
    }
}

public extension Error {
    func withdrawDomainErrorMessage() -> String {
        if let withdrawDomainError = self as? WithdrawDomainError {
            return withdrawDomainError.errorDescription ?? "알 수 없는 에러가 발생했습니다."
        } else { return "알 수 없는 에러가 발생했습니다." }
    }
}
