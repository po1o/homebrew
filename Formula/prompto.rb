class Prompto < Formula
  desc "Prompt renderer with streaming daemon support"
  homepage "https://github.com/po1o/prompto"
  license "MIT"
  version "1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/po1o/prompto/releases/download/v1/prompto-darwin-arm64"
      sha256 "0e4d1853fc9791a1098d3c4493868adcfb0a23b5f477f8a41ffd9465353e4150"
    else
      url "https://github.com/po1o/prompto/releases/download/v1/prompto-darwin-amd64"
      sha256 "3766ecbefe614e9fccef6625f224883040fce37cb578ca283c2835a22a4c6cd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/po1o/prompto/releases/download/v1/prompto-linux-arm64"
      sha256 "6425499a47de3c072240945ee74f2e5f80991339732ec3beddd89e5e083e5be3"
    else
      url "https://github.com/po1o/prompto/releases/download/v1/prompto-linux-amd64"
      sha256 "4df8aeddacc0d9b2e79dcddc7b8e5b6740eb62cfe06eb73a79cc7b1af917b278"
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
