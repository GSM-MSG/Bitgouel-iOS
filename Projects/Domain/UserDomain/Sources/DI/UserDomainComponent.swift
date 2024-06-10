import KeychainInterface
import NeedleFoundation
import UserDomainInterface

public protocol UserDomainDependency: Dependency {
    var keychainFactory: any KeyChainFactory { get }
}

public final class UserDomainComponent: Component<UserDomainDependency>, UserDomainFactory {
    public var changePasswordUseCase: any ChangePasswordUseCase {
        ChangePasswordUseCaseImpl(userRepository: userRepository)
    }

    public var fetchMyInfoUseCase: any FetchMyInfoUseCase {
        FetchMyInfoUseCaseImpl(userRepository: userRepository)
    }

    public var userRepository: any UserRepository {
        UserRepositoryImpl(remoteUserDataSource: remoteUserDataSource)
    }

    var remoteUserDataSource: any RemoteUserDataSource {
        RemoteUserDataSourceImpl(keychain: dependency.keychainFactory.keychain)
    }
}
