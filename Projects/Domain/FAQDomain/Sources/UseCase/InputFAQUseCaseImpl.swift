import FAQDomainInterface

struct InputFAQUseCaseImpl: InputFAQUseCase {
    private let faqRepository: FAQRepository

    init(faqRepository: FAQRepository) {
        self.faqRepository = faqRepository
    }

    func callAsFunction(req: InputFAQRequestDTO) async throws {
        try await faqRepository.inputFAQ(req: req)
    }
}
