import AuthDomainInterface
import LectureApplicantListFeatureInterface
import LectureDetailFeatureInterface
import LectureDomainInterface
import NeedleFoundation
import SwiftUI

public protocol LectureDetailDependency: Dependency {
    var lectureApplicantListFactory: any LectureApplicantListFactory { get }
    var lectureDomainFactory: any LectureDomainFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
}

public final class LectureDetailComponent: Component<LectureDetailDependency>, LectureDetailFactory {
    @MainActor
    public func makeView(lectureID: String) -> some View {
        LectureDetailView(
            viewModel: .init(
                lectureID: lectureID,
                fetchLectureDetailUseCase: dependency.lectureDomainFactory.fetchLectureDetailUseCase,
                applyLectureUseCase: dependency.lectureDomainFactory.applyLectureUseCase,
                cancelLectureUseCase: dependency.lectureDomainFactory.cancelLectureUseCase,
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase
            ),
            lectureApplicantListFactory: dependency.lectureApplicantListFactory
        )
    }
}
