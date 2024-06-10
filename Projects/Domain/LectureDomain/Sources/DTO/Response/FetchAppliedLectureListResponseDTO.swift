import Foundation
import LectureDomainInterface

struct FetchAppliedLectureListResponseDTO: Decodable {
    let lectures: [AppliedLectureInfoResponseDTO]
}

struct AppliedLectureInfoResponseDTO: Decodable {
    let lectureID: String
    let name: String
    let lectureType: String
    let currentCompletedDate: String
    let instructor: String
    let isComplete: Bool

    enum CodingKeys: String, CodingKey {
        case lectureID = "id"
        case name
        case lectureType
        case currentCompletedDate
        case instructor = "lecturer"
        case isComplete
    }
}

extension FetchAppliedLectureListResponseDTO {
    func toDomain() -> [AppliedLectureEntity] {
        lectures.map { $0.toDomain() }
    }
}

extension AppliedLectureInfoResponseDTO {
    func toDomain() -> AppliedLectureEntity {
        AppliedLectureEntity(
            lectureID: lectureID,
            name: name,
            lectureType: lectureType,
            currentCompletedDate: currentCompletedDate.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss"),
            instructor: instructor,
            isComplete: isComplete
        )
    }
}
