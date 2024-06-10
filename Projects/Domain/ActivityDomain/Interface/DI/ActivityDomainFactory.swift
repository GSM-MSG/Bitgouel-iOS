public protocol ActivityDomainFactory {
    var inputActivityUseCase: any InputActivityUseCase { get }
    var modifyActivityUseCase: any ModifyActivityUseCase { get }
    var deleteActivityUseCase: any DeleteActivityUseCase { get }
    var fetchMyActivityUseCase: any FetchMyActivityUseCase { get }
    var fetchActivityByIDUseCase: any FetchActivityByIDUseCase { get }
    var fetchActivityListUseCase: any FetchActivityListUseCase { get }
    var fetchActivityDetailUseCase: any FetchActivityDetailUseCase { get }
    var activityRepository: any ActivityRepository { get }
}
