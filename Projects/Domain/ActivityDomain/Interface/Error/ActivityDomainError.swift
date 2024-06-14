import Foundation

public enum ActivityDomainError: Error {
    case forbidden
    case notFound
}

extension ActivityDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .forbidden:
            return "권한이 없습니다."

        case .notFound:
            return "대상을 찾을 수 없습니다."
        }
    }
}

public extension Error {
    func activityDomainErrorMessage() -> String {
        if let activityDomainError = self as? ActivityDomainError {
            return activityDomainError.errorDescription ?? "알 수 없는 에러가 발생했습니다."
        } else { return "알 수 없는 에러가 발생했습니다." }
    }
}
