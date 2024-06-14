import Foundation
import PostDomainInterface

struct PostListsResponseDTO: Decodable {
    let posts: PostContent

    struct PostContent: Decodable {
        public let content: [PostInfo]
    }
}

struct PostInfo: Decodable {
    let postID: String
    let title: String
    let modifiedAt: String

    enum CodingKeys: String, CodingKey {
        case postID = "id"
        case title
        case modifiedAt
    }
}

extension PostListsResponseDTO {
    func toDomain() -> PostContentEntity {
        PostContentEntity(content: posts.toDomain())
    }
}

extension PostListsResponseDTO.PostContent {
    func toDomain() -> [PostEntity] {
        content.map { $0.toDomain() }
    }
}

extension PostInfo {
    func toDomain() -> PostEntity {
        PostEntity(
            postID: postID,
            title: title,
            modifiedAt: modifiedAt
        )
    }
}
