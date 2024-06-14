import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.NoticeDetailSettingFeature.rawValue,
    targets: [
        .interface(module: .feature(.NoticeDetailSettingFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.NoticeDetailSettingFeature), dependencies: [
            .feature(target: .NoticeDetailSettingFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.NoticeDetailSettingFeature), dependencies: [
            .feature(target: .NoticeDetailSettingFeature)
        ])
    ]
)
