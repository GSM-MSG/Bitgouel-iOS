import Foundation
import Moya

public protocol BitgouelAPI: TargetType, JwtAuthorizable {
    associatedtype ErrorType: Error
    var domain: BitgouelDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: ErrorType] { get }
}

extension BitgouelAPI {
    public var baseURL: URL {
        URL(string: Bundle.module.object(forInfoDictionaryKey: "BASE_URL") as? String ?? "") ?? URL(string: "base")!
    }

    public var path: String {
        domain.asURLString + urlPath
    }

    public var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    public var validationType: ValidationType {
        return .successCodes
    }
}

public enum BitgouelDomain: String {
    case auth
    case user
    case activity
    case post
    case inquiry
    case faq
    case lecture
    case withdraw
    case admin
    case certification
    case club
    case email
}

extension BitgouelDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}

private final class BundleFinder {}

private extension Foundation.Bundle {
    static let module = Bundle(for: BundleFinder.self)
}
