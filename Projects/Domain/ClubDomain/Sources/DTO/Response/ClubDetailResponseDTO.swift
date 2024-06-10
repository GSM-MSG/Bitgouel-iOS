import ClubDomainInterface
import Foundation

struct ClubDetailResponseDTO: Decodable {
    let clubID: Int
    let clubName: String
    let highSchoolName: String
    let students: [MemberInfoResponseDTO]
    let teacher: TeacherInfoResponseDTO

    enum CodingKeys: String, CodingKey {
        case clubID = "clubId"
        case clubName
        case highSchoolName
        case students
        case teacher
    }
}

extension ClubDetailResponseDTO {
    func toDomain() -> ClubDetailEntity {
        ClubDetailEntity(
            clubID: clubID,
            clubName: clubName,
            highSchoolName: highSchoolName,
            students: students.map { $0.toDomain() },
            teacher: teacher.toDomain()
        )
    }
}

struct MemberInfoResponseDTO: Decodable {
    let userID: String
    let studentID: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case studentID = "id"
        case name
    }
}

struct TeacherInfoResponseDTO: Decodable {
    let teacherID: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case teacherID = "id"
        case name
    }
}

extension MemberInfoResponseDTO {
    func toDomain() -> ClubDetailEntity.MemberInfoEntity {
        ClubDetailEntity.MemberInfoEntity(
            userID: userID,
            studentID: studentID,
            name: name
        )
    }
}

extension TeacherInfoResponseDTO {
    func toDomain() -> ClubDetailEntity.TeacherInfoEntity {
        ClubDetailEntity.TeacherInfoEntity(
            teacherID: teacherID,
            name: name
        )
    }
}
