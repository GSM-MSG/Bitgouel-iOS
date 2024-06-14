import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.PostDetailSettingFeature.rawValue,
    targets: [
        .interface(module: .feature(.PostDetailSettingFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.PostDetailSettingFeature), dependencies: [
            .feature(target: .PostDetailSettingFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.PostDetailSettingFeature), dependencies: [
            .feature(target: .PostDetailSettingFeature)
        ])
    ]
)
