import AdminDomainInterface

struct FetchUserDetailUseCaseImpl: FetchUserDetailUseCase {
    private let adminRepository: AdminRepository

    init(adminRepository: AdminRepository) {
        self.adminRepository = adminRepository
    }

    func callAsFunction(userID: String) async throws -> UserInfoEntity {
        try await adminRepository.fetchUserDetail(userID: userID)
    }
}
