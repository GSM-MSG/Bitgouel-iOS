import BaseDomainInterface
import Foundation
import InquiryDomainInterface

struct FetchInquiryDetailResponseDTO: Decodable {
    let inquiryID: String
    let question: String
    let questionDetail: String
    let questioner: String
    let questionDate: String
    let answerStatus: AnswerStatusType
    let answer: String?
    let adminID: String?
    let answeredDate: String?

    enum CodingKeys: String, CodingKey {
        case inquiryID = "id"
        case question
        case questionDetail
        case questioner
        case questionDate
        case answerStatus
        case answer
        case adminID = "adminId"
        case answeredDate
    }
}

extension FetchInquiryDetailResponseDTO {
    func toDomain() -> InquiryDetailEntity {
        InquiryDetailEntity(
            inquiryID: inquiryID,
            question: question,
            questionDetail: questionDetail,
            questioner: questioner,
            questionDate: questionDate.toDateCustomFormat(format: "yyyy.M.dd"),
            answerStatus: answerStatus,
            answer: answer,
            adminID: adminID,
            answeredDate: answeredDate?.toDateCustomFormat(format: "yyyy.M.dd")
        )
    }
}
