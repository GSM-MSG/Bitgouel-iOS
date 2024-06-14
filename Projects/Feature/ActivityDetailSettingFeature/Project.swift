import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.ActivityDetailSettingFeature.rawValue,
    targets: [
        .interface(module: .feature(.ActivityDetailSettingFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.ActivityDetailSettingFeature), dependencies: [
            .feature(target: .ActivityDetailSettingFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.ActivityDetailSettingFeature), dependencies: [
            .feature(target: .ActivityDetailSettingFeature)
        ])
    ]
)
