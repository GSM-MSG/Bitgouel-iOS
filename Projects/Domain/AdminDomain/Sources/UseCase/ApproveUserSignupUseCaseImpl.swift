import AdminDomainInterface

struct ApproveUserSignupUseCaseImpl: ApproveUserSignupUseCase {
    private let adminRepository: AdminRepository

    init(adminRepository: AdminRepository) {
        self.adminRepository = adminRepository
    }

    func callAsFunction(userID: String) async throws {
        try await adminRepository.approveUserSignup(userID: userID)
    }
}
