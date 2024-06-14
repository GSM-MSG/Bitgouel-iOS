import Foundation

public enum LectureDomainError: Error {
    case forbidden
    case notFound
    case conflict
}

extension LectureDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .forbidden:
            return "권한이 없습니다."

        case .notFound:
            return "대상을 찾을 수 없습니다."

        case .conflict:
            return "다시 확인해주세요."
        }
    }
}

public extension Error {
    func lectureDomainErrorMessage() -> String {
        if let lectureDomainError = self as? LectureDomainError {
            return lectureDomainError.errorDescription ?? "알 수 없는 에러가 발생했습니다."
        } else { return "알 수 없는 에러가 발생했습니다." }
    }
}
