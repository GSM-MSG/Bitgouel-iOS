import DesignSystem
import SwiftUI

struct AiFusionAndCompositeClubView: View {
    var body: some View {
        VStack {
            Text("AI 융•복합")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)

            HStack {
                VStack(alignment: .leading) {
                    Text("광주공업고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    ClubsAndCompanysNameView(
                        name: "Civil 마스터"
                    )

                    Text("광주소프트웨어마이스터고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    ClubsAndCompanysNameView(
                        name: "dev_GSM"
                    )

                    Text("금파공업고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    ClubsAndCompanysNameView(
                        name: "다이나믹(Dynamic)"
                    )

                    Text("숭의과학기술고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "비상"
                        )

                        ClubsAndCompanysNameView(
                            name: "캐치어드론"
                        )
                    }

                    Text("전남공업고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    ClubsAndCompanysNameView(
                        name: "스카이드론"
                    )
                }
                Spacer()
            }
            .padding(.horizontal, 28)

            Spacer()
        }
        .background(
            BitgouelImage(.mainpageImage3)
                .aspectRatio(contentMode: .fill)
                .blur(radius: 6, opaque: true)
        )
    }
}
