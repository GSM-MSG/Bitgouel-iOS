import AuthDomainInterface
import NeedleFoundation
import SignupFeatureInterface
import SuccessSignupFeatureInterface
import SwiftUI

public protocol SignUpDependency: Dependency {
    var successSignUpFactory: any SuccessSignUpFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
}

public final class SignUpComponent: Component<SignUpDependency>, SignUpFactory {
    public func makeView() -> some View {
        SignUpView(
            viewModel: .init(
                studentSignupUseCase: dependency.authDomainFactory.studentSignupUseCase,
                teacherSignupUseCase: dependency.authDomainFactory.teacherSignupUseCase,
                bbozzakSignupUseCase: dependency.authDomainFactory.bbozzakSignupUseCase,
                professorSignupUseCase: dependency.authDomainFactory.professorSignupUseCase,
                governmentSignupUseCase: dependency.authDomainFactory.governmentSignupUseCase,
                companyInstructorSignupUseCase: dependency.authDomainFactory.companyInstructorSignupUseCase
            ),
            successSignUpFactory: dependency.successSignUpFactory
        )
    }
}
