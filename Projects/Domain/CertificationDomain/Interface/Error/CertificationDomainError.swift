import Foundation

public enum CertificationDomainError: Error {
    case forbidden
    case notFound
    case conflict
}

extension CertificationDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .forbidden:
            return "권한이 없습니다."

        case .notFound:
            return "대상을 찾을 수 없습니다."

        case .conflict:
            return "이미 취득한 자격증입니다."
        }
    }
}

public extension Error {
    func certificationDomainErrorMessage() -> String {
        if let certificationDomainError = self as? CertificationDomainError {
            return certificationDomainError.errorDescription ?? "알 수 없는 에러가 발생했습니다."
        } else { return "알 수 없는 에러가 발생했습니다." }
    }
}
