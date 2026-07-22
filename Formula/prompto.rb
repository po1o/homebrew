class Prompto < Formula
  desc "Prompt renderer with streaming daemon support"
  homepage "https://github.com/po1o/prompto"
  license "MIT"
  version "2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/po1o/prompto/releases/download/v2/prompto-darwin-arm64"
      sha256 "edfe23be89590f0a2b7bf12ce4b5ef0806965896df6a2eeab49179882b601264"
    else
      url "https://github.com/po1o/prompto/releases/download/v2/prompto-darwin-amd64"
      sha256 "b0f9966a9bc56e698eab9012b5dc241609ea9ba076105460d7b91c669bd06109"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/po1o/prompto/releases/download/v2/prompto-linux-arm64"
      sha256 "8164eee17259d72dd51f13674568e95e5cd446c50ab902d15ca1ffc01ecfc46e"
    else
      url "https://github.com/po1o/prompto/releases/download/v2/prompto-linux-amd64"
      sha256 "8b5daafd574686763b016f48dd58e63c4c0b115f67d1f1b3bc24575968da6273"
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
