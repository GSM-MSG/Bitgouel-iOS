import BaseDomainInterface
import PostDomainInterface

struct FetchPostListUseCaseImpl: FetchPostListUseCase {
    private let postRepository: any PostRepository

    init(postRepository: any PostRepository) {
        self.postRepository = postRepository
    }

    func callAsFunction(postType: FeedType) async throws -> PostContentEntity {
        try await postRepository.fetchPostList(postType: postType)
    }
}
