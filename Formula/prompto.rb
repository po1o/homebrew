class Prompto < Formula
  desc "Prompt renderer with streaming daemon support"
  homepage "https://github.com/po1o/prompto"
  license "MIT"
  version "3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/po1o/prompto/releases/download/v3/prompto-darwin-arm64"
      sha256 "8b435ca37daa16ca0e79b636fc4bc56621e12d7317e3ebb478a4e962923669dd"
    else
      url "https://github.com/po1o/prompto/releases/download/v3/prompto-darwin-amd64"
      sha256 "c0eef71c42b8f831d0e96a967fc0b508b793d3477571fa2733fb033140e4569e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/po1o/prompto/releases/download/v3/prompto-linux-arm64"
      sha256 "1c2ea832a7832f28cdb7890018284006d08e40bfdd17335d4925883cc2072513"
    else
      url "https://github.com/po1o/prompto/releases/download/v3/prompto-linux-amd64"
      sha256 "5cb991c1266e5c82245fa9a6457654ce2137c6797150dd88ef0d0b64277e02e0"
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
