import AdminDomainInterface

struct FetchUserListUseCaseImpl: FetchUserListUseCase {
    private let adminRepository: AdminRepository

    init(adminRepository: AdminRepository) {
        self.adminRepository = adminRepository
    }

    func callAsFunction(
        keyword: String,
        authority: String,
        approveStatus: String
    ) async throws -> [UserInfoEntity] {
        try await adminRepository.fetchUserList(
            keyword: keyword,
            authority: authority,
            approveStatus: approveStatus
        )
    }
}
