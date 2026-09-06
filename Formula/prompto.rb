class Prompto < Formula
  desc "Prompt renderer with streaming daemon support"
  homepage "https://github.com/po1o/prompto"
  license "MIT"
  version "6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/po1o/prompto/releases/download/v6/prompto-darwin-arm64"
      sha256 "5a822f25f5b61a19ae04a501f068bb1295941827593565ec99e2eff7cdfdc86e"
    else
      url "https://github.com/po1o/prompto/releases/download/v6/prompto-darwin-amd64"
      sha256 "2c5fe11f4eff4ed572da18948417d2f94d906f0e633542d0da6afb203392f0c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/po1o/prompto/releases/download/v6/prompto-linux-arm64"
      sha256 "f4b3942cbad8798cfbbb87a7c2b044bd292baf9c801c5c28207940480e6fdedc"
    else
      url "https://github.com/po1o/prompto/releases/download/v6/prompto-linux-amd64"
      sha256 "2644f4199c0a6b7203afe2d1a8d4736bd1286a93813700993d37b4339d6caa14"
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
