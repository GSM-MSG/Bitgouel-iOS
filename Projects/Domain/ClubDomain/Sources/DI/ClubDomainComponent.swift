import ClubDomainInterface
import KeychainInterface
import NeedleFoundation

public protocol ClubDomainDependency: Dependency {
    var keychainFactory: any KeyChainFactory { get }
}

public final class ClubDomainComponent: Component<ClubDomainDependency>, ClubDomainFactory {
    public var fetchClubListUseCase: any FetchClubListUseCase {
        FetchClubListUseCaseImpl(clubRepository: clubRepository)
    }

    public var fetchClubDetailUseCase: any FetchClubDetailUseCase {
        FetchClubDatailUseCaseImpl(clubRepository: clubRepository)
    }

    public var fetchStudentListByClubUseCase: any FetchStudentListByClubUseCase {
        FetchStudentListByClubUseCaseImpl(clubRepository: clubRepository)
    }

    public var fetchStudentDetailByClubUseCase: any FetchStudentDetailByClubUseCase {
        FetchStudentDetailByClubUseCaseImpl(clubRepository: clubRepository)
    }

    public var clubRepository: any ClubRepository {
        ClubRepositoryImpl(remoteClubDataSource: remoteClubDataSource)
    }

    var remoteClubDataSource: any RemoteClubDataSource {
        RemoteClubDataSourceImpl(keychain: dependency.keychainFactory.keychain)
    }
}
