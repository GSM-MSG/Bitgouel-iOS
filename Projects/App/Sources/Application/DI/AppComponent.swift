import ActivityDetailFeature
import ActivityDetailFeatureInterface
import ActivityDetailSettingFeature
import ActivityDetailSettingFeatureInterface
import ActivityDomain
import ActivityDomainInterface
import ActivityListFeature
import ActivityListFeatureInterface
import AdminDomain
import AdminDomainInterface
import AdminRequestUserSignupFeature
import AdminRequestUserSignupFeatureInterface
import AdminUserListFeature
import AdminUserListFeatureInterface
import AdminWithdrawUserListFeature
import AdminWithdrawUserListFeatureInterface
import AuthDomain
import AuthDomainInterface
import BaseDomain
import BaseDomainInterface
import BaseFeature
import CertificationDomain
import CertificationDomainInterface
import ChangePasswordFeature
import ChangePasswordFeatureInterface
import ClubDetailFeature
import ClubDetailFeatureInterface
import ClubDomain
import ClubDomainInterface
import ClubListFeature
import ClubListFeatureInterface
import EmailDomain
import EmailDomainInterface
import FAQDomain
import FAQDomainInterface
import FindPasswordFeature
import FindPasswordFeatureInterface
import InputActivityFeature
import InputActivityFeatureInterface
import InputCertificationFeature
import InputCertificationFeatureInterface
import InputInquiryFeature
import InputInquiryFeatureInterface
import InputNoticeFeature
import InputNoticeFeatureInterface
import InputPostFeature
import InputPostFeatureInterface
import InquiryDetailFeature
import InquiryDetailFeatureInterface
import InquiryDomain
import InquiryDomainInterface
import InquiryListFeature
import InquiryListFeatureInterface
import Keychain
import KeychainInterface
import LectureApplicantListFeature
import LectureApplicantListFeatureInterface
import LectureDetailFeature
import LectureDetailFeatureInterface
import LectureDetailSettingFeature
import LectureDetailSettingFeatureInterface
import LectureDomain
import LectureDomainInterface
import LectureListFeature
import LectureListFeatureInterface
import LoginFeature
import LoginFeatureInterface
import MainFeature
import MainFeatureInterface
import MainTabFeature
import MainTabFeatureInterface
import MyPageFeature
import MyPageFeatureInterface
import NeedleFoundation
import NewPasswordFeature
import NewPasswordFeatureInterface
import NoticeDetailFeature
import NoticeDetailFeatureInterface
import NoticeDetailSettingFeature
import NoticeDetailSettingFeatureInterface
import NoticeListFeature
import NoticeListFeatureInterface
import OpenedLectureFeature
import OpenedLectureFeatureInterface
import PostDetailFeature
import PostDetailFeatureInterface
import PostDetailSettingFeature
import PostDetailSettingFeatureInterface
import PostDomain
import PostDomainInterface
import PostListFeature
import PostListFeatureInterface
import RootFeature
import SignupFeature
import SignupFeatureInterface
import StudentInfoFeature
import StudentInfoFeatureInterface
import SuccessChangePasswordFeature
import SuccessChangePasswordFeatureInterface
import SuccessSignupFeature
import SuccessSignupFeatureInterface
import SwiftUI
import UserDomain
import UserDomainInterface
import WithdrawDomain
import WithdrawDomainInterface
import WriteInquiryAnswerFeature
import WriteInquiryAnswerFeatureInterface

final class AppComponent: BootstrapComponent {
    func makeRootView() -> some View {
        rootComponent.makeView()
    }

    public var rootComponent: RootComponent {
        RootComponent(parent: self)
    }

    public var loginFactory: any LoginFactory {
        LoginComponent(parent: self)
    }

    public var activityListFactory: any ActivityListFactory {
        ActivityListComponent(parent: self)
    }

    public var signupFactory: any SignUpFactory {
        SignUpComponent(parent: self)
    }

    public var successSignUpFactory: any SuccessSignUpFactory {
        SuccessSignUpComponent(parent: self)
    }

    public var inputActivityFactory: any InputActivityFactory {
        InputActivityComponent(parent: self)
    }

    public var activityDetailFactory: any ActivityDetailFactory {
        ActivityDetailComponent(parent: self)
    }

    public var activityDetailSettingFactory: any ActivityDetailSettingFactory {
        ActivityDetailSettingComponent(parent: self)
    }

    public var clubDetailFactory: any ClubDetailFactory {
        ClubDetailComponent(parent: self)
    }

    public var clubListFactory: any ClubListFactory {
        ClubListComponent(parent: self)
    }

    public var lectureListFactory: any LectureListFactory {
        LectureListComponent(parent: self)
    }

    public var lectureDetailFactory: any LectureDetailFactory {
        LectureDetailComponent(parent: self)
    }

    public var openedLectureFactory: any OpenedLectureFactory {
        OpenedLectureComponent(parent: self)
    }

    public var lectureDetailSettingFactory: any LectureDetailSettingFactory {
        LectureDetailSettingComponent(parent: self)
    }

    public var postListFactory: any PostListFactory {
        PostListComponent(parent: self)
    }

    public var postDetailSettingFactory: any PostDetailSettingFactory {
        PostDetailSettingComponent(parent: self)
    }

    public var inputPostFactory: any InputPostFactory {
        InputPostComponent(parent: self)
    }

    public var postDetailFactory: any PostDetailFactory {
        PostDetailComponent(parent: self)
    }

    public var noticeListFactory: any NoticeListFactory {
        NoticeListComponent(parent: self)
    }

    public var inquiryListFactory: any InquiryListFactory {
        InquiryListComponent(parent: self)
    }

    public var noticeDetailFactory: any NoticeDetailFactory {
        NoticeDetailViewComponent(parent: self)
    }

    public var studentInfoFactory: any StudentInfoFactory {
        StudentInfoComponent(parent: self)
    }

    public var inputCertificationFactory: any InputCertificationFactory {
        InputCertificationComponent(parent: self)
    }

    public var mainFactory: any MainFactory {
        MainComponent(parent: self)
    }

    public var myPageFactory: any MyPageFactory {
        MyPageComponent(parent: self)
    }

    public var mainTabFactory: any MainTabFactory {
        MainTabComponent(parent: self)
    }

    public var inputNoticeFactory: any InputNoticeFactory {
        InputNoticeComponent(parent: self)
    }

    public var noticeDetailSettingFactory: any NoticeDetailSettingFactory {
        NoticeDetailSettingComponent(parent: self)
    }

    public var inputInquiryFactory: any InputInquiryFactory {
        InputInquiryComponent(parent: self)
    }

    public var inquiryDetailFactory: any InquiryDetailFactory {
        InquiryDetailComponent(parent: self)
    }

    public var writeInquiryAnswerFactory: any WriteInquiryAnswerFactory {
        WriteInquiryAnswerComponent(parent: self)
    }

    public var changePasswordFactory: any ChangePasswordFactory {
        ChangePasswordComponent(parent: self)
    }

    public var successChangePasswordFactory: any SuccessChangePasswordFactory {
        SuccessChangePasswordComponent(parent: self)
    }

    public var adminUserListFactory: any AdminUserListFactory {
        AdminUserListComponent(parent: self)
    }

    public var adminRequestUserSignupFactory: any AdminRequestUserSignupFactory {
        AdminRequestUserSignupComponent(parent: self)
    }

    public var adminWithdrawUserListFactory: any AdminWithdrawUserListFactory {
        AdminWithdrawUserListComponent(parent: self)
    }

    public var findPasswordFactory: any FindPasswordFactory {
        FindPasswordComponent(parent: self)
    }

    public var newPasswordFactory: any NewPasswordFactory {
        NewPasswordComponent(parent: self)
    }

    public var lectureApplicantListFactory: any LectureApplicantListFactory {
        LectureApplicantListComponent(parent: self)
    }

    public var authDomainFactory: any AuthDomainFactory {
        AuthDomainComponent(parent: self)
    }

    public var activityDomainFactory: any ActivityDomainFactory {
        ActivityDomainComponent(parent: self)
    }

    public var adminDomainFactory: any AdminDomainFactory {
        AdminDomainComponent(parent: self)
    }

    public var certificationDomainFactory: any CertificationDomainFactory {
        CertificationDomainComponent(parent: self)
    }

    public var clubDomainFactory: any ClubDomainFactory {
        ClubDomainComponent(parent: self)
    }

    public var emailDomainFactory: any EmailDomainFactory {
        EmailDomainComponent(parent: self)
    }

    public var faqDomainFactory: any FAQDomainFactory {
        FAQDomainComponent(parent: self)
    }

    public var inquiryDomainFactory: any InquiryDomainFactory {
        InquiryDomainComponent(parent: self)
    }

    public var lectureDomainFactory: any LectureDomainFactory {
        LectureDomainComponent(parent: self)
    }

    public var postDomainFactory: any PostDomainFactory {
        PostDomainComponent(parent: self)
    }

    public var userDomainFactory: any UserDomainFactory {
        UserDomainComponent(parent: self)
    }

    public var withdrawDomainFactory: any WithdrawDomainFactory {
        WithdrawDomainComponent(parent: self)
    }

    public var keychainFactory: any KeyChainFactory {
        KeyChainComponent(parent: self)
    }
}
