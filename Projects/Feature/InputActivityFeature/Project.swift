import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.InputActivityFeature.rawValue,
    targets: [
        .interface(module: .feature(.InputActivityFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.InputActivityFeature), dependencies: [
            .feature(target: .InputActivityFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.InputActivityFeature), dependencies: [
            .feature(target: .InputActivityFeature)
        ])
    ]
)
