import AdminDomainInterface
import AdminRequestUserSignupFeatureInterface
import AdminUserListFeatureInterface
import AdminWithdrawUserListFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol AdminUserListDependency: Dependency {
    var adminRequestUserSignupFactory: any AdminRequestUserSignupFactory { get }
    var adminWithdrawUserListFactory: any AdminWithdrawUserListFactory { get }
    var adminDomainFactory: any AdminDomainFactory { get }
}

public final class AdminUserListComponent: Component<AdminUserListDependency>, AdminUserListFactory {
    @MainActor
    public func makeView() -> some View {
        AdminUserListView(
            viewModel: .init(
                fetchUserListUseCase: dependency.adminDomainFactory.fetchUserListUseCase
            ),
            adminWithdrawUserListFactory: dependency.adminWithdrawUserListFactory,
            adminRequestUserSignupFactory: dependency.adminRequestUserSignupFactory
        )
    }
}
