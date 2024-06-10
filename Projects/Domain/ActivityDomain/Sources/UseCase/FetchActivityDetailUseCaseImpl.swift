import ActivityDomainInterface

struct FetchActivityDetailUseCaseImpl: FetchActivityDetailUseCase {
    private let activityRepository: any ActivityRepository

    init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    func callAsFunction(activityID: String) async throws -> ActivityDetailEntity {
        try await activityRepository.fetchActivityDetail(activityID: activityID)
    }
}
