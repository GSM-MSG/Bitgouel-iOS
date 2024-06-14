import AdminDomainInterface
import AdminRequestUserSignupFeatureInterface
import AdminUserListFeatureInterface
import AdminWithdrawUserListFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol AdminRequestUserSignupDependency: Dependency {
    var adminUserListFactory: any AdminUserListFactory { get }
    var adminWithdrawUserListFactory: any AdminWithdrawUserListFactory { get }
    var adminDomainFactory: any AdminDomainFactory { get }
}

// swiftLint: disable line_length
public final class AdminRequestUserSignupComponent:
    Component<AdminRequestUserSignupDependency>, AdminRequestUserSignupFactory {
    @MainActor
    public func makeView() -> some View {
        AdminRequestUserSignupView(
            viewModel: .init(
                fetchUserListUseCase: dependency.adminDomainFactory.fetchUserListUseCase,
                approveUserSignupUseCase: dependency.adminDomainFactory.approveUserSignupUseCase,
                rejectUserSignupUseCase: dependency.adminDomainFactory.rejectUserSignupUseCase
            ),
            adminUserListFactory: dependency.adminUserListFactory,
            adminWithdrawUserListFactory: dependency.adminWithdrawUserListFactory
        )
    }
}
