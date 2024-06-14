import AdminUserListFeatureInterface
import AuthDomainInterface
import BaseFeature
import ChangePasswordFeatureInterface
import MyPageFeatureInterface
import NeedleFoundation
import SwiftUI
import UserDomainInterface

public protocol MyPageDependency: Dependency {
    var changePasswordFactory: any ChangePasswordFactory { get }
    var adminUserListFactory: any AdminUserListFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
    var userDomainFactory: any UserDomainFactory { get }
}

public final class MyPageComponent: Component<MyPageDependency>, MyPageFactory {
    public func makeView(selection: Binding<TabFlow>) -> some View {
        MyPageView(
            viewModel: .init(
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase,
                fetchMyInfoUseCase: dependency.userDomainFactory.fetchMyInfoUseCase,
                logoutUseCase: dependency.authDomainFactory.logoutUseCase,
                withdrawalUseCase: dependency.authDomainFactory.withdrawalUseCase
            ),
            changePasswordFactory: dependency.changePasswordFactory,
            adminUserListFactory: dependency.adminUserListFactory,
            selection: selection
        )
    }
}
