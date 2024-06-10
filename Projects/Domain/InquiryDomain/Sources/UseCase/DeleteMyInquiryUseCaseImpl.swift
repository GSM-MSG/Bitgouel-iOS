import InquiryDomainInterface

struct DeleteMyInquiryUseCaseImpl: DeleteMyInquiryUseCase {
    private let inquiryRepository: InquiryRepository

    init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    func callAsFunction(inquiryID: String) async throws {
        try await inquiryRepository.deleteMyInquiry(inquiryID: inquiryID)
    }
}
