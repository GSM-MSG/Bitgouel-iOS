import BaseDomainInterface
import Foundation
import LectureDomainInterface

struct FetchLectureDetailResponseDTO: Decodable {
    let name: String
    let content: String
    let semester: SemesterType
    let division: String
    let department: String
    let line: String
    let createAt: String
    let startDate: String
    let endDate: String
    let lectureDates: [LectureDate]
    let lectureType: String
    let lectureStatus: LectureStatusType
    let headCount: Int
    let maxRegisteredUser: Int
    let isRegistered: Bool
    let instructor: String
    let credit: Int

    public struct LectureDate: Decodable {
        public let completeDate: String
        public let startTime: String
        public let endTime: String

        public init(
            completeDate: String,
            startTime: String,
            endTime: String
        ) {
            self.completeDate = completeDate
            self.startTime = startTime
            self.endTime = endTime
        }
    }

    enum CodingKeys: String, CodingKey {
        case name
        case content
        case semester
        case division
        case department
        case line
        case createAt
        case startDate
        case endDate
        case lectureDates
        case lectureType
        case lectureStatus
        case headCount
        case maxRegisteredUser
        case isRegistered
        case instructor = "lecturer"
        case credit
    }
}

extension FetchLectureDetailResponseDTO {
    func toDomain() -> LectureDetailEntity {
        LectureDetailEntity(
            name: name,
            content: content,
            semester: semester,
            division: division,
            department: department,
            line: line,
            createAt: createAt.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss"),
            startDate: startDate.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss"),
            endDate: endDate.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss"),
            lectureDates: lectureDates.map { $0.toDomain() },
            lectureType: lectureType,
            lectureStatus: lectureStatus,
            headCount: headCount,
            maxRegisteredUser: maxRegisteredUser,
            isRegistered: isRegistered,
            instructor: instructor,
            credit: credit
        )
    }
}

extension FetchLectureDetailResponseDTO.LectureDate {
    func toDomain() -> LectureDateEntity {
        LectureDateEntity(
            completeDate: completeDate.toDateCustomFormat(format: "yyyy-MM-dd"),
            startTime: startTime.toDateCustomFormat(format: "hh:mm:ss"),
            endTime: endTime.toDateCustomFormat(format: "hh:mm:ss")
        )
    }
}
