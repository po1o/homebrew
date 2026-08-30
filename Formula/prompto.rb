class Prompto < Formula
  desc "Prompt renderer with streaming daemon support"
  homepage "https://github.com/po1o/prompto"
  license "MIT"
  version "4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/po1o/prompto/releases/download/v4/prompto-darwin-arm64"
      sha256 "c8ca72eb3a30933c769cf31ef4cf6b71713f9002c37caea97b44ddd9c8b65a75"
    else
      url "https://github.com/po1o/prompto/releases/download/v4/prompto-darwin-amd64"
      sha256 "bfbbd55eea7b40339fcbb069f7318eb1899ba8a998db6ab84ac6175c6faeab70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/po1o/prompto/releases/download/v4/prompto-linux-arm64"
      sha256 "d16bf547d027c16ce0d5196e723f4d7a2b7773c47c61be8fe7d349d3d7654f4e"
    else
      url "https://github.com/po1o/prompto/releases/download/v4/prompto-linux-amd64"
      sha256 "a13e40ddb56553fb90bcfb8eb07e916a07ada03b910bff272595f8402de4dcfc"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "prompto-darwin-arm64" : "prompto-darwin-amd64"
    else
      Hardware::CPU.arm? ? "prompto-linux-arm64" : "prompto-linux-amd64"
    end

    bin.install binary_name => "prompto"
  end

  test do
    output = shell_output("#{bin}/prompto version").strip
    assert_match(/\S+/, output)
  end
end
