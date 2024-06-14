import BaseDomainInterface
import Foundation

public struct OpenedLectureModel: Equatable {
    public let semester: SemesterType
    public let division: String
    public let department: String
    public let line: String
    public let instructorID: String
    public let startDate: Date
    public let endDate: Date
    public let lectureDates: [LectureDatesModel]
    public let lectureType: String
    public let credit: Int
    public let maxRegisteredUser: Int

    public init(
        semester: SemesterType,
        division: String,
        department: String,
        line: String,
        instructorID: String,
        startDate: Date,
        endDate: Date,
        lectureDates: [LectureDatesModel],
        lectureType: String,
        credit: Int,
        maxRegisteredUser: Int
    ) {
        self.semester = semester
        self.division = division
        self.department = department
        self.line = line
        self.instructorID = instructorID
        self.startDate = startDate
        self.endDate = endDate
        self.lectureDates = lectureDates
        self.lectureType = lectureType
        self.credit = credit
        self.maxRegisteredUser = maxRegisteredUser
    }
}
