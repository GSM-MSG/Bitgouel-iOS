import LectureApplicantListFeatureInterface
import LectureDomainInterface
import NeedleFoundation
import SwiftUI

public protocol LectureApplicantListDependency: Dependency {
    var lectureDomainFactory: any LectureDomainFactory { get }
}

public final class LectureApplicantListComponent: Component<LectureApplicantListDependency>,
    LectureApplicantListFactory {
    public func makeView(lectureID: String) -> some View {
        LectureApplicantListView(
            viewModel: LectureApplicantListViewModel(
                lectureID: lectureID,
                fetchApplicantListUseCase: dependency.lectureDomainFactory.fetchApplicantListUseCase,
                modifyApplicantWhetherUseCase: dependency.lectureDomainFactory.modifyApplicantWhetherUseCase
            )
        )
    }
}
