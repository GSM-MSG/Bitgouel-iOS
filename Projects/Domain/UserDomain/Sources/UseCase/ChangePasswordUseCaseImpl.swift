import UserDomainInterface

struct ChangePasswordUseCaseImpl: ChangePasswordUseCase {
    private let userRepository: any UserRepository

    init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    func callAsFunction(req: ChangePasswordRequestDTO) async throws {
        try await userRepository.changePassword(req: req)
    }
}
