import FAQDomainInterface

struct FetchFAQListUseCaseImpl: FetchFAQListUseCase {
    private let faqRepository: FAQRepository

    init(faqRepository: FAQRepository) {
        self.faqRepository = faqRepository
    }

    func callAsFunction() async throws -> [FAQInfoEntity] {
        try await faqRepository.fetchFAQList()
    }
}
