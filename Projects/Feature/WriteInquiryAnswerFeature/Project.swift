import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.WriteInquiryAnswerFeature.rawValue,
    targets: [
        .interface(module: .feature(.WriteInquiryAnswerFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.WriteInquiryAnswerFeature), dependencies: [
            .feature(target: .WriteInquiryAnswerFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.WriteInquiryAnswerFeature), dependencies: [
            .feature(target: .WriteInquiryAnswerFeature)
        ])
    ]
)
