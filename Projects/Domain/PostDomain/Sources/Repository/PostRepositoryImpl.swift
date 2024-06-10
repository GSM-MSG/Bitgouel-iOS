import BaseDomainInterface
import PostDomainInterface

struct PostRepositoryImpl: PostRepository {
    private let remotePostDataSource: RemotePostDataSource

    init(remotePostDataSource: RemotePostDataSource) {
        self.remotePostDataSource = remotePostDataSource
    }

    func writePost(req: InputPostRequestDTO) async throws {
        try await remotePostDataSource.writePost(req: req)
    }

    func fetchPostList(postType: FeedType) async throws -> PostContentEntity {
        try await remotePostDataSource.fetchPostList(postType: postType)
    }

    func fetchPostDetail(postID: String) async throws -> PostDetailEntity {
        try await remotePostDataSource.fetchPostDetail(postID: postID)
    }

    func updatePost(postID: String, req: UpdatePostRequestDTO) async throws {
        try await remotePostDataSource.updatePost(postID: postID, req: req)
    }

    func deletePost(postID: String) async throws {
        try await remotePostDataSource.deletePost(postID: postID)
    }
}
