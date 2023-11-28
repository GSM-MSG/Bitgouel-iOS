import Foundation
import Moya

public enum ActivityAPI {
    case addStudentActivity
}

extension ActivityAPI: BitgouelAPI {
    public typealias ErrorType = ActivityDomainError
    
    public var domain: BitgouelDomain {
        .activity
    }

    public var urlPath: String {
        switch self {
        case .addStudentActivity:
            return ""
        }
    }

    public var method: Moya.Method {
        switch self {
        case .addStudentActivity:
            return .post
        }
    }

    public var task: Moya.Task {
        switch self {
        case .addStudentActivity:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .addStudentActivity:
            return .accessToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .addStudentActivity:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict,
                423: .tooManyRequest
            ]
        }
    }
}
