import BaseDomainInterface
import Foundation
import UserDomainInterface

struct FetchMyInfoResponseDTO: Decodable {
    let userID: String
    let name: String
    let email: String
    let phoneNumber: String
    let authority: UserAuthorityType
    let organization: String

    enum CodingKeys: String, CodingKey {
        case userID = "id"
        case name
        case email
        case phoneNumber
        case authority
        case organization
    }
}

extension FetchMyInfoResponseDTO {
    func toDomain() -> MyInfoEntity {
        MyInfoEntity(
            userID: userID,
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            authority: authority,
            organization: organization
        )
    }
}
