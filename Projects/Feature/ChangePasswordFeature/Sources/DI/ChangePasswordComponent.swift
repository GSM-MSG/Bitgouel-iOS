import ChangePasswordFeatureInterface
import NeedleFoundation
import SuccessChangePasswordFeatureInterface
import SwiftUI
import UserDomainInterface

public protocol ChangePasswordDependency: Dependency {
    var successChangePasswordFactory: any SuccessChangePasswordFactory { get }
    var userDomainFactory: any UserDomainFactory { get }
}

public final class ChangePasswordComponent: Component<ChangePasswordDependency>, ChangePasswordFactory {
    public func makeView() -> some View {
        ChangePasswordView(
            viewModel: .init(
                changePasswordUseCase: dependency.userDomainFactory.changePasswordUseCase
            ),
            successChangePasswordFactory: dependency.successChangePasswordFactory
        )
    }
}
