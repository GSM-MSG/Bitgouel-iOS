import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.InputPostFeature.rawValue,
    targets: [
        .interface(module: .feature(.InputPostFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.InputPostFeature), dependencies: [
            .feature(target: .InputPostFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.InputPostFeature), dependencies: [
            .feature(target: .InputPostFeature)
        ])
    ]
)
