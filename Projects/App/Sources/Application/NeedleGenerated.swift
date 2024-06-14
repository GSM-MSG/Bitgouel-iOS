

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
import Foundation
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

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class InputPostDependency2bb888f6c56a6060d23fProvider: InputPostDependency {
    var postDetailSettingFactory: any PostDetailSettingFactory {
        return appComponent.postDetailSettingFactory
    }
    var postDomainFactory: any PostDomainFactory {
        return appComponent.postDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InputPostComponent
private func factoryfd208488fdd5cb4acc65f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputPostDependency2bb888f6c56a6060d23fProvider(appComponent: parent1(component) as! AppComponent)
}
private class InputCertificationDependency4e950d4995ce855c5cd5Provider: InputCertificationDependency {
    var certificationDomainFactory: any CertificationDomainFactory {
        return appComponent.certificationDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InputCertificationComponent
private func factory2810b45b31199a5f0c2af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputCertificationDependency4e950d4995ce855c5cd5Provider(appComponent: parent1(component) as! AppComponent)
}
private class ClubListDependency90c6e61626f7c53ad50fProvider: ClubListDependency {
    var clubDetailFactory: any ClubDetailFactory {
        return appComponent.clubDetailFactory
    }
    var clubDomainFactory: any ClubDomainFactory {
        return appComponent.clubDomainFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ClubListComponent
private func factory050817f1b6d356b83467f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ClubListDependency90c6e61626f7c53ad50fProvider(appComponent: parent1(component) as! AppComponent)
}
private class AdminUserListDependency44bf9c85ea93b1b98debProvider: AdminUserListDependency {
    var adminRequestUserSignupFactory: any AdminRequestUserSignupFactory {
        return appComponent.adminRequestUserSignupFactory
    }
    var adminWithdrawUserListFactory: any AdminWithdrawUserListFactory {
        return appComponent.adminWithdrawUserListFactory
    }
    var adminDomainFactory: any AdminDomainFactory {
        return appComponent.adminDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AdminUserListComponent
private func factory55b3a27a2b6be9af9ba4f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AdminUserListDependency44bf9c85ea93b1b98debProvider(appComponent: parent1(component) as! AppComponent)
}
private class NoticeListDependency0e93eb53be8626c408e4Provider: NoticeListDependency {
    var inquiryListFactory: any InquiryListFactory {
        return appComponent.inquiryListFactory
    }
    var noticeDetailFactory: any NoticeDetailFactory {
        return appComponent.noticeDetailFactory
    }
    var inputNoticeFactory: any InputNoticeFactory {
        return appComponent.inputNoticeFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    var postDomainFactory: any PostDomainFactory {
        return appComponent.postDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->NoticeListComponent
private func factorye14e687c08985bdffcd0f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoticeListDependency0e93eb53be8626c408e4Provider(appComponent: parent1(component) as! AppComponent)
}
private class OpenedLectureDependencyf5f55fb6c2a2daeac985Provider: OpenedLectureDependency {
    var lectureDomainFactory: any LectureDomainFactory {
        return appComponent.lectureDomainFactory
    }
    var lectureDetailSettingFactory: any LectureDetailSettingFactory {
        return appComponent.lectureDetailSettingFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->OpenedLectureComponent
private func factory6636d97d1a9f0c8216d2f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return OpenedLectureDependencyf5f55fb6c2a2daeac985Provider(appComponent: parent1(component) as! AppComponent)
}
private class SignUpDependencyf83ac0c64026320e6dc2Provider: SignUpDependency {
    var successSignUpFactory: any SuccessSignUpFactory {
        return appComponent.successSignUpFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignUpComponent
private func factory306e8ce5cfdf41304709f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignUpDependencyf83ac0c64026320e6dc2Provider(appComponent: parent1(component) as! AppComponent)
}
private class ActivityDetailSettingDependency0b98c5f90168b920a8b8Provider: ActivityDetailSettingDependency {


    init() {

    }
}
/// ^->AppComponent->ActivityDetailSettingComponent
private func factoryfd595280dea209e217b9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ActivityDetailSettingDependency0b98c5f90168b920a8b8Provider()
}
private class MainTabDependency2826cdb310ed0b17a725Provider: MainTabDependency {
    var mainFactory: any MainFactory {
        return appComponent.mainFactory
    }
    var lectureListFactory: any LectureListFactory {
        return appComponent.lectureListFactory
    }
    var postListFactory: any PostListFactory {
        return appComponent.postListFactory
    }
    var clubListFactory: any ClubListFactory {
        return appComponent.clubListFactory
    }
    var myPageFactory: any MyPageFactory {
        return appComponent.myPageFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainTabComponent
private func factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainTabDependency2826cdb310ed0b17a725Provider(appComponent: parent1(component) as! AppComponent)
}
private class NoticeDetailSettingDependencye2c86b5d9ab8fbf629c4Provider: NoticeDetailSettingDependency {


    init() {

    }
}
/// ^->AppComponent->NoticeDetailSettingComponent
private func factory24d19202afbef2333be9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoticeDetailSettingDependencye2c86b5d9ab8fbf629c4Provider()
}
private class MyPageDependency48d84b530313b3ee40feProvider: MyPageDependency {
    var changePasswordFactory: any ChangePasswordFactory {
        return appComponent.changePasswordFactory
    }
    var adminUserListFactory: any AdminUserListFactory {
        return appComponent.adminUserListFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    var userDomainFactory: any UserDomainFactory {
        return appComponent.userDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MyPageComponent
private func factory0f6f456ebf157d02dfb3f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MyPageDependency48d84b530313b3ee40feProvider(appComponent: parent1(component) as! AppComponent)
}
private class LectureDetailDependency9ff618f943d500d634dbProvider: LectureDetailDependency {
    var lectureApplicantListFactory: any LectureApplicantListFactory {
        return appComponent.lectureApplicantListFactory
    }
    var lectureDomainFactory: any LectureDomainFactory {
        return appComponent.lectureDomainFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->LectureDetailComponent
private func factory94b2e1ac14af9cd1e074f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LectureDetailDependency9ff618f943d500d634dbProvider(appComponent: parent1(component) as! AppComponent)
}
private class InquiryDetailDependencyf68d260d1f6dc07aaedbProvider: InquiryDetailDependency {
    var inputInquiryFactory: any InputInquiryFactory {
        return appComponent.inputInquiryFactory
    }
    var writeInquiryAnswerFactory: any WriteInquiryAnswerFactory {
        return appComponent.writeInquiryAnswerFactory
    }
    var inquiryDomainFactory: any InquiryDomainFactory {
        return appComponent.inquiryDomainFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InquiryDetailComponent
private func factory2d6736bd037393a86ae3f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InquiryDetailDependencyf68d260d1f6dc07aaedbProvider(appComponent: parent1(component) as! AppComponent)
}
private class InputNoticeDependency7b594803ad882c7e25c9Provider: InputNoticeDependency {
    var noticeDetailSettingFactory: any NoticeDetailSettingFactory {
        return appComponent.noticeDetailSettingFactory
    }
    var postDomainFactory: any PostDomainFactory {
        return appComponent.postDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InputNoticeComponent
private func factory4545df5fcd42aaf8ed60f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputNoticeDependency7b594803ad882c7e25c9Provider(appComponent: parent1(component) as! AppComponent)
}
private class LectureDetailSettingDependencyd72c0b79ce6406870a95Provider: LectureDetailSettingDependency {
    var openedLectureFactory: any OpenedLectureFactory {
        return appComponent.openedLectureFactory
    }
    var lectureDomainFactory: any LectureDomainFactory {
        return appComponent.lectureDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->LectureDetailSettingComponent
private func factoryd0ffb7dfc6fd9633e0e6f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LectureDetailSettingDependencyd72c0b79ce6406870a95Provider(appComponent: parent1(component) as! AppComponent)
}
private class MainDependency7c6a5b4738b211b8e155Provider: MainDependency {
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    var faqDomainFactory: any FAQDomainFactory {
        return appComponent.faqDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainComponent
private func factoryc9274e46e78e70f29c54f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainDependency7c6a5b4738b211b8e155Provider(appComponent: parent1(component) as! AppComponent)
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var loginFactory: any LoginFactory {
        return appComponent.loginFactory
    }
    var mainTabFactory: any MainTabFactory {
        return appComponent.mainTabFactory
    }
    var findPasswordFactory: any FindPasswordFactory {
        return appComponent.findPasswordFactory
    }
    var successSignUpFactory: any SuccessSignUpFactory {
        return appComponent.successSignUpFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider(appComponent: parent1(component) as! AppComponent)
}
private class PostListDependencye041dce90a2be61e7af5Provider: PostListDependency {
    var noticeListFactory: any NoticeListFactory {
        return appComponent.noticeListFactory
    }
    var inquiryListFactory: any InquiryListFactory {
        return appComponent.inquiryListFactory
    }
    var inputPostFactory: any InputPostFactory {
        return appComponent.inputPostFactory
    }
    var postDetailFactory: any PostDetailFactory {
        return appComponent.postDetailFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    var postDomainFactory: any PostDomainFactory {
        return appComponent.postDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->PostListComponent
private func factory0c89e2bbcc02dbcac018f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PostListDependencye041dce90a2be61e7af5Provider(appComponent: parent1(component) as! AppComponent)
}
private class ChangePasswordDependency04ab7ced24136c4fb27eProvider: ChangePasswordDependency {
    var successChangePasswordFactory: any SuccessChangePasswordFactory {
        return appComponent.successChangePasswordFactory
    }
    var userDomainFactory: any UserDomainFactory {
        return appComponent.userDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ChangePasswordComponent
private func factoryab7c4d87dab53e0a51b9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ChangePasswordDependency04ab7ced24136c4fb27eProvider(appComponent: parent1(component) as! AppComponent)
}
private class SuccessSignUpDependencydbc5dd5670791a0302f6Provider: SuccessSignUpDependency {


    init() {

    }
}
/// ^->AppComponent->SuccessSignUpComponent
private func factorybf219b153b668170161de3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SuccessSignUpDependencydbc5dd5670791a0302f6Provider()
}
private class FindPasswordDependency542eacce769b9dc25904Provider: FindPasswordDependency {
    var newPasswordFactory: any NewPasswordFactory {
        return appComponent.newPasswordFactory
    }
    var emailDomainFactory: any EmailDomainFactory {
        return appComponent.emailDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FindPasswordComponent
private func factory15775d8436b06b9741d1f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FindPasswordDependency542eacce769b9dc25904Provider(appComponent: parent1(component) as! AppComponent)
}
private class AdminRequestUserSignupDependency260e3843e854d6971798Provider: AdminRequestUserSignupDependency {
    var adminUserListFactory: any AdminUserListFactory {
        return appComponent.adminUserListFactory
    }
    var adminWithdrawUserListFactory: any AdminWithdrawUserListFactory {
        return appComponent.adminWithdrawUserListFactory
    }
    var adminDomainFactory: any AdminDomainFactory {
        return appComponent.adminDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AdminRequestUserSignupComponent
private func factory2c6c6f3f10221ceac3a8f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AdminRequestUserSignupDependency260e3843e854d6971798Provider(appComponent: parent1(component) as! AppComponent)
}
private class LectureApplicantListDependency5bfdb7310dde792c0738Provider: LectureApplicantListDependency {
    var lectureDomainFactory: any LectureDomainFactory {
        return appComponent.lectureDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->LectureApplicantListComponent
private func factory78a87c10d14f7bbaaa9df47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LectureApplicantListDependency5bfdb7310dde792c0738Provider(appComponent: parent1(component) as! AppComponent)
}
private class StudentInfoDependency5d1163a5288c79c06dffProvider: StudentInfoDependency {
    var activityListFactory: any ActivityListFactory {
        return appComponent.activityListFactory
    }
    var inputCertificationFactory: any InputCertificationFactory {
        return appComponent.inputCertificationFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    var clubDomainFactory: any ClubDomainFactory {
        return appComponent.clubDomainFactory
    }
    var certificationDomainFactory: any CertificationDomainFactory {
        return appComponent.certificationDomainFactory
    }
    var lectureDomainFactory: any LectureDomainFactory {
        return appComponent.lectureDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->StudentInfoComponent
private func factory5ce0f173abbf535f654ff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return StudentInfoDependency5d1163a5288c79c06dffProvider(appComponent: parent1(component) as! AppComponent)
}
private class AdminWithdrawUserListDependency06942465f0ac1aaeda24Provider: AdminWithdrawUserListDependency {
    var adminUserListFactory: any AdminUserListFactory {
        return appComponent.adminUserListFactory
    }
    var adminRequestUserSignupFactory: any AdminRequestUserSignupFactory {
        return appComponent.adminRequestUserSignupFactory
    }
    var withdrawDomainFactory: any WithdrawDomainFactory {
        return appComponent.withdrawDomainFactory
    }
    var adminDomainFactory: any AdminDomainFactory {
        return appComponent.adminDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AdminWithdrawUserListComponent
private func factory1ef284da45544ee52e3ef47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AdminWithdrawUserListDependency06942465f0ac1aaeda24Provider(appComponent: parent1(component) as! AppComponent)
}
private class WriteInquiryAnswerDependencyeba82c0423abdd3e1acfProvider: WriteInquiryAnswerDependency {
    var inquiryDomainFactory: any InquiryDomainFactory {
        return appComponent.inquiryDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->WriteInquiryAnswerComponent
private func factory3d4cadf14cd9a3336981f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return WriteInquiryAnswerDependencyeba82c0423abdd3e1acfProvider(appComponent: parent1(component) as! AppComponent)
}
private class PostDetailDependencycf431278832ae8226535Provider: PostDetailDependency {
    var inputPostFactory: any InputPostFactory {
        return appComponent.inputPostFactory
    }
    var postDomainFactory: any PostDomainFactory {
        return appComponent.postDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->PostDetailComponent
private func factorybc555a73df3767a26999f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PostDetailDependencycf431278832ae8226535Provider(appComponent: parent1(component) as! AppComponent)
}
private class SuccessChangePasswordDependency05dde412f91beb4c3b8dProvider: SuccessChangePasswordDependency {
    var myPageFactory: any MyPageFactory {
        return appComponent.myPageFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SuccessChangePasswordComponent
private func factoryde3552d9e0f793ec8b8df47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SuccessChangePasswordDependency05dde412f91beb4c3b8dProvider(appComponent: parent1(component) as! AppComponent)
}
private class NewPasswordDependency3320cbf6e40b8cd8a8eaProvider: NewPasswordDependency {
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->NewPasswordComponent
private func factory52985a6d5ec65d75bd97f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NewPasswordDependency3320cbf6e40b8cd8a8eaProvider(appComponent: parent1(component) as! AppComponent)
}
private class InquiryListDependencyec75a7335a50ded93b28Provider: InquiryListDependency {
    var inputInquiryFactory: any InputInquiryFactory {
        return appComponent.inputInquiryFactory
    }
    var inquiryDetailFactory: any InquiryDetailFactory {
        return appComponent.inquiryDetailFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    var inquiryDomainFactory: any InquiryDomainFactory {
        return appComponent.inquiryDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InquiryListComponent
private func factorydd7e28250a180554c7a0f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InquiryListDependencyec75a7335a50ded93b28Provider(appComponent: parent1(component) as! AppComponent)
}
private class ClubdetailDependency09c03e1ee67d1fbecba1Provider: ClubdetailDependency {
    var studentInfoFactory: any StudentInfoFactory {
        return appComponent.studentInfoFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    var clubDomainFactory: any ClubDomainFactory {
        return appComponent.clubDomainFactory
    }
    var userDomainFactory: any UserDomainFactory {
        return appComponent.userDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ClubDetailComponent
private func factory1559652f8e80cfa88d06f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ClubdetailDependency09c03e1ee67d1fbecba1Provider(appComponent: parent1(component) as! AppComponent)
}
private class ActivityListDependencyb8e659960978b8384f80Provider: ActivityListDependency {
    var activityDetailFactory: any ActivityDetailFactory {
        return appComponent.activityDetailFactory
    }
    var inputActivityFactory: any InputActivityFactory {
        return appComponent.inputActivityFactory
    }
    var activityDomainFactory: any ActivityDomainFactory {
        return appComponent.activityDomainFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ActivityListComponent
private func factory7177e6769ee69064a61bf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ActivityListDependencyb8e659960978b8384f80Provider(appComponent: parent1(component) as! AppComponent)
}
private class LoginDependencyf4e78d0ad57be469bfd9Provider: LoginDependency {
    var signupFactory: any SignUpFactory {
        return appComponent.signupFactory
    }
    var findPasswordFactory: any FindPasswordFactory {
        return appComponent.findPasswordFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->LoginComponent
private func factoryd6018e98563de75a2ba4f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LoginDependencyf4e78d0ad57be469bfd9Provider(appComponent: parent1(component) as! AppComponent)
}
private class LectureListDependencyf05b805b4d41a7643bcdProvider: LectureListDependency {
    var lectureDetailFactory: any LectureDetailFactory {
        return appComponent.lectureDetailFactory
    }
    var openedLectureFactory: any OpenedLectureFactory {
        return appComponent.openedLectureFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    var lectureDomainFactory: any LectureDomainFactory {
        return appComponent.lectureDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->LectureListComponent
private func factorya2eac906a839dcacda45f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LectureListDependencyf05b805b4d41a7643bcdProvider(appComponent: parent1(component) as! AppComponent)
}
private class PostDetailSettingDependency372dc6ac7d7de7c5ac4eProvider: PostDetailSettingDependency {


    init() {

    }
}
/// ^->AppComponent->PostDetailSettingComponent
private func factoryaacb19523586bb790cade3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PostDetailSettingDependency372dc6ac7d7de7c5ac4eProvider()
}
private class ActivityDetailDependencyc459286ea5f8c1b2ecdbProvider: ActivityDetailDependency {
    var inputActivityFactory: any InputActivityFactory {
        return appComponent.inputActivityFactory
    }
    var authDomainFactory: any AuthDomainFactory {
        return appComponent.authDomainFactory
    }
    var activityDomainFactory: any ActivityDomainFactory {
        return appComponent.activityDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ActivityDetailComponent
private func factory7c395808ac9dfb8fb229f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ActivityDetailDependencyc459286ea5f8c1b2ecdbProvider(appComponent: parent1(component) as! AppComponent)
}
private class NoticeDetailDependency3e09bbd26d7f6105e665Provider: NoticeDetailDependency {
    var inputNoticeFactory: any InputNoticeFactory {
        return appComponent.inputNoticeFactory
    }
    var postDomainFactory: any PostDomainFactory {
        return appComponent.postDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->NoticeDetailViewComponent
private func factory0798e0f01e95aeaff56ff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoticeDetailDependency3e09bbd26d7f6105e665Provider(appComponent: parent1(component) as! AppComponent)
}
private class InputInquiryDependency0f59954f6ae75e794799Provider: InputInquiryDependency {
    var inquiryDomainFactory: any InquiryDomainFactory {
        return appComponent.inquiryDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InputInquiryComponent
private func factory818540ce7b5cc0ed9d3bf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputInquiryDependency0f59954f6ae75e794799Provider(appComponent: parent1(component) as! AppComponent)
}
private class InputActivityDependency4e692e68e51cea5b706dProvider: InputActivityDependency {
    var activityDetailSettingFactory: any ActivityDetailSettingFactory {
        return appComponent.activityDetailSettingFactory
    }
    var activityDomainFactory: any ActivityDomainFactory {
        return appComponent.activityDomainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InputActivityComponent
private func factory3fc1a279eeb8c906e603f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputActivityDependency4e692e68e51cea5b706dProvider(appComponent: parent1(component) as! AppComponent)
}
private class EmailDomainDependencyd4966e9b07ddaefa4c16Provider: EmailDomainDependency {
    var keychainFactory: any KeyChainFactory {
        return appComponent.keychainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->EmailDomainComponent
private func factory632652f0492646588fdaf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmailDomainDependencyd4966e9b07ddaefa4c16Provider(appComponent: parent1(component) as! AppComponent)
}
private class PostDomainDependencyc7a1b92747a8663be701Provider: PostDomainDependency {
    var keychainFactory: any KeyChainFactory {
        return appComponent.keychainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->PostDomainComponent
private func factory667855d0af313b0faafef47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PostDomainDependencyc7a1b92747a8663be701Provider(appComponent: parent1(component) as! AppComponent)
}
private class ActivityDomainDependency7a269aa98db8c8ca0300Provider: ActivityDomainDependency {
    var keychainFactory: any KeyChainFactory {
        return appComponent.keychainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ActivityDomainComponent
private func factorye2f926d9af1028352b5bf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ActivityDomainDependency7a269aa98db8c8ca0300Provider(appComponent: parent1(component) as! AppComponent)
}
private class LectureDomainDependency1f7716d4e720247d3989Provider: LectureDomainDependency {
    var keychainFactory: any KeyChainFactory {
        return appComponent.keychainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->LectureDomainComponent
private func factory587036efb83aae36805bf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LectureDomainDependency1f7716d4e720247d3989Provider(appComponent: parent1(component) as! AppComponent)
}
private class FAQDomainDependencyb28fed011af592a84f97Provider: FAQDomainDependency {
    var keychainFactory: any KeyChainFactory {
        return appComponent.keychainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FAQDomainComponent
private func factoryd8ebd51d9ebb6f479b0bf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FAQDomainDependencyb28fed011af592a84f97Provider(appComponent: parent1(component) as! AppComponent)
}
private class WithdrawDomainDependencyd890c80755ae82a2a38fProvider: WithdrawDomainDependency {
    var keychainFactory: any KeyChainFactory {
        return appComponent.keychainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->WithdrawDomainComponent
private func factory17c3671eb091bff25a95f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return WithdrawDomainDependencyd890c80755ae82a2a38fProvider(appComponent: parent1(component) as! AppComponent)
}
private class CertificationDomainDependency288a5a84494f7060ebb9Provider: CertificationDomainDependency {
    var keychainFactory: any KeyChainFactory {
        return appComponent.keychainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->CertificationDomainComponent
private func factoryce5e11eba04e6247ecaff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CertificationDomainDependency288a5a84494f7060ebb9Provider(appComponent: parent1(component) as! AppComponent)
}
private class InquiryDomainDependency2984397cd69537b7082bProvider: InquiryDomainDependency {
    var keychainFactory: any KeyChainFactory {
        return appComponent.keychainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InquiryDomainComponent
private func factory834f33d433943406b7eff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InquiryDomainDependency2984397cd69537b7082bProvider(appComponent: parent1(component) as! AppComponent)
}
private class AuthDomainDependency4518b8977185a5c9ff71Provider: AuthDomainDependency {
    var keychainFactory: any KeyChainFactory {
        return appComponent.keychainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AuthDomainComponent
private func factoryc9b20c320bb79402d4c1f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthDomainDependency4518b8977185a5c9ff71Provider(appComponent: parent1(component) as! AppComponent)
}
private class ClubDomainDependencya8fb26e0ae584b226398Provider: ClubDomainDependency {
    var keychainFactory: any KeyChainFactory {
        return appComponent.keychainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ClubDomainComponent
private func factoryc68c789ef93ec3e73c13f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ClubDomainDependencya8fb26e0ae584b226398Provider(appComponent: parent1(component) as! AppComponent)
}
private class UserDomainDependencyf39d2a2922733361cbe1Provider: UserDomainDependency {
    var keychainFactory: any KeyChainFactory {
        return appComponent.keychainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->UserDomainComponent
private func factory46488402f315d7f9530cf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return UserDomainDependencyf39d2a2922733361cbe1Provider(appComponent: parent1(component) as! AppComponent)
}
private class AdminDomainDependency7a2f20499e2bfc4b417aProvider: AdminDomainDependency {
    var keychainFactory: any KeyChainFactory {
        return appComponent.keychainFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AdminDomainComponent
private func factory6b27c63a4ef93d1d4e2ff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AdminDomainDependency7a2f20499e2bfc4b417aProvider(appComponent: parent1(component) as! AppComponent)
}

#else
extension KeyChainComponent: Registration {
    public func registerItems() {

    }
}
extension AppComponent: Registration {
    public func registerItems() {

        localTable["rootComponent-RootComponent"] = { [unowned self] in self.rootComponent as Any }
        localTable["loginFactory-any LoginFactory"] = { [unowned self] in self.loginFactory as Any }
        localTable["activityListFactory-any ActivityListFactory"] = { [unowned self] in self.activityListFactory as Any }
        localTable["signupFactory-any SignUpFactory"] = { [unowned self] in self.signupFactory as Any }
        localTable["successSignUpFactory-any SuccessSignUpFactory"] = { [unowned self] in self.successSignUpFactory as Any }
        localTable["inputActivityFactory-any InputActivityFactory"] = { [unowned self] in self.inputActivityFactory as Any }
        localTable["activityDetailFactory-any ActivityDetailFactory"] = { [unowned self] in self.activityDetailFactory as Any }
        localTable["activityDetailSettingFactory-any ActivityDetailSettingFactory"] = { [unowned self] in self.activityDetailSettingFactory as Any }
        localTable["clubDetailFactory-any ClubDetailFactory"] = { [unowned self] in self.clubDetailFactory as Any }
        localTable["clubListFactory-any ClubListFactory"] = { [unowned self] in self.clubListFactory as Any }
        localTable["lectureListFactory-any LectureListFactory"] = { [unowned self] in self.lectureListFactory as Any }
        localTable["lectureDetailFactory-any LectureDetailFactory"] = { [unowned self] in self.lectureDetailFactory as Any }
        localTable["openedLectureFactory-any OpenedLectureFactory"] = { [unowned self] in self.openedLectureFactory as Any }
        localTable["lectureDetailSettingFactory-any LectureDetailSettingFactory"] = { [unowned self] in self.lectureDetailSettingFactory as Any }
        localTable["postListFactory-any PostListFactory"] = { [unowned self] in self.postListFactory as Any }
        localTable["postDetailSettingFactory-any PostDetailSettingFactory"] = { [unowned self] in self.postDetailSettingFactory as Any }
        localTable["inputPostFactory-any InputPostFactory"] = { [unowned self] in self.inputPostFactory as Any }
        localTable["postDetailFactory-any PostDetailFactory"] = { [unowned self] in self.postDetailFactory as Any }
        localTable["noticeListFactory-any NoticeListFactory"] = { [unowned self] in self.noticeListFactory as Any }
        localTable["inquiryListFactory-any InquiryListFactory"] = { [unowned self] in self.inquiryListFactory as Any }
        localTable["noticeDetailFactory-any NoticeDetailFactory"] = { [unowned self] in self.noticeDetailFactory as Any }
        localTable["studentInfoFactory-any StudentInfoFactory"] = { [unowned self] in self.studentInfoFactory as Any }
        localTable["inputCertificationFactory-any InputCertificationFactory"] = { [unowned self] in self.inputCertificationFactory as Any }
        localTable["mainFactory-any MainFactory"] = { [unowned self] in self.mainFactory as Any }
        localTable["myPageFactory-any MyPageFactory"] = { [unowned self] in self.myPageFactory as Any }
        localTable["mainTabFactory-any MainTabFactory"] = { [unowned self] in self.mainTabFactory as Any }
        localTable["inputNoticeFactory-any InputNoticeFactory"] = { [unowned self] in self.inputNoticeFactory as Any }
        localTable["noticeDetailSettingFactory-any NoticeDetailSettingFactory"] = { [unowned self] in self.noticeDetailSettingFactory as Any }
        localTable["inputInquiryFactory-any InputInquiryFactory"] = { [unowned self] in self.inputInquiryFactory as Any }
        localTable["inquiryDetailFactory-any InquiryDetailFactory"] = { [unowned self] in self.inquiryDetailFactory as Any }
        localTable["writeInquiryAnswerFactory-any WriteInquiryAnswerFactory"] = { [unowned self] in self.writeInquiryAnswerFactory as Any }
        localTable["changePasswordFactory-any ChangePasswordFactory"] = { [unowned self] in self.changePasswordFactory as Any }
        localTable["successChangePasswordFactory-any SuccessChangePasswordFactory"] = { [unowned self] in self.successChangePasswordFactory as Any }
        localTable["adminUserListFactory-any AdminUserListFactory"] = { [unowned self] in self.adminUserListFactory as Any }
        localTable["adminRequestUserSignupFactory-any AdminRequestUserSignupFactory"] = { [unowned self] in self.adminRequestUserSignupFactory as Any }
        localTable["adminWithdrawUserListFactory-any AdminWithdrawUserListFactory"] = { [unowned self] in self.adminWithdrawUserListFactory as Any }
        localTable["findPasswordFactory-any FindPasswordFactory"] = { [unowned self] in self.findPasswordFactory as Any }
        localTable["newPasswordFactory-any NewPasswordFactory"] = { [unowned self] in self.newPasswordFactory as Any }
        localTable["lectureApplicantListFactory-any LectureApplicantListFactory"] = { [unowned self] in self.lectureApplicantListFactory as Any }
        localTable["authDomainFactory-any AuthDomainFactory"] = { [unowned self] in self.authDomainFactory as Any }
        localTable["activityDomainFactory-any ActivityDomainFactory"] = { [unowned self] in self.activityDomainFactory as Any }
        localTable["adminDomainFactory-any AdminDomainFactory"] = { [unowned self] in self.adminDomainFactory as Any }
        localTable["certificationDomainFactory-any CertificationDomainFactory"] = { [unowned self] in self.certificationDomainFactory as Any }
        localTable["clubDomainFactory-any ClubDomainFactory"] = { [unowned self] in self.clubDomainFactory as Any }
        localTable["emailDomainFactory-any EmailDomainFactory"] = { [unowned self] in self.emailDomainFactory as Any }
        localTable["faqDomainFactory-any FAQDomainFactory"] = { [unowned self] in self.faqDomainFactory as Any }
        localTable["inquiryDomainFactory-any InquiryDomainFactory"] = { [unowned self] in self.inquiryDomainFactory as Any }
        localTable["lectureDomainFactory-any LectureDomainFactory"] = { [unowned self] in self.lectureDomainFactory as Any }
        localTable["postDomainFactory-any PostDomainFactory"] = { [unowned self] in self.postDomainFactory as Any }
        localTable["userDomainFactory-any UserDomainFactory"] = { [unowned self] in self.userDomainFactory as Any }
        localTable["withdrawDomainFactory-any WithdrawDomainFactory"] = { [unowned self] in self.withdrawDomainFactory as Any }
        localTable["keychainFactory-any KeyChainFactory"] = { [unowned self] in self.keychainFactory as Any }
    }
}
extension InputPostComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputPostDependency.postDetailSettingFactory] = "postDetailSettingFactory-any PostDetailSettingFactory"
        keyPathToName[\InputPostDependency.postDomainFactory] = "postDomainFactory-any PostDomainFactory"
    }
}
extension InputCertificationComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputCertificationDependency.certificationDomainFactory] = "certificationDomainFactory-any CertificationDomainFactory"
    }
}
extension ClubListComponent: Registration {
    public func registerItems() {
        keyPathToName[\ClubListDependency.clubDetailFactory] = "clubDetailFactory-any ClubDetailFactory"
        keyPathToName[\ClubListDependency.clubDomainFactory] = "clubDomainFactory-any ClubDomainFactory"
        keyPathToName[\ClubListDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
    }
}
extension AdminUserListComponent: Registration {
    public func registerItems() {
        keyPathToName[\AdminUserListDependency.adminRequestUserSignupFactory] = "adminRequestUserSignupFactory-any AdminRequestUserSignupFactory"
        keyPathToName[\AdminUserListDependency.adminWithdrawUserListFactory] = "adminWithdrawUserListFactory-any AdminWithdrawUserListFactory"
        keyPathToName[\AdminUserListDependency.adminDomainFactory] = "adminDomainFactory-any AdminDomainFactory"
    }
}
extension NoticeListComponent: Registration {
    public func registerItems() {
        keyPathToName[\NoticeListDependency.inquiryListFactory] = "inquiryListFactory-any InquiryListFactory"
        keyPathToName[\NoticeListDependency.noticeDetailFactory] = "noticeDetailFactory-any NoticeDetailFactory"
        keyPathToName[\NoticeListDependency.inputNoticeFactory] = "inputNoticeFactory-any InputNoticeFactory"
        keyPathToName[\NoticeListDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
        keyPathToName[\NoticeListDependency.postDomainFactory] = "postDomainFactory-any PostDomainFactory"
    }
}
extension OpenedLectureComponent: Registration {
    public func registerItems() {
        keyPathToName[\OpenedLectureDependency.lectureDomainFactory] = "lectureDomainFactory-any LectureDomainFactory"
        keyPathToName[\OpenedLectureDependency.lectureDetailSettingFactory] = "lectureDetailSettingFactory-any LectureDetailSettingFactory"
    }
}
extension SignUpComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignUpDependency.successSignUpFactory] = "successSignUpFactory-any SuccessSignUpFactory"
        keyPathToName[\SignUpDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
    }
}
extension ActivityDetailSettingComponent: Registration {
    public func registerItems() {

    }
}
extension MainTabComponent: Registration {
    public func registerItems() {
        keyPathToName[\MainTabDependency.mainFactory] = "mainFactory-any MainFactory"
        keyPathToName[\MainTabDependency.lectureListFactory] = "lectureListFactory-any LectureListFactory"
        keyPathToName[\MainTabDependency.postListFactory] = "postListFactory-any PostListFactory"
        keyPathToName[\MainTabDependency.clubListFactory] = "clubListFactory-any ClubListFactory"
        keyPathToName[\MainTabDependency.myPageFactory] = "myPageFactory-any MyPageFactory"
    }
}
extension NoticeDetailSettingComponent: Registration {
    public func registerItems() {

    }
}
extension MyPageComponent: Registration {
    public func registerItems() {
        keyPathToName[\MyPageDependency.changePasswordFactory] = "changePasswordFactory-any ChangePasswordFactory"
        keyPathToName[\MyPageDependency.adminUserListFactory] = "adminUserListFactory-any AdminUserListFactory"
        keyPathToName[\MyPageDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
        keyPathToName[\MyPageDependency.userDomainFactory] = "userDomainFactory-any UserDomainFactory"
    }
}
extension LectureDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\LectureDetailDependency.lectureApplicantListFactory] = "lectureApplicantListFactory-any LectureApplicantListFactory"
        keyPathToName[\LectureDetailDependency.lectureDomainFactory] = "lectureDomainFactory-any LectureDomainFactory"
        keyPathToName[\LectureDetailDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
    }
}
extension InquiryDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\InquiryDetailDependency.inputInquiryFactory] = "inputInquiryFactory-any InputInquiryFactory"
        keyPathToName[\InquiryDetailDependency.writeInquiryAnswerFactory] = "writeInquiryAnswerFactory-any WriteInquiryAnswerFactory"
        keyPathToName[\InquiryDetailDependency.inquiryDomainFactory] = "inquiryDomainFactory-any InquiryDomainFactory"
        keyPathToName[\InquiryDetailDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
    }
}
extension InputNoticeComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputNoticeDependency.noticeDetailSettingFactory] = "noticeDetailSettingFactory-any NoticeDetailSettingFactory"
        keyPathToName[\InputNoticeDependency.postDomainFactory] = "postDomainFactory-any PostDomainFactory"
    }
}
extension LectureDetailSettingComponent: Registration {
    public func registerItems() {
        keyPathToName[\LectureDetailSettingDependency.openedLectureFactory] = "openedLectureFactory-any OpenedLectureFactory"
        keyPathToName[\LectureDetailSettingDependency.lectureDomainFactory] = "lectureDomainFactory-any LectureDomainFactory"
    }
}
extension MainComponent: Registration {
    public func registerItems() {
        keyPathToName[\MainDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
        keyPathToName[\MainDependency.faqDomainFactory] = "faqDomainFactory-any FAQDomainFactory"
    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.loginFactory] = "loginFactory-any LoginFactory"
        keyPathToName[\RootDependency.mainTabFactory] = "mainTabFactory-any MainTabFactory"
        keyPathToName[\RootDependency.findPasswordFactory] = "findPasswordFactory-any FindPasswordFactory"
        keyPathToName[\RootDependency.successSignUpFactory] = "successSignUpFactory-any SuccessSignUpFactory"
    }
}
extension PostListComponent: Registration {
    public func registerItems() {
        keyPathToName[\PostListDependency.noticeListFactory] = "noticeListFactory-any NoticeListFactory"
        keyPathToName[\PostListDependency.inquiryListFactory] = "inquiryListFactory-any InquiryListFactory"
        keyPathToName[\PostListDependency.inputPostFactory] = "inputPostFactory-any InputPostFactory"
        keyPathToName[\PostListDependency.postDetailFactory] = "postDetailFactory-any PostDetailFactory"
        keyPathToName[\PostListDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
        keyPathToName[\PostListDependency.postDomainFactory] = "postDomainFactory-any PostDomainFactory"
    }
}
extension ChangePasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\ChangePasswordDependency.successChangePasswordFactory] = "successChangePasswordFactory-any SuccessChangePasswordFactory"
        keyPathToName[\ChangePasswordDependency.userDomainFactory] = "userDomainFactory-any UserDomainFactory"
    }
}
extension SuccessSignUpComponent: Registration {
    public func registerItems() {

    }
}
extension FindPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindPasswordDependency.newPasswordFactory] = "newPasswordFactory-any NewPasswordFactory"
        keyPathToName[\FindPasswordDependency.emailDomainFactory] = "emailDomainFactory-any EmailDomainFactory"
    }
}
extension AdminRequestUserSignupComponent: Registration {
    public func registerItems() {
        keyPathToName[\AdminRequestUserSignupDependency.adminUserListFactory] = "adminUserListFactory-any AdminUserListFactory"
        keyPathToName[\AdminRequestUserSignupDependency.adminWithdrawUserListFactory] = "adminWithdrawUserListFactory-any AdminWithdrawUserListFactory"
        keyPathToName[\AdminRequestUserSignupDependency.adminDomainFactory] = "adminDomainFactory-any AdminDomainFactory"
    }
}
extension LectureApplicantListComponent: Registration {
    public func registerItems() {
        keyPathToName[\LectureApplicantListDependency.lectureDomainFactory] = "lectureDomainFactory-any LectureDomainFactory"
    }
}
extension StudentInfoComponent: Registration {
    public func registerItems() {
        keyPathToName[\StudentInfoDependency.activityListFactory] = "activityListFactory-any ActivityListFactory"
        keyPathToName[\StudentInfoDependency.inputCertificationFactory] = "inputCertificationFactory-any InputCertificationFactory"
        keyPathToName[\StudentInfoDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
        keyPathToName[\StudentInfoDependency.clubDomainFactory] = "clubDomainFactory-any ClubDomainFactory"
        keyPathToName[\StudentInfoDependency.certificationDomainFactory] = "certificationDomainFactory-any CertificationDomainFactory"
        keyPathToName[\StudentInfoDependency.lectureDomainFactory] = "lectureDomainFactory-any LectureDomainFactory"
    }
}
extension AdminWithdrawUserListComponent: Registration {
    public func registerItems() {
        keyPathToName[\AdminWithdrawUserListDependency.adminUserListFactory] = "adminUserListFactory-any AdminUserListFactory"
        keyPathToName[\AdminWithdrawUserListDependency.adminRequestUserSignupFactory] = "adminRequestUserSignupFactory-any AdminRequestUserSignupFactory"
        keyPathToName[\AdminWithdrawUserListDependency.withdrawDomainFactory] = "withdrawDomainFactory-any WithdrawDomainFactory"
        keyPathToName[\AdminWithdrawUserListDependency.adminDomainFactory] = "adminDomainFactory-any AdminDomainFactory"
    }
}
extension WriteInquiryAnswerComponent: Registration {
    public func registerItems() {
        keyPathToName[\WriteInquiryAnswerDependency.inquiryDomainFactory] = "inquiryDomainFactory-any InquiryDomainFactory"
    }
}
extension PostDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\PostDetailDependency.inputPostFactory] = "inputPostFactory-any InputPostFactory"
        keyPathToName[\PostDetailDependency.postDomainFactory] = "postDomainFactory-any PostDomainFactory"
    }
}
extension SuccessChangePasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\SuccessChangePasswordDependency.myPageFactory] = "myPageFactory-any MyPageFactory"
    }
}
extension NewPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\NewPasswordDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
    }
}
extension InquiryListComponent: Registration {
    public func registerItems() {
        keyPathToName[\InquiryListDependency.inputInquiryFactory] = "inputInquiryFactory-any InputInquiryFactory"
        keyPathToName[\InquiryListDependency.inquiryDetailFactory] = "inquiryDetailFactory-any InquiryDetailFactory"
        keyPathToName[\InquiryListDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
        keyPathToName[\InquiryListDependency.inquiryDomainFactory] = "inquiryDomainFactory-any InquiryDomainFactory"
    }
}
extension ClubDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\ClubdetailDependency.studentInfoFactory] = "studentInfoFactory-any StudentInfoFactory"
        keyPathToName[\ClubdetailDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
        keyPathToName[\ClubdetailDependency.clubDomainFactory] = "clubDomainFactory-any ClubDomainFactory"
        keyPathToName[\ClubdetailDependency.userDomainFactory] = "userDomainFactory-any UserDomainFactory"
    }
}
extension ActivityListComponent: Registration {
    public func registerItems() {
        keyPathToName[\ActivityListDependency.activityDetailFactory] = "activityDetailFactory-any ActivityDetailFactory"
        keyPathToName[\ActivityListDependency.inputActivityFactory] = "inputActivityFactory-any InputActivityFactory"
        keyPathToName[\ActivityListDependency.activityDomainFactory] = "activityDomainFactory-any ActivityDomainFactory"
        keyPathToName[\ActivityListDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
    }
}
extension LoginComponent: Registration {
    public func registerItems() {
        keyPathToName[\LoginDependency.signupFactory] = "signupFactory-any SignUpFactory"
        keyPathToName[\LoginDependency.findPasswordFactory] = "findPasswordFactory-any FindPasswordFactory"
        keyPathToName[\LoginDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
    }
}
extension LectureListComponent: Registration {
    public func registerItems() {
        keyPathToName[\LectureListDependency.lectureDetailFactory] = "lectureDetailFactory-any LectureDetailFactory"
        keyPathToName[\LectureListDependency.openedLectureFactory] = "openedLectureFactory-any OpenedLectureFactory"
        keyPathToName[\LectureListDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
        keyPathToName[\LectureListDependency.lectureDomainFactory] = "lectureDomainFactory-any LectureDomainFactory"
    }
}
extension PostDetailSettingComponent: Registration {
    public func registerItems() {

    }
}
extension ActivityDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\ActivityDetailDependency.inputActivityFactory] = "inputActivityFactory-any InputActivityFactory"
        keyPathToName[\ActivityDetailDependency.authDomainFactory] = "authDomainFactory-any AuthDomainFactory"
        keyPathToName[\ActivityDetailDependency.activityDomainFactory] = "activityDomainFactory-any ActivityDomainFactory"
    }
}
extension NoticeDetailViewComponent: Registration {
    public func registerItems() {
        keyPathToName[\NoticeDetailDependency.inputNoticeFactory] = "inputNoticeFactory-any InputNoticeFactory"
        keyPathToName[\NoticeDetailDependency.postDomainFactory] = "postDomainFactory-any PostDomainFactory"
    }
}
extension InputInquiryComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputInquiryDependency.inquiryDomainFactory] = "inquiryDomainFactory-any InquiryDomainFactory"
    }
}
extension InputActivityComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputActivityDependency.activityDetailSettingFactory] = "activityDetailSettingFactory-any ActivityDetailSettingFactory"
        keyPathToName[\InputActivityDependency.activityDomainFactory] = "activityDomainFactory-any ActivityDomainFactory"
    }
}
extension EmailDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\EmailDomainDependency.keychainFactory] = "keychainFactory-any KeyChainFactory"
    }
}
extension PostDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\PostDomainDependency.keychainFactory] = "keychainFactory-any KeyChainFactory"
    }
}
extension ActivityDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\ActivityDomainDependency.keychainFactory] = "keychainFactory-any KeyChainFactory"
    }
}
extension LectureDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\LectureDomainDependency.keychainFactory] = "keychainFactory-any KeyChainFactory"
    }
}
extension FAQDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\FAQDomainDependency.keychainFactory] = "keychainFactory-any KeyChainFactory"
    }
}
extension WithdrawDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\WithdrawDomainDependency.keychainFactory] = "keychainFactory-any KeyChainFactory"
    }
}
extension CertificationDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\CertificationDomainDependency.keychainFactory] = "keychainFactory-any KeyChainFactory"
    }
}
extension InquiryDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\InquiryDomainDependency.keychainFactory] = "keychainFactory-any KeyChainFactory"
    }
}
extension AuthDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\AuthDomainDependency.keychainFactory] = "keychainFactory-any KeyChainFactory"
    }
}
extension ClubDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\ClubDomainDependency.keychainFactory] = "keychainFactory-any KeyChainFactory"
    }
}
extension UserDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\UserDomainDependency.keychainFactory] = "keychainFactory-any KeyChainFactory"
    }
}
extension AdminDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\AdminDomainDependency.keychainFactory] = "keychainFactory-any KeyChainFactory"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent->KeyChainComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->InputPostComponent", factoryfd208488fdd5cb4acc65f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputCertificationComponent", factory2810b45b31199a5f0c2af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ClubListComponent", factory050817f1b6d356b83467f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AdminUserListComponent", factory55b3a27a2b6be9af9ba4f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NoticeListComponent", factorye14e687c08985bdffcd0f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->OpenedLectureComponent", factory6636d97d1a9f0c8216d2f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignUpComponent", factory306e8ce5cfdf41304709f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ActivityDetailSettingComponent", factoryfd595280dea209e217b9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->MainTabComponent", factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NoticeDetailSettingComponent", factory24d19202afbef2333be9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->MyPageComponent", factory0f6f456ebf157d02dfb3f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LectureDetailComponent", factory94b2e1ac14af9cd1e074f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InquiryDetailComponent", factory2d6736bd037393a86ae3f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputNoticeComponent", factory4545df5fcd42aaf8ed60f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LectureDetailSettingComponent", factoryd0ffb7dfc6fd9633e0e6f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MainComponent", factoryc9274e46e78e70f29c54f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->PostListComponent", factory0c89e2bbcc02dbcac018f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ChangePasswordComponent", factoryab7c4d87dab53e0a51b9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SuccessSignUpComponent", factorybf219b153b668170161de3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->FindPasswordComponent", factory15775d8436b06b9741d1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AdminRequestUserSignupComponent", factory2c6c6f3f10221ceac3a8f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LectureApplicantListComponent", factory78a87c10d14f7bbaaa9df47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->StudentInfoComponent", factory5ce0f173abbf535f654ff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AdminWithdrawUserListComponent", factory1ef284da45544ee52e3ef47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->WriteInquiryAnswerComponent", factory3d4cadf14cd9a3336981f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->PostDetailComponent", factorybc555a73df3767a26999f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SuccessChangePasswordComponent", factoryde3552d9e0f793ec8b8df47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NewPasswordComponent", factory52985a6d5ec65d75bd97f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InquiryListComponent", factorydd7e28250a180554c7a0f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ClubDetailComponent", factory1559652f8e80cfa88d06f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ActivityListComponent", factory7177e6769ee69064a61bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LoginComponent", factoryd6018e98563de75a2ba4f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LectureListComponent", factorya2eac906a839dcacda45f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->PostDetailSettingComponent", factoryaacb19523586bb790cade3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->ActivityDetailComponent", factory7c395808ac9dfb8fb229f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NoticeDetailViewComponent", factory0798e0f01e95aeaff56ff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputInquiryComponent", factory818540ce7b5cc0ed9d3bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputActivityComponent", factory3fc1a279eeb8c906e603f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->EmailDomainComponent", factory632652f0492646588fdaf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->PostDomainComponent", factory667855d0af313b0faafef47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ActivityDomainComponent", factorye2f926d9af1028352b5bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LectureDomainComponent", factory587036efb83aae36805bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FAQDomainComponent", factoryd8ebd51d9ebb6f479b0bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->WithdrawDomainComponent", factory17c3671eb091bff25a95f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->CertificationDomainComponent", factoryce5e11eba04e6247ecaff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InquiryDomainComponent", factory834f33d433943406b7eff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AuthDomainComponent", factoryc9b20c320bb79402d4c1f47b58f8f304c97af4d5)
}

@inline(never) private func register2() {
    registerProviderFactory("^->AppComponent->ClubDomainComponent", factoryc68c789ef93ec3e73c13f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->UserDomainComponent", factory46488402f315d7f9530cf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AdminDomainComponent", factory6b27c63a4ef93d1d4e2ff47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
    register2()
#endif
}
