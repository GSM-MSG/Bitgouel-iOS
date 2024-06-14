import BaseDomainInterface
import Foundation
import LectureDomainInterface

struct FetchLectureListResponseDTO: Decodable {
    let lectures: LectureContent

    struct LectureContent: Decodable {
        let content: [LectureInfoResponseDTO]
    }
}

struct LectureInfoResponseDTO: Decodable {
    var lectureID: String
    let name: String
    let content: String
    let semester: SemesterType
    let division: String
    let department: String
    let line: String
    let startDate: String
    let endDate: String
    let lectureType: String
    let lectureStatus: LectureStatusType
    let headCount: Int
    let maxRegisteredUser: Int
    let instructor: String

    enum CodingKeys: String, CodingKey {
        case lectureID = "id"
        case name
        case content
        case semester
        case division
        case department
        case line
        case startDate
        case endDate
        case lectureType
        case lectureStatus
        case headCount
        case maxRegisteredUser
        case instructor = "lecturer"
    }
}

extension FetchLectureListResponseDTO {
    func toDomain() -> LectureContentEntity {
        LectureContentEntity(content: lectures.toDomain())
    }
}

extension FetchLectureListResponseDTO.LectureContent {
    func toDomain() -> [LectureListEntity] {
        content.map { $0.toDomain() }
    }
}

extension LectureInfoResponseDTO {
    func toDomain() -> LectureListEntity {
        LectureListEntity(
            lectureID: lectureID,
            name: name,
            content: content,
            semester: semester,
            division: division,
            department: department,
            line: line,
            startDate: startDate.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss"),
            endDate: endDate.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss"),
            lectureType: lectureType,
            lectureStatus: lectureStatus,
            headCount: headCount,
            maxRegisteredUser: maxRegisteredUser,
            instructor: instructor
        )
    }
}
