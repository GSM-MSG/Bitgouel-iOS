import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.InputInquiryFeature.rawValue,
    targets: [
        .interface(module: .feature(.InputInquiryFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.InputInquiryFeature), dependencies: [
            .feature(target: .InputInquiryFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.InputInquiryFeature), dependencies: [
            .feature(target: .InputInquiryFeature)
        ])
    ]
)
