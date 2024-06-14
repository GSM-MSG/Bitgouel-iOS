import FAQDomainInterface
import Foundation

struct FetchFAQListResponseDTO: Decodable {
    let faqs: [FAQInfoResponseDTO]
}

struct FAQInfoResponseDTO: Decodable {
    let questionID: Int
    let question: String
    let answer: String

    enum CodingKeys: String, CodingKey {
        case questionID = "id"
        case question
        case answer
    }
}

extension FetchFAQListResponseDTO {
    func toDomain() -> [FAQInfoEntity] {
        faqs.map { $0.toDomain() }
    }
}

extension FAQInfoResponseDTO {
    func toDomain() -> FAQInfoEntity {
        FAQInfoEntity(
            questionID: questionID,
            question: question,
            answer: answer
        )
    }
}
