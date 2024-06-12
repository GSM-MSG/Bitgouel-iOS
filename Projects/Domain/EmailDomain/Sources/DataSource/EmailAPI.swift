import BaseDomain
import EmailDomainInterface
import Foundation
import Moya

public enum EmailAPI {
    case sendEmailCertificationLink(req: EmailRequestDTO)
    case fetchEmailVerificationStatus(email: String)
}

extension EmailAPI: BitgouelAPI {
    public typealias ErrorType = EmailDomainError

    public var domain: BitgouelDomain {
        .email
    }

    public var urlPath: String {
        switch self {
        case .sendEmailCertificationLink,
             .fetchEmailVerificationStatus:
            return ""
        }
    }

    public var method: Moya.Method {
        switch self {
        case .sendEmailCertificationLink:
            return .post
        case .fetchEmailVerificationStatus:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .sendEmailCertificationLink(req):
            return .requestJSONEncodable(req)

        case let .fetchEmailVerificationStatus(email):
            return .requestParameters(parameters: [
                "email": email
            ], encoding: URLEncoding.queryString)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .none
        }
    }

    public var errorMap: [Int: EmailDomainError] {
        switch self {
        default:
            return [
                409: .conflict
            ]
        }
    }
}
