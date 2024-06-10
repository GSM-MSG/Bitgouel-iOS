import AdminDomainInterface
import BaseDomain

final class RemoteAdminDataSourceImpl: BaseRemoteDataSource<AdminAPI>, RemoteAdminDataSource {
    func fetchUserList(
        keyword: String,
        authority: String,
        approveStatus: String
    ) async throws -> [UserInfoEntity] {
        try await request(
            .fetchUserList(keyword: keyword, authority: authority, approveStatus: approveStatus),
            dto: FetchUserInfoResponseDTO.self
        ).toDomain()
    }

    func fetchUserDetail(userID: String) async throws -> UserInfoEntity {
        try await request(
            .fetchUserDetail(userID: userID),
            dto: UserDetailInfoResponseDTO.self
        ).toDomain()
    }

    func approveUserSignup(userID: String) async throws {
        try await request(.approveUserSignup(userID: userID))
    }

    func rejectUserSignup(userID: String) async throws {
        try await request(.rejectUserSignup(userID: userID))
    }

    func withdrawUser(userID: String) async throws {
        try await request(.withdrawUser(userID: userID))
    }
}
