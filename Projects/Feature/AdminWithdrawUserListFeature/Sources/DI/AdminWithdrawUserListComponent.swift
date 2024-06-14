import AdminDomainInterface
import AdminRequestUserSignupFeatureInterface
import AdminUserListFeatureInterface
import AdminWithdrawUserListFeatureInterface
import NeedleFoundation
import SwiftUI
import WithdrawDomainInterface

public protocol AdminWithdrawUserListDependency: Dependency {
    var adminUserListFactory: any AdminUserListFactory { get }
    var adminRequestUserSignupFactory: any AdminRequestUserSignupFactory { get }
    var withdrawDomainFactory: any WithdrawDomainFactory { get }
    var adminDomainFactory: any AdminDomainFactory { get }
}

public final class AdminWithdrawUserListComponent:
    Component<AdminWithdrawUserListDependency>, AdminWithdrawUserListFactory {
    @MainActor
    public func makeView() -> some View {
        AdminWithdrawUserListView(
            viewModel: .init(
                fetchWithdrawUserListUseCase: dependency.withdrawDomainFactory.fetchWithdrawUserListUseCase,
                withdrawUserUseCase: dependency.adminDomainFactory.withdrawUserUseCase
            ),
            adminUserListFactory: dependency.adminUserListFactory,
            adminRequestUserSignupFactory: dependency.adminRequestUserSignupFactory
        )
    }
}
