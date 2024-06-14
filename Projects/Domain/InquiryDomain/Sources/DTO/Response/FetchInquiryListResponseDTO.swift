import BaseDomainInterface
import Foundation
import InquiryDomainInterface

struct FetchInquiryListResponseDTO: Decodable {
    let inquiries: [InquiryInfoResponseDTO]
}

struct InquiryInfoResponseDTO: Decodable {
    let inquiryID: String
    let question: String
    let userID: String
    let username: String
    let answerStatus: AnswerStatusType
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case inquiryID = "id"
        case question
        case userID = "userId"
        case username
        case createdAt
        case answerStatus
    }
}

extension FetchInquiryListResponseDTO {
    func toDomain() -> [InquiryInfoEntity] {
        inquiries.map { $0.toDomain() }
    }
}

extension InquiryInfoResponseDTO {
    func toDomain() -> InquiryInfoEntity {
        InquiryInfoEntity(
            inquiryID: inquiryID,
            question: question,
            userID: userID,
            username: username,
            createdAt: createdAt,
            answerStatus: answerStatus
        )
    }
}
