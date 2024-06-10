import BaseDomain
import FAQDomainInterface
import Foundation

final class RemoteFAQDataSourceImpl: BaseRemoteDataSource<FAQAPI>, RemoteFAQDataSource {
    func inputFAQ(req: InputFAQRequestDTO) async throws {
        try await request(.inputFAQ(req: req))
    }

    func fetchFAQList() async throws -> [FAQInfoEntity] {
        try await request(.fetchFAQList, dto: FetchFAQListResponseDTO.self).toDomain()
    }
}
