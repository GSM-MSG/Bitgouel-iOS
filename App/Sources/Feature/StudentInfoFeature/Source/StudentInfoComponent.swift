import NeedleFoundation
import Service
import SwiftUI

public protocol StudentInfoDependency: Dependency {
    var activityListFactory: any ActivityListFactory { get }
    var inputCertificationFactory: any InputCertificationFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryStudentDetailByClubUseCase: any QueryStudentDetailByClubUseCase { get }
    var queryCertificationListByStudentUseCase: any QueryCertificationListByStudentUseCase { get }
    var queryCertificationListByTeacherUseCase: any QueryCertificationListByTeacherUseCase { get }
    var fetchAppliedLectureListUseCase: any FetchAppliedLectureListUseCase { get }
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
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                queryStudentDetailByClubUseCase: dependency.queryStudentDetailByClubUseCase,
                queryCertificationListByStudent: dependency.queryCertificationListByStudentUseCase,
                queryCertificationListByTeacher: dependency.queryCertificationListByTeacherUseCase,
                fetchAppliedLectureListUseCase: dependency.fetchAppliedLectureListUseCase
            ),
            activityListFactory: dependency.activityListFactory,
            inputCertificationFactory: dependency.inputCertificationFactory
        )
    }
}