import ActivityListFeatureInterface
import AuthDomainInterface
import CertificationDomainInterface
import ClubDomainInterface
import InputCertificationFeatureInterface
import LectureDomainInterface
import NeedleFoundation
import StudentInfoFeatureInterface
import SwiftUI

public protocol StudentInfoDependency: Dependency {
    var activityListFactory: any ActivityListFactory { get }
    var inputCertificationFactory: any InputCertificationFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
    var clubDomainFactory: any ClubDomainFactory { get }
    var certificationDomainFactory: any CertificationDomainFactory { get }
    var lectureDomainFactory: any LectureDomainFactory { get }
}

public final class StudentInfoComponent: Component<StudentInfoDependency>, StudentInfoFactory {
    @MainActor
    public func makeView(
        clubID: Int,
        studentID: String
    ) -> some View {
        StudentInfoView(
            viewModel: .init(
                clubID: clubID,
                studentID: studentID,
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase,
                fetchStudentDetailByClubUseCase: dependency.clubDomainFactory.fetchStudentDetailByClubUseCase,
                fetchCertificationListByStudent: dependency.certificationDomainFactory
                    .fetchCertificationListByStudentUseCase,
                fetchCertificationListByTeacher: dependency.certificationDomainFactory
                    .fetchCertificationListByTeacherUseCase,
                fetchAppliedLectureListUseCase: dependency.lectureDomainFactory.fetchAppliedLectureListUseCase
            ),
            activityListFactory: dependency.activityListFactory,
            inputCertificationFactory: dependency.inputCertificationFactory
        )
    }
}
