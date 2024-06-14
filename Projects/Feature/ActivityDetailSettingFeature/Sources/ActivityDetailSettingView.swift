import DesignSystem
import SwiftUI

struct ActivityDetailSettingView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: ActivityDetailSettingViewModel

    init(viewModel: ActivityDetailSettingViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        BitgouelText(
                            text: "활동 날짜",
                            font: .text1
                        )

                        Spacer()
                    }

                    DatePicker(
                        "활동 날짜 선택",
                        selection: Binding(get: {
                            viewModel.selectedDate
                        }, set: { newValue in
                            viewModel.updateDate(date: newValue)
                        }),
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Color.bitgouel(.greyscale(.g9)))
                    .cornerRadius(8, corners: .allCorners)

                    Spacer()
                }
                .padding(.top, 28)

                Spacer()

                VStack {
                    HStack {
                        BitgouelText(
                            text: "수여 학점",
                            font: .text1
                        )
                        Spacer()
                    }

                    Button {
                        viewModel.isPresentedCreditSheet = true
                    } label: {
                        HStack {
                            HStack(spacing: 0) {
                                BitgouelText(
                                    text: String(viewModel.selectedCredit ?? 1),
                                    font: .text3
                                )

                                BitgouelText(text: "점", font: .text3)
                            }
                            .foregroundColor(.bitgouel(.greyscale(.g2)))
                            .padding(.vertical, 16)

                            Spacer()

                            BitgouelIcon(.chevronDown)
                        }
                        .padding(.horizontal, 20)
                        .background(Color.bitgouel(.greyscale(.g9)))
                        .cornerRadius(8, corners: .allCorners)
                    }

                    Spacer()
                }
                .padding(.top, -60)

                Spacer()

                BitgouelButton(
                    text: "적용하기"
                ) {
                    viewModel.applyButtonDidTap()
                    dismiss()
                }
            }
            .padding(.horizontal, 28)
            .bitgouelBottomSheet(
                isShowing: $viewModel.isPresentedCreditSheet
            ) {
                setCreditBottomSheet()
            }
            .navigationTitle("활동 세부 설정")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        BitgouelIcon(.xmark)
                            .foregroundColor(.bitgouel(.greyscale(.g8)))
                    }
                }
            }
        }
    }

    @ViewBuilder
    func setCreditBottomSheet() -> some View {
        ForEach(viewModel.creditValue, id: \.self) { credit in
            HStack {
                BitgouelText(
                    text: "\(credit)점",
                    font: .text2
                )

                Spacer()

                BitgouelRadioButton(
                    isSelected: Binding(
                        get: { viewModel.selectedCredit == credit },
                        set: { isSelected in
                            if isSelected {
                                viewModel.isPresentedCreditSheet = false
                                viewModel.selectedCredit = credit
                            }
                        }
                    )
                )
            }
            .onTapGesture {
                viewModel.isPresentedCreditSheet = false
                viewModel.selectedCredit = credit
            }
            .padding(.vertical, 24)
        }
        .padding(.horizontal, 28)
    }
}
