public protocol FetchMyInfoUseCase {
    func callAsFunction() async throws -> MyInfoEntity
}
