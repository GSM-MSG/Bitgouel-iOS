import AuthDomainInterface
import Foundation
import KeychainInterface
import NeedleFoundation

public protocol AuthDomainDependency: Dependency {
    var keychainFactory: any KeyChainFactory { get }
}

public final class AuthDomainComponent: Component<AuthDomainDependency>, AuthDomainFactory {
    public var loginUseCase: any LoginUseCase {
        LoginUseCaseImpl(authRepository: authRepository)
    }

    public var saveUserAuthorityUseCase: any SaveUserAuthorityUseCase {
        SaveUserAuthorityUseCaseImpl(authRepository: authRepository)
    }

    public var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        LoadUserAuthorityUseCaseImpl(authRepository: authRepository)
    }

    public var reissueTokenUseCase: any ReissueTokenUseCase {
        ReissueTokenUseCaseImpl(authRepository: authRepository)
    }

    public var logoutUseCase: any LogoutUseCase {
        LogoutUseCaseImpl(authRepository: authRepository)
    }

    public var withdrawalUseCase: any WithdrawalUseCase {
        WithdrawalUseCaseImpl(authRepository: authRepository)
    }

    public var studentSignupUseCase: any StudentSignupUseCase {
        StudentSignupUseCaseImpl(authRepository: authRepository)
    }

    public var teacherSignupUseCase: any TeacherSignupUseCase {
        TeacherSignupUseCaseImpl(authRepository: authRepository)
    }

    public var bbozzakSignupUseCase: any BbozzakSignupUseCase {
        BbozzakSingupUseCaseImpl(authRepository: authRepository)
    }

    public var professorSignupUseCase: any ProfessorSignupUseCase {
        ProfessorSignupUseCaseImpl(authRepository: authRepository)
    }

    public var governmentSignupUseCase: any GovernmentSignupUseCase {
        GovernmentSignupUseCaseImpl(authRepository: authRepository)
    }

    public var companyInstructorSignupUseCase: any CompanyInstructorSignupUseCase {
        CompanyInstructorSignupUseCaseImpl(authRepository: authRepository)
    }

    public var findPasswordUseCase: any FindPasswordUseCase {
        FindPasswordUseCaseImpl(authRepository: authRepository)
    }

    public var authRepository: any AuthRepository {
        AuthRepositoryImpl(
            remoteAuthDataSource: remoteAuthDataSource,
            localAuthDataSource: localAuthDataSource
        )
    }

    var remoteAuthDataSource: RemoteAuthDataSource {
        RemoteAuthDataSourceImpl(keychain: dependency.keychainFactory.keychain)
    }

    var localAuthDataSource: LocalAuthDataSource {
        LocalAuthDataSourceImpl(
            keychain: dependency.keychainFactory.keychain,
            userDefaults: .standard
        )
    }
}
