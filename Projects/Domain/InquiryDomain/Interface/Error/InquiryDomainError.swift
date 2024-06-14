import Foundation

public enum InquiryDomainError: Error {
    case forbidden
    case notFound
    case conflict
}

extension InquiryDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .forbidden:
            return "권한이 없습니다."

        case .notFound:
            return "존재하지 않는 문의사항입니다."

        case .conflict:
            return "이미 답변이 등록된 문의사항입니다."
        }
    }
}

public extension Error {
    func inquiryDomainErrorMessage() -> String {
        if let inquiryDomainError = self as? InquiryDomainError {
            return inquiryDomainError.errorDescription ?? "알 수 없는 에러가 발생했습니다."
        } else { return "알 수 없는 에러가 발생했습니다." }
    }
}
