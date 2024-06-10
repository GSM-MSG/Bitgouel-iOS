import ClubDomainInterface
import Foundation

struct ClubListResponseDTO: Decodable {
    let clubs: [Club]
}

extension ClubListResponseDTO {
    struct Club: Decodable {
        public let id: Int
        public let name: String
    }
}

extension ClubListResponseDTO.Club {
    func toDomain() -> ClubEntity {
        ClubEntity(
            id: id,
            name: name
        )
    }
}

extension ClubListResponseDTO {
    func toDomain() -> [ClubEntity] {
        clubs.map { $0.toDomain() }
    }
}
