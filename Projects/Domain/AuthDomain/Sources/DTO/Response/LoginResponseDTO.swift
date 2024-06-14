import AuthDomainInterface
import BaseDomainInterface
import Foundation

struct LoginResponseDTO: Decodable {
    let authority: UserAuthorityType
}

extension LoginResponseDTO {
    func toDomain() -> UserLoginEntity {
        UserLoginEntity(authority: authority)
    }
}
