import ActivityDomainInterface

struct FetchActivityByIDUseCaseImpl: FetchActivityByIDUseCase {
    private let activityRepository: any ActivityRepository

    init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    func callAsFunction(studentID: String) async throws -> ActivityContentEntity {
        try await activityRepository.fetchActivityByID(studentID: studentID)
    }
}
