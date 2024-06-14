import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.InputCertificationFeature.rawValue,
    targets: [
        .interface(module: .feature(.InputCertificationFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.InputCertificationFeature), dependencies: [
            .feature(target: .InputCertificationFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.InputCertificationFeature), dependencies: [
            .feature(target: .InputCertificationFeature)
        ])
    ]
)
