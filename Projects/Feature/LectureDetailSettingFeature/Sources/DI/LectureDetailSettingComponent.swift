import LectureDetailSettingFeatureInterface
import LectureDomainInterface
import NeedleFoundation
import OpenedLectureFeatureInterface
import SwiftUI

public protocol LectureDetailSettingDependency: Dependency {
    var openedLectureFactory: any OpenedLectureFactory { get }
    var lectureDomainFactory: any LectureDomainFactory { get }
}

public final class LectureDetailSettingComponent: Component<LectureDetailSettingDependency>,
    LectureDetailSettingFactory {
    public func makeView(
        detailInfo: OpenedLectureModel,
        completion: @escaping (OpenedLectureModel) -> Void
    ) -> some View {
        LectureDetailSettingView(
            viewModel: .init(
                detailInfo: detailInfo,
                completion: completion,
                fetchInstructorListUseCase: dependency.lectureDomainFactory.fetchInstructorListUseCase,
                fetchLineListUseCase: dependency.lectureDomainFactory.fetchLineListUseCase,
                fetchDepartmentListUseCase: dependency.lectureDomainFactory.fetchDepartmentListUseCase,
                fetchDivisionListUseCase: dependency.lectureDomainFactory.fetchDivisionListUseCase
            ),
            openedLectureFactory: dependency.openedLectureFactory
        )
    }
}
