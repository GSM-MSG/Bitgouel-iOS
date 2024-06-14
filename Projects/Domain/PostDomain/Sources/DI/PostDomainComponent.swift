import KeychainInterface
import NeedleFoundation
import PostDomainInterface

public protocol PostDomainDependency: Dependency {
    var keychainFactory: any KeyChainFactory { get }
}

public final class PostDomainComponent: Component<PostDomainDependency>, PostDomainFactory {
    public var writePostUseCase: any WritePostUseCase {
        WritePostUseCaseImpl(postRepository: postRepository)
    }

    public var fetchPostListUseCase: any FetchPostListUseCase {
        FetchPostListUseCaseImpl(postRepository: postRepository)
    }

    public var fetchPostDetailUseCase: any FetchPostDetailUseCase {
        FetchPostDetailUseCaseImpl(postRepository: postRepository)
    }

    public var updatePostUseCase: any UpdatePostUseCase {
        UpdatePostUseCaseImpl(postRepository: postRepository)
    }

    public var deletePostUseCase: any DeletePostUseCase {
        DeletePostUseCaseImpl(postRepository: postRepository)
    }

    public var postRepository: any PostRepository {
        PostRepositoryImpl(remotePostDataSource: remotePostDataSource)
    }

    var remotePostDataSource: any RemotePostDataSource {
        RemotePostDataSourceImpl(keychain: dependency.keychainFactory.keychain)
    }
}
