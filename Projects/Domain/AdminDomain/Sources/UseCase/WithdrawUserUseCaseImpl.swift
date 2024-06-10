import AdminDomainInterface

struct WithdrawUserUseCaseImpl: WithdrawUserUseCase {
    private let adminRepository: AdminRepository

    init(adminRepository: AdminRepository) {
        self.adminRepository = adminRepository
    }

    func callAsFunction(userID: String) async throws {
        try await adminRepository.withdrawUser(userID: userID)
    }
}
