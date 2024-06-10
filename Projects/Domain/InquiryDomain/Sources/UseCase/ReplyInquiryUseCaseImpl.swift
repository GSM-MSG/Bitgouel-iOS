import InquiryDomainInterface

struct ReplyInquiryUseCaseImpl: ReplyInquiryUseCase {
    private let inquiryRepository: InquiryRepository

    init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    func callAsFunction(inquiryID: String, req: InquiryAnswerRequestDTO) async throws {
        try await inquiryRepository.replyInquiry(inquiryID: inquiryID, req: req)
    }
}
