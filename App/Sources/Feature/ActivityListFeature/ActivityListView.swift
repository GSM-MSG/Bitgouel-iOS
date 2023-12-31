import Service
import SwiftUI

struct ActivityListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var model: ActivityListModel
    @StateObject var viewModel: ActivityListViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    LazyVStack(spacing: 12) {
                        ForEach(model.activityList, id: \.activityId) { item in
                            StudentActivityRow(
                                activityId: item.activityId,
                                title: item.title,
                                date: item.activityDate,
                                userId: item.userId,
                                name: item.userName,
                                state: item.approveStatus,
                                authority: model.authority
                            )
                        }
                    }
                    .padding(.top, 8)
                }
            }
            .bitgouelToast(
                text: model.errorMessage,
                isShowing: Binding(
                    get: { viewModel.isErrorOccurred },
                    set: { _ in viewModel.toastDismissed() }
                )
            )
            .padding(.horizontal, 28)
            .bitgouelBackButton(dismiss: dismiss)
            .navigationTitle("학생활동").navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if model.authority == .student {
                        Button(action: {}, label: {
                            Image(systemName: "plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.bitgouel(.greyscale(.g8)))
                        })
                    }
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
