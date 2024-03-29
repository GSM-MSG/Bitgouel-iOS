import NeedleFoundation
import Service
import SwiftUI

public protocol LectureListDependency: Dependency {
    var lectureListDetailFactory: any LectureListDetailFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var fetchLectureListUseCase: any FetchLectureListUseCase { get }
}

public final class LectureListComponent: Component<LectureListDependency>, LectureListFactory {
    @MainActor
    public func makeView() -> some View {
        return LectureListView(
            lectureListDetailFactory: dependency.lectureListDetailFactory,
            viewModel: .init(
                loadUserAuthorityUseCase: self.dependency.loadUserAuthorityUseCase,
                lectureListDetailFactory: self.dependency.lectureListDetailFactory,
                fetchLectureListUseCase: self.dependency.fetchLectureListUseCase
            )
        )
    }
}
