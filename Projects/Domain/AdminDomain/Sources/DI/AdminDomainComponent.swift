import AdminDomainInterface
import KeychainInterface
import NeedleFoundation

public protocol AdminDomainDependency: Dependency {
    var keychainFactory: any KeyChainFactory { get }
}

public final class AdminDomainComponent: Component<AdminDomainDependency>, AdminDomainFactory {
    public var fetchUserListUseCase: any FetchUserListUseCase {
        FetchUserListUseCaseImpl(adminRepository: adminRepository)
    }

    public var fetchUserDetailUseCase: any FetchUserDetailUseCase {
        FetchUserDetailUseCaseImpl(adminRepository: adminRepository)
    }

    public var approveUserSignupUseCase: any ApproveUserSignupUseCase {
        ApproveUserSignupUseCaseImpl(adminRepository: adminRepository)
    }

    public var rejectUserSignupUseCase: any RejectUserSignupUseCase {
        RejectUserSignupUseCaseImpl(adminRepository: adminRepository)
    }

    public var withdrawUserUseCase: any WithdrawUserUseCase {
        WithdrawUserUseCaseImpl(adminRepository: adminRepository)
    }

    public var adminRepository: any AdminRepository {
        AdminRespositoryImpl(remoteAdminDataSource: remoteAdminDataSource)
    }

    var remoteAdminDataSource: RemoteAdminDataSource {
        RemoteAdminDataSourceImpl(keychain: dependency.keychainFactory.keychain)
    }
}
