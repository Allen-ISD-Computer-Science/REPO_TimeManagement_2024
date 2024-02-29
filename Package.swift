// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageName = "TMServer"

func tempFiles() -> [String] {
      // Swift does not natively support excluding wildcard file paths.
      // Therefore, we have to find them manually and return the files to exclude.

    let enumerator = FileManager.default.enumerator(atPath: "Sources/TMServer/")
    let filePaths = enumerator?.allObjects as! [String]
        
    return filePaths.filter{$0.hasSuffix("~") || $0.hasSuffix("#")}
}

let package = Package(
  name: packageName,

  dependencies: [
    .package(url: "https://github.com/apple/swift-atomics.git", from: "1.1.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(name: "CBase32"),
    .target(name: "CVaporBcrypt"),
    
    .executableTarget(name: packageName,
                      dependencies: [
                        .product(name: "Atomics", package: "swift-atomics"),
                        .target(name: "CBase32"),
                        .target(name: "CVaporBcrypt"),
                      ],
                      exclude: tempFiles())
  ]
)
