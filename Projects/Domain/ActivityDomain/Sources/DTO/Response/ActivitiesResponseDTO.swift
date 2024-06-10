import ActivityDomainInterface
import Foundation

struct ActivitiesResponseDTO: Decodable {
    let activities: Content

    struct Content: Decodable {
        let content: [ActivityInfoResponseDTO]
    }
}

struct ActivityInfoResponseDTO: Decodable {
    let activityID: String
    let title: String
    let activityDate: String
    let userID: String
    let username: String

    enum CodingKeys: String, CodingKey {
        case activityID = "activityId"
        case title
        case activityDate
        case userID = "userId"
        case username
    }
}

extension ActivitiesResponseDTO {
    func toDomain() -> ActivityContentEntity {
        ActivityContentEntity(
            content: activities.toDomain()
        )
    }
}

extension ActivitiesResponseDTO.Content {
    func toDomain() -> [ActivityEntity] {
        content.map { $0.toDomain() }
    }
}

extension ActivityInfoResponseDTO {
    func toDomain() -> ActivityEntity {
        ActivityEntity(
            activityID: activityID,
            title: title,
            activityDate: activityDate,
            userID: userID,
            userName: username
        )
    }
}
