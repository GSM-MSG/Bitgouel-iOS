import Service
import SwiftUI

struct SchoolListRowView: View {
    @ObservedObject var viewModel: StudentSignUpViewModel
    let school: HighSchoolType

    var body: some View {
        HStack {
            Text(school.display())

            Spacer()

            BitgouelRadioButton(
                isSelected: Binding(
                    get: { viewModel.selectedSchool == school.display() },
                    set: { highSchool in
                        if highSchool {
                            viewModel.selectedSchool = school.display()
                            viewModel.getClubsForSelectedHighSchool = school
                        }
                    }
                )
            )
        }
        .id(String(school.rawValue))
        .frame(height: 73)
        .padding(.horizontal, 28)
    }
}
