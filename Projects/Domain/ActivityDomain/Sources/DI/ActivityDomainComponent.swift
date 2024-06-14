import ActivityDomainInterface
import KeychainInterface
import NeedleFoundation

public protocol ActivityDomainDependency: Dependency {
    var keychainFactory: any KeyChainFactory { get }
}

public final class ActivityDomainComponent: Component<ActivityDomainDependency>, ActivityDomainFactory {
    public var inputActivityUseCase: any InputActivityUseCase {
        InputActivityUseCaseImpl(activityRepository: activityRepository)
    }

    public var modifyActivityUseCase: any ModifyActivityUseCase {
        ModifyActivityUseCaseImpl(activityRepository: activityRepository)
    }

    public var deleteActivityUseCase: any DeleteActivityUseCase {
        DeleteActivityUseCaseImpl(activityRepository: activityRepository)
    }

    public var fetchMyActivityUseCase: any FetchMyActivityUseCase {
        FetchMyActivityUseCaseImpl(activityRepository: activityRepository)
    }

    public var fetchActivityByIDUseCase: any FetchActivityByIDUseCase {
        FetchActivityByIDUseCaseImpl(activityRepository: activityRepository)
    }

    public var fetchActivityListUseCase: any FetchActivityListUseCase {
        FetchActivityListUseCaseImpl(activityRepository: activityRepository)
    }

    public var fetchActivityDetailUseCase: any FetchActivityDetailUseCase {
        FetchActivityDetailUseCaseImpl(activityRepository: activityRepository)
    }

    public var activityRepository: any ActivityRepository {
        ActivityRepositoryImpl(remoteActivityDataSource: remoteActivityDataSource)
    }

    var remoteActivityDataSource: any RemoteActivityDataSource {
        RemoteActivityDataSourceImpl(keychain: dependency.keychainFactory.keychain)
    }
}
