import InquiryDomainInterface

struct FetchMyInquiryListUseCaseImpl: FetchMyInquiryListUseCase {
    private let inquiryRepository: InquiryRepository

    init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    func callAsFunction() async throws -> [InquiryInfoEntity] {
        try await inquiryRepository.fetchMyInquiryList()
    }
}
