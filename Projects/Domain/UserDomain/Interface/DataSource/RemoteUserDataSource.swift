public protocol RemoteUserDataSource {
    func changePassword(req: ChangePasswordRequestDTO) async throws
    func fetchMyInfo() async throws -> MyInfoEntity
}
