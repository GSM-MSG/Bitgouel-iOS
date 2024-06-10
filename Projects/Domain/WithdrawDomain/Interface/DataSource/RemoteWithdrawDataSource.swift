public protocol RemoteWithdrawDataSource {
    func fetchWithdrawUserList(cohort: String) async throws -> [WithdrawUserInfoEntity]
}
