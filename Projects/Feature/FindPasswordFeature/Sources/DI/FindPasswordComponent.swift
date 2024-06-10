import EmailDomainInterface
import FindPasswordFeatureInterface
import NeedleFoundation
import NewPasswordFeatureInterface
import SwiftUI

public protocol FindPasswordDependency: Dependency {
    var newPasswordFactory: any NewPasswordFactory { get }
    var emailDomainFactory: any EmailDomainFactory { get }
}

public final class FindPasswordComponent: Component<FindPasswordDependency>, FindPasswordFactory {
    public func makeView() -> some View {
        FindPasswordView(
            viewModel: .init(
                sendEmailCertificationLinkUseCase: dependency.emailDomainFactory.sendEmailCertificationLinkUseCase,
                fetchEmailVertificationStatusUseCase: dependency.emailDomainFactory.fetchEmailVerificationStatusUseCase
            ),
            newPasswordFactory: dependency.newPasswordFactory
        )
    }
}
