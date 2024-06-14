import AdminDomainInterface
import BaseDomainInterface
import Foundation

struct UserDetailInfoResponseDTO: Decodable {
    let userID: String
    let name: String
    let authority: UserAuthorityType
    let approveStatus: ApproveStatusType

    enum CodingKeys: String, CodingKey {
        case userID = "id"
        case name
        case authority
        case approveStatus
    }
}

extension UserDetailInfoResponseDTO {
    func toDomain() -> UserInfoEntity {
        UserInfoEntity(
            userID: userID,
            name: name,
            authority: authority,
            approveStatus: approveStatus
        )
    }
}
