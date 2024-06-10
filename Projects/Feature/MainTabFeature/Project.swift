import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.MainTabFeature.rawValue,
    targets: [
        .interface(module: .feature(.MainTabFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.MainTabFeature), dependencies: [
            .feature(target: .MainTabFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.MainTabFeature), dependencies: [
            .feature(target: .MainTabFeature)
        ])
    ]
)
