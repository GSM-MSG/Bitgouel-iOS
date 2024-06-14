public protocol FetchFAQListUseCase {
    func callAsFunction() async throws -> [FAQInfoEntity]
}
