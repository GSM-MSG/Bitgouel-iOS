import BaseFeature
import ClubListFeatureInterface
import DesignSystem
import LectureListFeatureInterface
import MainFeatureInterface
import MyPageFeatureInterface
import PostListFeatureInterface
import SwiftUI

struct MainTabView: View {
    @State var selection: TabFlow = .home
    @State var tabbarHidden = false

    private let mainFactory: any MainFactory
    private let lectureListFactory: any LectureListFactory
    private let postListFactory: any PostListFactory
    private let clubListFactory: any ClubListFactory
    private let myPageFactory: any MyPageFactory

    init(
        mainFactory: any MainFactory,
        lectureListFactory: any LectureListFactory,
        postListFactory: any PostListFactory,
        clubListFactory: any ClubListFactory,
        myPageFactory: any MyPageFactory
    ) {
        self.mainFactory = mainFactory
        self.lectureListFactory = lectureListFactory
        self.postListFactory = postListFactory
        self.clubListFactory = clubListFactory
        self.myPageFactory = myPageFactory
        UITabBar.appearance().scrollEdgeAppearance = .init()
    }

    var body: some View {
        TabView(selection: $selection) {
            mainFactory.makeView()
                .eraseToAnyView()
                .tag(TabFlow.home)
                .tabItem {
                    BitgouelIcon(.home, renderingMode: .template)

                    Text("홈")
                }

            lectureListFactory.makeView(selection: $selection)
                .eraseToAnyView()
                .tag(TabFlow.lecture)
                .tabItem {
                    BitgouelIcon(.laptop, renderingMode: .template)

                    Text("강의")
                }

            postListFactory.makeView(selection: $selection)
                .eraseToAnyView()
                .tag(TabFlow.post)
                .tabItem {
                    BitgouelIcon(.messageFill, renderingMode: .template)

                    Text("게시글")
                }

            clubListFactory.makeView(selection: $selection)
                .eraseToAnyView()
                .tag(TabFlow.club)
                .tabItem {
                    BitgouelIcon(.person3Fill, renderingMode: .template)

                    Text("동아리")
                }

            myPageFactory.makeView(selection: $selection)
                .eraseToAnyView()
                .tag(TabFlow.userInfo)
                .tabItem {
                    BitgouelIcon(.person, renderingMode: .template)

                    Text("내 정보")
                }
        }
        .environment(\.tabbarHidden, $tabbarHidden)
        .onChange(of: tabbarHidden) { newValue in
            isHiddenTabbar(newValue)
        }
    }
}
