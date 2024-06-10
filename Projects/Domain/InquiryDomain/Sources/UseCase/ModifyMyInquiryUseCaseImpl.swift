import InquiryDomainInterface

struct ModifyMyInquiryUseCaseImpl: ModifyMyInquiryUseCase {
    private let inquiryRepository: InquiryRepository

    init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    func callAsFunction(inquiryID: String, req: InputInquiryRequestDTO) async throws {
        try await inquiryRepository.modifyMyInquiry(inquiryID: inquiryID, req: req)
    }
}
