import Foundation
import WithdrawDomainInterface

struct FetchWithdrawUserListResponseDTO: Decodable {
    let students: [WithdrawUserInfoResponseDTO]
}

struct WithdrawUserInfoResponseDTO: Decodable {
    let withdrawID: Int
    let userID: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case withdrawID = "withdrawId"
        case userID = "userId"
        case name = "studentName"
    }
}

extension FetchWithdrawUserListResponseDTO {
    func toDomain() -> [WithdrawUserInfoEntity] {
        students.map { $0.toDomain() }
    }
}

extension WithdrawUserInfoResponseDTO {
    func toDomain() -> WithdrawUserInfoEntity {
        WithdrawUserInfoEntity(
            withdrawID: withdrawID,
            userID: userID,
            name: name
        )
    }
}
