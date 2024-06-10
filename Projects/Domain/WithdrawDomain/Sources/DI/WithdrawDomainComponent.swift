import KeychainInterface
import NeedleFoundation
import WithdrawDomainInterface

public protocol WithdrawDomainDependency: Dependency {
    var keychainFactory: any KeyChainFactory { get }
}

public final class WithdrawDomainComponent: Component<WithdrawDomainDependency>, WithdrawDomainFactory {
    public var fetchWithdrawUserListUseCase: any FetchWithdrawUserListUseCase {
        FetchWithdrawUserListUseCaseImpl(withdrawRepository: withdrawRepository)
    }

    public var withdrawRepository: any WithdrawRepository {
        WithdrawRepositoryImpl(remoteWithdrawDataSource: remoteWithdrawDataSource)
    }

    var remoteWithdrawDataSource: any RemoteWithdrawDataSource {
        RemoteWithdrawDataSourceImpl(keychain: dependency.keychainFactory.keychain)
    }
}
