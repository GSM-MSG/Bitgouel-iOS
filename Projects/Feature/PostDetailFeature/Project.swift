import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.PostDetailFeature.rawValue,
    targets: [
        .interface(module: .feature(.PostDetailFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.PostDetailFeature), dependencies: [
            .feature(target: .PostDetailFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.PostDetailFeature), dependencies: [
            .feature(target: .PostDetailFeature)
        ])
    ]
)
