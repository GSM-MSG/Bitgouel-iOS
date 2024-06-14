import FAQDomainInterface

struct FAQRepositoryImpl: FAQRepository {
    private let remoteFAQDataSource: RemoteFAQDataSource

    init(remoteFAQDataSource: RemoteFAQDataSource) {
        self.remoteFAQDataSource = remoteFAQDataSource
    }

    func inputFAQ(req: InputFAQRequestDTO) async throws {
        try await remoteFAQDataSource.inputFAQ(req: req)
    }

    func fetchFAQList() async throws -> [FAQInfoEntity] {
        try await remoteFAQDataSource.fetchFAQList()
    }
}
