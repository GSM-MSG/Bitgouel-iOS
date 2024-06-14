import BaseDomainInterface
import Foundation
import LectureDomainInterface

struct FetchInstructorListResponseDTO: Decodable {
    let instructors: [InstructorInfoResponseDTO]
}

struct InstructorInfoResponseDTO: Decodable {
    let instructorID: String
    let name: String
    let organization: String
    let authority: UserAuthorityType

    enum CodingKeys: String, CodingKey {
        case instructorID = "id"
        case name
        case organization
        case authority
    }
}

extension FetchInstructorListResponseDTO {
    func toDomain() -> [InstructorInfoEntity] {
        instructors.map { $0.toDomain() }
    }
}

extension InstructorInfoResponseDTO {
    func toDomain() -> InstructorInfoEntity {
        InstructorInfoEntity(
            instructorID: instructorID,
            name: name,
            organization: organization,
            authority: authority
        )
    }
}
