import UserDomainInterface

struct FetchMyInfoUseCaseImpl: FetchMyInfoUseCase {
    private let userRepository: any UserRepository

    init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    func callAsFunction() async throws -> MyInfoEntity {
        try await userRepository.fetchMyInfo()
    }
}
