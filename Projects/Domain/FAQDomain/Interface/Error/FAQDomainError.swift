import Foundation

public enum FAQDomainError: Error {
    case notFound
}

extension FAQDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notFound:
            return "존재하지 않는 어드민입니다."
        }
    }
}

public extension Error {
    func faqDomainErrorMessage() -> String {
        if let faqDomainError = self as? FAQDomainError {
            return faqDomainError.errorDescription ?? "알 수 없는 에러가 발생했습니다."
        } else { return "알 수 없는 에러가 발생했습니다." }
    }
}
