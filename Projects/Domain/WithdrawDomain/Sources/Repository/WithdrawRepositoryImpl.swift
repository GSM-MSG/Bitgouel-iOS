import WithdrawDomainInterface

struct WithdrawRepositoryImpl: WithdrawRepository {
    private let remoteWithdrawDataSource: RemoteWithdrawDataSource

    init(remoteWithdrawDataSource: RemoteWithdrawDataSource) {
        self.remoteWithdrawDataSource = remoteWithdrawDataSource
    }

    func fetchWithdrawUserList(cohort: String) async throws -> [WithdrawUserInfoEntity] {
        try await remoteWithdrawDataSource.fetchWithdrawUserList(cohort: cohort)
    }
}
