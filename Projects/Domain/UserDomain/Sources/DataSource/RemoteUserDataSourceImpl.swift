import BaseDomain
import Foundation
import UserDomainInterface

final class RemoteUserDataSourceImpl: BaseRemoteDataSource<UserAPI>, RemoteUserDataSource {
    func changePassword(req: ChangePasswordRequestDTO) async throws {
        try await request(.changePassword(req))
    }

    func fetchMyInfo() async throws -> MyInfoEntity {
        try await request(.fetchMyInfo, dto: FetchMyInfoResponseDTO.self).toDomain()
    }
}
