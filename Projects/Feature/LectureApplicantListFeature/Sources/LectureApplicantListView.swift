import DesignSystem
import SwiftUI

struct LectureApplicantListView: View {
    @StateObject var viewModel: LectureApplicantListViewModel

    init(viewModel: LectureApplicantListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("강의 이수 여부")
                .bitgouelFont(.text3, color: .greyscale(.g4))
                .padding(.top, 8)

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.applicantList, id: \.studentID) { student in
                        LectureApplicantListRow(
                            studentID: student.studentID,
                            isComplete: student.isComplete,
                            email: student.email,
                            name: student.name,
                            grade: student.grade,
                            classNumber: student.classNumber,
                            number: student.number,
                            cohort: student.cohort,
                            phoneNumber: student.phoneNumber,
                            schoolName: student.school.display(),
                            clubName: student.clubName
                        ) { isSelected, studentID in
                            viewModel.updateApplicantInfo(isSelected: isSelected, studentID: studentID)
                            viewModel.modifyApplicantWhether()
                        }

                        Divider()
                    }
                }
            }
            .padding(.top, 24)

            Spacer()
        }
        .padding(.horizontal, 28)
        .onAppear {
            viewModel.onAppear()
        }
        .refreshable {
            viewModel.onAppear()
        }
        .navigationTitle("강의 신청자 명단")
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
    }
}
