public protocol RemoteAdminDataSource {
    func fetchUserList(keyword: String, authority: String, approveStatus: String) async throws -> [UserInfoEntity]
    func fetchUserDetail(userID: String) async throws -> UserInfoEntity
    func approveUserSignup(userID: String) async throws
    func rejectUserSignup(userID: String) async throws
    func withdrawUser(userID: String) async throws
}
