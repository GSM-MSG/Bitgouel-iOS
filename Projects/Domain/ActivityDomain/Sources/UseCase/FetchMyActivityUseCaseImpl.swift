import ActivityDomainInterface

struct FetchMyActivityUseCaseImpl: FetchMyActivityUseCase {
    private let activityRepository: any ActivityRepository

    init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    func callAsFunction() async throws -> ActivityContentEntity {
        try await activityRepository.fetchMyActivity()
    }
}