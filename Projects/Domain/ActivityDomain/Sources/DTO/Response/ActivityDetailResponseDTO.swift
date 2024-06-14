import ActivityDomainInterface
import DateUtil
import Foundation

struct ActivityDetailResponseDTO: Decodable {
    let activityID: String
    let title: String
    let content: String
    let credit: Int
    let activityDate: String
    let modifiedAt: String

    enum CodingKeys: String, CodingKey {
        case activityID = "id"
        case title
        case content
        case credit
        case activityDate
        case modifiedAt
    }
}

extension ActivityDetailResponseDTO {
    func toDomain() -> ActivityDetailEntity {
        ActivityDetailEntity(
            activityID: activityID,
            title: title,
            content: content,
            credit: credit,
            activityDate: activityDate.toDateCustomFormat(format: "yyyy-MM-dd"),
            modifiedAt: modifiedAt.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss.SSS")
        )
    }
}
