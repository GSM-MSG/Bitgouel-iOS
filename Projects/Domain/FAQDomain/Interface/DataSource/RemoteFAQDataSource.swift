public protocol RemoteFAQDataSource {
    func inputFAQ(req: InputFAQRequestDTO) async throws
    func fetchFAQList() async throws -> [FAQInfoEntity]
}
