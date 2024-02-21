import Foundation

public protocol RemotePostDataSource: BaseRemoteDataSource<PostAPI> {
    func writePost(req: InputPostRequestDTO) async throws
    func queryPostList(postType: FeedType) async throws -> [PostEntity]
    func queryPostDetail(postID: String) async throws -> PostDetailEntity
    func updatePost(postID: String, req: InputPostRequestDTO) async throws
    func deletePost(postID: String) async throws
}
