public protocol FetchActivityListUseCase {
    func callAsFunction() async throws -> ActivityContentEntity
}
