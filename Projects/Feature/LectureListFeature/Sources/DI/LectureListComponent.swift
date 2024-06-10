import AuthDomainInterface
import BaseFeature
import LectureDetailFeatureInterface
import LectureDomainInterface
import LectureListFeatureInterface
import NeedleFoundation
import OpenedLectureFeatureInterface
import SwiftUI

public protocol LectureListDependency: Dependency {
    var lectureDetailFactory: any LectureDetailFactory { get }
    var openedLectureFactory: any OpenedLectureFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
    var lectureDomainFactory: any LectureDomainFactory { get }
}

public final class LectureListComponent: Component<LectureListDependency>, LectureListFactory {
    @MainActor
    public func makeView(selection: Binding<TabFlow>) -> some View {
        return LectureListView(
            lectureDetailFactory: dependency.lectureDetailFactory,
            openedLectureFactory: dependency.openedLectureFactory,
            viewModel: .init(
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase,
                fetchLectureListUseCase: dependency.lectureDomainFactory.fetchLectureListUseCase
            ),
            selection: selection
        )
    }
}
