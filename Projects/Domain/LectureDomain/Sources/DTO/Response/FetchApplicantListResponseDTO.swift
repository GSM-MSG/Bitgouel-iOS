import BaseDomainInterface
import Foundation
import LectureDomainInterface

struct FetchApplicantListResponseDTO: Decodable {
    let students: [ApplicantInfoResponseDTO]
}

struct ApplicantInfoResponseDTO: Decodable {
    let studentID: String
    let email: String
    let name: String
    let grade: Int
    let classNumber: Int
    let number: Int
    let phoneNumber: String
    let school: HighSchoolType
    let clubName: String
    let cohort: Int
    let isComplete: Bool

    enum CodingKeys: String, CodingKey {
        case studentID = "id"
        case email
        case name
        case grade
        case classNumber
        case number
        case phoneNumber
        case school
        case clubName
        case cohort
        case isComplete
    }
}

extension FetchApplicantListResponseDTO {
    func toDomain() -> [ApplicantInfoEntity] {
        students.map { $0.toDomain() }
    }
}

extension ApplicantInfoResponseDTO {
    func toDomain() -> ApplicantInfoEntity {
        ApplicantInfoEntity(
            studentID: studentID,
            email: email,
            name: name,
            grade: grade,
            classNumber: classNumber,
            number: number,
            phoneNumber: phoneNumber,
            school: school,
            clubName: clubName,
            cohort: cohort,
            isComplete: isComplete
        )
    }
}
