import AdminDomainInterface

struct RejectUserSignupUseCaseImpl: RejectUserSignupUseCase {
    private let adminRepository: AdminRepository

    init(adminRepository: AdminRepository) {
        self.adminRepository = adminRepository
    }

    func callAsFunction(userID: String) async throws {
        try await adminRepository.rejectUserSignup(userID: userID)
    }
}
