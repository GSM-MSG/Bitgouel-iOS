public protocol PostDomainFactory {
    var writePostUseCase: any WritePostUseCase { get }
    var fetchPostListUseCase: any FetchPostListUseCase { get }
    var fetchPostDetailUseCase: any FetchPostDetailUseCase { get }
    var updatePostUseCase: any UpdatePostUseCase { get }
    var deletePostUseCase: any DeletePostUseCase { get }
    var postRepository: any PostRepository { get }
}
