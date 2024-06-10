import InquiryDomainInterface

struct DeleteInquiryByAdminUseCaseImpl: DeleteInquiryByAdminUseCase {
    private let inquiryRepository: any InquiryRepository

    init(inquiryRepository: any InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    func callAsFunction(inquiryID: String) async throws {
        try await inquiryRepository.deleteInquiryByAdmin(inquiryID: inquiryID)
    }
}
