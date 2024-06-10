import InquiryDomainInterface

struct FetchInquiryListByAdminUseCaseImpl: FetchInquiryListByAdminUseCase {
    private let inquiryRepository: InquiryRepository

    init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    func callAsFunction(answerStatus: String, keyword: String) async throws -> [InquiryInfoEntity] {
        try await inquiryRepository.fetchInquiryListByAdmin(answerStatus: answerStatus, keyword: keyword)
    }
}
