import InquiryDomainInterface

struct FetchInquiryDetailUseCaseImpl: FetchInquiryDetailUseCase {
    private let inquiryRepository: InquiryRepository

    init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    func callAsFunction(inquiryID: String) async throws -> InquiryDetailEntity {
        try await inquiryRepository.fetchInquiryDetail(inquiryID: inquiryID)
    }
}
