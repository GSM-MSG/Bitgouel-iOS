import BaseDomainInterface
import Foundation
import PostDomainInterface

struct PostDetailResponseDTO: Decodable {
    let title: String
    let writtenBy: Bool
    let content: String
    let feedType: FeedType
    let modifiedAt: String
    let links: [String]
}

extension PostDetailResponseDTO {
    func toDomain() -> PostDetailEntity {
        PostDetailEntity(
            title: title,
            writtenBy: writtenBy,
            content: content,
            feedType: feedType,
            modifiedAt: modifiedAt,
            links: links
        )
    }
}
