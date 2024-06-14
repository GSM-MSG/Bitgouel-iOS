import BaseDomain
import Foundation
import InquiryDomainInterface

final class RemoteInquiryDataSourceImpl: BaseRemoteDataSource<InquiryAPI>, RemoteInquiryDataSource {
    func inputInquiry(req: InputInquiryRequestDTO) async throws {
        try await request(.inputInquiry(req: req))
    }

    func fetchMyInquiryList() async throws -> [InquiryInfoEntity] {
        try await request(.fetchMyInquiryList, dto: FetchInquiryListResponseDTO.self).toDomain()
    }

    func fetchInquiryDetail(inquiryID: String) async throws -> InquiryDetailEntity {
        try await request(.fetchInquiryDetail(inquiryID: inquiryID), dto: FetchInquiryDetailResponseDTO.self).toDomain()
    }

    func deleteMyInquiry(inquiryID: String) async throws {
        try await request(.deleteMyInquiry(inquiryID: inquiryID))
    }

    func modifyMyInquiry(inquiryID: String, req: InputInquiryRequestDTO) async throws {
        try await request(.modifyMyInquiry(inquiryID: inquiryID, req: req))
    }

    func replyInquiry(inquiryID: String, req: InquiryAnswerRequestDTO) async throws {
        try await request(.replyInquiry(inquiryID: inquiryID, req: req))
    }

    func fetchInquiryListByAdmin(
        answerStatus: String,
        keyword: String
    ) async throws -> [InquiryInfoEntity] {
        try await request(
            .fetchInquiryListByAdmin(answerStatus: answerStatus, keyword: keyword),
            dto: FetchInquiryListResponseDTO.self
        ).toDomain()
    }

    func deleteInquiryByAdmin(inquiryID: String) async throws {
        try await request(.deleteInquiryByAdmin(inquiryID: inquiryID))
    }
}
