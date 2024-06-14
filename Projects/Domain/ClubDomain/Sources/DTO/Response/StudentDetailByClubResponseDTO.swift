import ClubDomainInterface
import Foundation

struct StudentDetailByClubResponseDTO: Decodable {
    let name: String
    let phoneNumber: String
    let email: String
    let credit: Int
}

extension StudentDetailByClubResponseDTO {
    func toDomain() -> StudentDetailByClubEntity {
        StudentDetailByClubEntity(
            name: name,
            phoneNumber: phoneNumber,
            email: email,
            credit: credit
        )
    }
}
