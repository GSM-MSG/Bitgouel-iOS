import BaseDomain
import BaseDomainInterface
import PostDomainInterface

final class RemotePostDataSourceImpl: BaseRemoteDataSource<PostAPI>, RemotePostDataSource {
    func writePost(req: InputPostRequestDTO) async throws {
        try await request(.writePost(req: req))
    }

    func fetchPostList(postType: FeedType) async throws -> PostContentEntity {
        try await request(.fetchPostList(postType: postType), dto: PostListsResponseDTO.self).toDomain()
    }

    func fetchPostDetail(postID: String) async throws -> PostDetailEntity {
        try await request(.fetchPostDetail(postID: postID), dto: PostDetailResponseDTO.self).toDomain()
    }

    func updatePost(postID: String, req: UpdatePostRequestDTO) async throws {
        try await request(.updatePost(postID: postID, req: req))
    }

    func deletePost(postID: String) async throws {
        try await request(.deletePost(postID: postID))
    }
}
