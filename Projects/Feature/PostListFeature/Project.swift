import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.PostListFeature.rawValue,
    targets: [
        .interface(module: .feature(.PostListFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.PostListFeature), dependencies: [
            .feature(target: .PostListFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.PostListFeature), dependencies: [
            .feature(target: .PostListFeature)
        ])
    ]
)
