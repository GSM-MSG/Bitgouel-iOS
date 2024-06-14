import InquiryDomainInterface

struct InputInquiryUseCaseImpl: InputInquiryUseCase {
    private let inquiryRepository: InquiryRepository

    init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    func callAsFunction(req: InputInquiryRequestDTO) async throws {
        try await inquiryRepository.inputInquiry(req: req)
    }
}
