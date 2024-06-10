import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.RootFeature.rawValue,
    targets: [
        .interface(module: .feature(.RootFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.RootFeature), dependencies: [
            .feature(target: .RootFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.RootFeature), dependencies: [
            .feature(target: .RootFeature)
        ])
    ]
)
