import ActivityDomainInterface

struct InputActivityUseCaseImpl: InputActivityUseCase {
    private let activityRepository: any ActivityRepository

    init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    func callAsFunction(req: InputActivityRequestDTO) async throws {
        try await activityRepository.inputActivity(req: req)
    }
}
