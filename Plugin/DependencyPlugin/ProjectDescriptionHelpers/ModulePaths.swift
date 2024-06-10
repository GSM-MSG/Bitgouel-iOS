import Foundation
import ProjectDescription

public enum ModulePaths {
    case feature(Feature)
    case domain(Domain)
    case core(Core)
    case shared(Shared)
    case userInterface(UserInterface)
}

public extension ModulePaths {
    func targetName(type: TMATargetType) -> String {
        switch self {
        case let .feature(module as any TMATargetPathConvertable),
             let .domain(module as any TMATargetPathConvertable),
             let .core(module as any TMATargetPathConvertable),
             let .shared(module as any TMATargetPathConvertable),
             let .userInterface(module as any TMATargetPathConvertable):
            return module.targetName(type: type)
        }
    }
}

public extension ModulePaths {
    enum Feature: String, TMATargetPathConvertable {
        case ActivityDetailFeature
        case ActivityDetailSettingFeature
        case ActivityListFeature
        case AdminRequestUserSignupFeature
        case AdminUserListFeature
        case AdminWithdrawUserListFeature
        case BaseFeature
        case ChangePasswordFeature
        case ClubDetailFeature
        case ClubListFeature
        case FindPasswordFeature
        case InputActivityFeature
        case InputCertificationFeature
        case InputInquiryFeature
        case InputNoticeFeature
        case InputPostFeature
        case InquiryDetailFeature
        case InquiryListFeature
        case LectureApplicantListFeature
        case LectureDetailSettingFeature
        case LectureDetailFeature
        case LectureListFeature
        case LoginFeature
        case MainFeature
        case MainTabFeature
        case MyPageFeature
        case NewPasswordFeature
        case NoticeDetailFeature
        case NoticeDetailSettingFeature
        case NoticeListFeature
        case OpenedLectureFeature
        case PostDetailFeature
        case PostDetailSettingFeature
        case PostListFeature
        case RootFeature
        case SignupFeature
        case StudentInfoFeature
        case SuccessChangePasswordFeature
        case SuccessSignupFeature
        case WriteInquiryAnswerFeature
    }
}

public extension ModulePaths {
    enum Domain: String, TMATargetPathConvertable {
        case ActivityDomain
        case AdminDomain
        case AuthDomain
        case BaseDomain
        case CertificationDomain
        case ClubDomain
        case EmailDomain
        case FAQDomain
        case InquiryDomain
        case LectureDomain
        case PostDomain
        case UserDomain
        case WithdrawDomain
    }
}

public extension ModulePaths {
    enum Core: String, TMATargetPathConvertable {
        case Keychain
    }
}

public extension ModulePaths {
    enum Shared: String, TMATargetPathConvertable {
        case DateUtil
        case ViewUtil
        case FoundationUtil
        case UtilityModule
        case GlobalThirdPartyLibrary
    }
}

public extension ModulePaths {
    enum UserInterface: String, TMATargetPathConvertable {
        case DesignSystem
    }
}

public enum TMATargetType: String {
    case interface = "Interface"
    case sources = ""
    case testing = "Testing"
    case tests = "Tests"
    case example = "Example"
}

public protocol TMATargetPathConvertable {
    func targetName(type: TMATargetType) -> String
}

public extension TMATargetPathConvertable where Self: RawRepresentable {
    func targetName(type: TMATargetType) -> String {
        "\(self.rawValue)\(type.rawValue)"
    }
}

// MARK: - For DI
extension ModulePaths.Feature: CaseIterable {}
extension ModulePaths.Domain: CaseIterable {}
