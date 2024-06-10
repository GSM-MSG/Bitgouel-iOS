import UserDomainInterface

struct UserRepositoryImpl: UserRepository {
    private let remoteUserDataSource: RemoteUserDataSource

    init(remoteUserDataSource: RemoteUserDataSource) {
        self.remoteUserDataSource = remoteUserDataSource
    }

    func changePassword(req: ChangePasswordRequestDTO) async throws {
        try await remoteUserDataSource.changePassword(req: req)
    }

    func fetchMyInfo() async throws -> MyInfoEntity {
        try await remoteUserDataSource.fetchMyInfo()
    }
}
