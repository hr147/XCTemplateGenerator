import Foundation
import PackagePlugin

@main
struct TCAFeatureTemplateGenerator: CommandPlugin {
    let fileManager = FileManager.default

    func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
        try fileManager.createDirectoryIfNeeded(atDirectory: .templates)

        try fileManager.copyOrReplace(atPath: .source, toPath: .template)
    }
}

private extension FileManager {
    enum Path: String {
        case template = "../XcodeTemplateGenerator/Templates/TCAFeature.xctemplate"
        case source = "../TCAFeature/Sources"
    }
    
    enum Directory: String {
        case templates = "../XcodeTemplateGenerator/Templates"
    }
    
    func copyOrReplace(atPath path: Path, toPath: Path) throws {
        if fileExists(atPath: toPath.rawValue) {
            try removeItem(atPath: toPath.rawValue)
        }
        
        try copyItem(atPath: path.rawValue, toPath: toPath.rawValue)
    }
    
    func createDirectoryIfNeeded(atDirectory directory: Directory) throws {
        guard !fileExists(atPath: directory.rawValue) else {
            return
        }
        
        try createDirectory(atPath: directory.rawValue, withIntermediateDirectories: true)
    }
}
