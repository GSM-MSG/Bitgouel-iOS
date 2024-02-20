import SwiftUI
import Service

struct LectureListView: View {
    @StateObject var model: LectureListModel
    @StateObject var viewModel: LectureListViewModel
    @State var isShowingFilter = false

    private let lectureListDetailFactory: any LectureListDetailFactory

    init(
        lectureListDetailFactory: any LectureListDetailFactory,
        model: LectureListModel,
        viewModel: LectureListViewModel
    ) {
        self.lectureListDetailFactory = lectureListDetailFactory
        _model = StateObject(wrappedValue: model)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(model.lectureList, id: \.id) { item in
                            LectureListRow(
                                name: item.name,
                                content: item.content,
                                startDate: item.startDate,
                                endDate: item.endDate,
                                completeDate: item.completeDate,
                                lectureType: item.lectureType,
                                lectureStatus: item.lectureStatus,
                                approveStatus: item.approveStatus,
                                headCount: item.headCount,
                                maxRegisteredUser: item.maxRegisteredUser,
                                lecturer: item.lecturer,
                                authority: model.authority
                            )
                            .buttonWrapper {
                                withAnimation {
                                    viewModel.lectureDidSelect(userID: item.id)
                                    model.isPresentedLectureDetailPage = true
                                }
                            }

                            Divider()
                        }
                        .padding(.horizontal, 28)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("강의 목록")
                                .bitgouelFont(.title2)
                                .padding(.leading, 15)
                        }
                    }
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            BitgouelAsset.Icons.filterStroke.swiftUIImage

                            Text("필터")
                                .bitgouelFont(.text3, color: .greyscale(.g7))
                                .onTapGesture {
                                    isShowingFilter.toggle()
                                }
                        }
                    }
                }
            }
            .navigate(
                to: lectureListDetailFactory.makeView(userID: model.selectedUserID ?? "").eraseToAnyView(),
                when: Binding(
                    get: { model.isPresentedLectureDetailPage },
                    set: { _ in viewModel.lectureDetailPageDismissed() }
                )
            )
        }
        .bitgouelBottomSheet(isShowing: $isShowingFilter) {
            filterView()
        }
        .onAppear{
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    func filterView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("필터")
                    .bitgouelFont(.title3, color: .greyscale(.g0))
                    .padding(.top, 8)

                Group {
                    Text("강의 유형")
                        .bitgouelFont(.text1, color: .greyscale(.g0))

                    lectureTypeList()
                        .padding(.top, 3)
                }

                if model.authority == .admin {
                    Group {
                        Text("강의 상태")
                            .bitgouelFont(.text1, color: .greyscale(.g0))
                            .padding(.top, 11)

                        approveStatusTypeList()
                            .padding(.top, 3)
                    }
                }

                BitgouelButton(
                    text: "적용하기"
                )
                .cornerRadius(8)
                .padding(.top, 8)
            }
            .padding(.horizontal, 28)

            Spacer()
        }
    }

    @ViewBuilder
    func lectureTypeList() -> some View {
        ForEach(viewModel.lectureType, id: \.self) { lectureType in
            HStack {
                CheckButton(
                    isSelected: Binding(
                        get: { viewModel.selectedLectureType == lectureType.display() },
                        set: { lecture in
                            if lecture {
                                viewModel.selectedLectureType = lectureType.display()
                            }
                        }
                    )
                )

                Text(lectureType.display())
            }
        }
    }

    @ViewBuilder
    func approveStatusTypeList() -> some View {
        ForEach(viewModel.approveStatusType, id: \.self) { approveStatusType in
            HStack {
                CheckButton(
                    isSelected: Binding(
                        get: { viewModel.selectedapproveStatusType == approveStatusType.display() },
                        set: { status in
                            if status {
                                viewModel.selectedapproveStatusType = approveStatusType.display()
                            }
                        }
                    )
                )

                Text(approveStatusType.display())
            }
        }
    }
}
