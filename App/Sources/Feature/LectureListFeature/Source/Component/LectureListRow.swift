import SwiftUI
import Service

struct LectureListRow: View {
    let name: String
    let content: String
    let startDate: String
    let endDate: String
    let semester: SemesterType
    let lectureType: LectureType
    let lectureStatus: LectureStatusType
    let headCount: Int
    let maxRegisteredUser: Int
    let lecturer: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(lecturer)
                .bitgouelFont(.text3, color: .greyscale(.g0))

            Text(name)
                .bitgouelFont(.text1, color: .greyscale(.g0))

            Text(content)
            .bitgouelFont(.text3, color: .greyscale(.g4))
            .lineLimit(2)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 8) {
                    Text("\(startDate) ~ \(endDate)")
                    
                    Text("•")
                    
                    Text("\(semester.display())")
                }
                .bitgouelFont(.caption, color: .greyscale(.g4))
                
                BitgouelText(
                    text: "\(headCount)/\(maxRegisteredUser)명",
                    font: .caption
                )
                .foregroundColor(.bitgouel(.greyscale(.g7)))
            }
            
            HStack(spacing: 8) {
                Text(lectureType.display())
                    .bitgouelFont(.caption, color: .greyscale(.g4))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Color.bitgouel(.greyscale(.g9))
                    )
                    .cornerRadius(18)
            }
        }
        .padding(.vertical, 20)
    }
}
