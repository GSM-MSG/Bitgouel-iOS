import ActivityDomainInterface

struct DeleteActivityUseCaseImpl: DeleteActivityUseCase {
    private let activityRepository: ActivityRepository

    init(activityRepository: ActivityRepository) {
        self.activityRepository = activityRepository
    }

    func callAsFunction(activityID: String) async throws {
        try await activityRepository.deleteActivity(activityID: activityID)
    }
}
