import AuthDomainInterface
import NeedleFoundation
import NewPasswordFeatureInterface
import SwiftUI

public protocol NewPasswordDependency: Dependency {
    var authDomainFactory: any AuthDomainFactory { get }
}

public final class NewPasswordComponent: Component<NewPasswordDependency>, NewPasswordFactory {
    public func makeView(
        email: String
    ) -> some View {
        NewPasswordView(
            viewModel: .init(
                email: email,
                findPasswordUseCase: dependency.authDomainFactory.findPasswordUseCase
            )
        )
    }
}
