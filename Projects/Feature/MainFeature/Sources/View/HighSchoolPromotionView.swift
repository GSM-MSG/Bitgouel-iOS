import DesignSystem
import SwiftUI

struct HighSchoolPromotionView: View {
    var body: some View {
        VStack(spacing: 16) {
            IntroduceView(
                introduceTitle: "직업계고 소개",
                introduceText: "직업계고 계열별 학교현황 및 진로"
            )
            .padding(.horizontal, 28)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    Group {
                        highSchoolListRow(
                            schoolImage: BitgouelImage(.gwangjuNaturalScienceHighSchool),
                            schoolName: "광주자연과학고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: BitgouelImage(.jeonnamTechnicalHighSchool),
                            schoolName: "전남공업고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: BitgouelImage(.sunguiScienceTechnologyHighSchool),
                            schoolName: "숭의과학기술고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: BitgouelImage(.dongilHighSchoolOfFutureScienceHighSchool),
                            schoolName: "동일미래과학고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: BitgouelImage(.jeonnamGirlsCommercialHighSchool),
                            schoolName: "전남여자상업고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: BitgouelImage(.seojinGirlsHighSchool),
                            schoolName: "서진여자고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: BitgouelImage(.gwangjuTechnicalHighSchool),
                            schoolName: "광주공업고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: BitgouelImage(.kumpaTechnicalHighSchool),
                            schoolName: "금파공업고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: BitgouelImage(.songwonGirlsCommercialHighSchool),
                            schoolName: "송원여자상업고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: BitgouelImage(.gwangjuAutomaticEquipmentTechnicalHighSchool),
                            schoolName: "광주자동화설비\n 공업고등학교"
                        )
                    }

                    highSchoolListRow(
                        schoolImage: BitgouelImage(.gwangjuSoftwareMeisterHighSchool),
                        schoolName: "광주소프트웨어\n마이스터고등학교"
                    )

                    highSchoolListRow(
                        schoolImage: BitgouelImage(.gwangjuElectronicTechnicalHighSchool),
                        schoolName: "광주전자공업고등학교"
                    )

                    highSchoolListRow(
                        schoolImage: BitgouelImage(.gwangjuGirlsCommercialHighSchool),
                        schoolName: "광주여자상업고등학교"
                    )
                }
            }
        }
    }

    @ViewBuilder
    func highSchoolListRow(
        schoolImage: BitgouelImage,
        schoolName: String
    ) -> some View {
        VStack(spacing: 8) {
            schoolImage
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)

            Text(schoolName)
                .bitgouelFont(.caption, color: .greyscale(.g4))
                .padding(.bottom)
        }
    }
}
