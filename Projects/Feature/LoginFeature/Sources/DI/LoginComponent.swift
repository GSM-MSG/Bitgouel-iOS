import AuthDomainInterface
import FindPasswordFeatureInterface
import LoginFeatureInterface
import NeedleFoundation
import SignupFeatureInterface
import SwiftUI

public protocol LoginDependency: Dependency {
    var signupFactory: any SignUpFactory { get }
    var findPasswordFactory: any FindPasswordFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
}

public final class LoginComponent: Component<LoginDependency>, LoginFactory {
    public func makeView() -> some View {
        LoginView(
            viewModel: .init(
                loginUseCase: dependency.authDomainFactory.loginUseCase,
                saveUserAuthority: dependency.authDomainFactory.saveUserAuthorityUseCase
            ),
            signupFactory: dependency.signupFactory,
            findPasswordFactory: dependency.findPasswordFactory
        )
    }
}
