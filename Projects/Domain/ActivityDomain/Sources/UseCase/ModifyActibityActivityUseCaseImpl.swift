import ActivityDomainInterface

struct ModifyActivityUseCaseImpl: ModifyActivityUseCase {
    private let activityRepository: any ActivityRepository

    init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }

    func callAsFunction(activityID: String, req: InputActivityRequestDTO) async throws {
        try await activityRepository.modifyActivity(activityID: activityID, req: req)
    }
}
