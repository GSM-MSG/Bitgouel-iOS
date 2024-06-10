import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.LectureDetailSettingFeature.rawValue,
    targets: [
        .interface(module: .feature(.LectureDetailSettingFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.LectureDetailSettingFeature), dependencies: [
            .feature(target: .LectureDetailSettingFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.LectureDetailSettingFeature), dependencies: [
            .feature(target: .LectureDetailSettingFeature)
        ])
    ]
)
