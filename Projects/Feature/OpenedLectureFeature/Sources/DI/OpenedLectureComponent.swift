import LectureDetailSettingFeatureInterface
import LectureDomainInterface
import NeedleFoundation
import OpenedLectureFeatureInterface
import SwiftUI

public protocol OpenedLectureDependency: Dependency {
    var lectureDomainFactory: any LectureDomainFactory { get }
    var lectureDetailSettingFactory: any LectureDetailSettingFactory { get }
}

public final class OpenedLectureComponent: Component<OpenedLectureDependency>, OpenedLectureFactory {
    public func makeView() -> some View {
        OpenedLectureView(
            viewModel: .init(
                openLectureUseCase: dependency.lectureDomainFactory.openLectureUseCase
            ),
            lectureDetailSettingFactory: dependency.lectureDetailSettingFactory
        )
    }
}
