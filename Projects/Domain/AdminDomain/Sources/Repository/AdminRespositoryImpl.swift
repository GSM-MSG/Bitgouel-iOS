import AdminDomainInterface
import Foundation

struct AdminRespositoryImpl: AdminRepository {
    private let remoteAdminDataSource: RemoteAdminDataSource

    init(remoteAdminDataSource: RemoteAdminDataSource) {
        self.remoteAdminDataSource = remoteAdminDataSource
    }

    func fetchUserList(
        keyword: String,
        authority: String,
        approveStatus: String
    ) async throws -> [UserInfoEntity] {
        try await remoteAdminDataSource.fetchUserList(
            keyword: keyword,
            authority: authority,
            approveStatus: approveStatus
        )
    }

    func fetchUserDetail(userID: String) async throws -> UserInfoEntity {
        try await remoteAdminDataSource.fetchUserDetail(userID: userID)
    }

    func approveUserSignup(userID: String) async throws {
        try await remoteAdminDataSource.approveUserSignup(userID: userID)
    }

    func rejectUserSignup(userID: String) async throws {
        try await remoteAdminDataSource.rejectUserSignup(userID: userID)
    }

    func withdrawUser(userID: String) async throws {
        try await remoteAdminDataSource.withdrawUser(userID: userID)
    }
}
