import BaseDomain
import Foundation
import WithdrawDomainInterface

final class RemoteWithdrawDataSourceImpl: BaseRemoteDataSource<WithdrawAPI>, RemoteWithdrawDataSource {
    func fetchWithdrawUserList(cohort: String) async throws -> [WithdrawUserInfoEntity] {
        try await request(
            .fetchWithdrawUserList(cohort: cohort),
            dto: FetchWithdrawUserListResponseDTO.self
        )
        .toDomain()
    }
}
