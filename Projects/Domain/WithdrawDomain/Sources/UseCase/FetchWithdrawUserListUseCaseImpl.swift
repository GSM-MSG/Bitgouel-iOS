import WithdrawDomainInterface

struct FetchWithdrawUserListUseCaseImpl: FetchWithdrawUserListUseCase {
    private let withdrawRepository: any WithdrawRepository

    init(withdrawRepository: any WithdrawRepository) {
        self.withdrawRepository = withdrawRepository
    }

    func callAsFunction(cohort: String) async throws -> [WithdrawUserInfoEntity] {
        try await withdrawRepository.fetchWithdrawUserList(cohort: cohort)
    }
}
