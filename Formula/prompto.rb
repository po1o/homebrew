class Prompto < Formula
  desc "Prompt renderer with streaming daemon support"
  homepage "https://github.com/po1o/prompto"
  license "MIT"
  version "5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/po1o/prompto/releases/download/v5/prompto-darwin-arm64"
      sha256 "ea372e9ae15dee9a3e251d266e1b47e6018e3fd28815c6c059577a4a9fbfeff4"
    else
      url "https://github.com/po1o/prompto/releases/download/v5/prompto-darwin-amd64"
      sha256 "8421ed911601896d15235606703621b07cfe3b982dff8c5249495d60449b6729"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/po1o/prompto/releases/download/v5/prompto-linux-arm64"
      sha256 "6fd300703224ff7f88e5bf8c2893f0c0d498481bc9c353e114b20639e19ee61d"
    else
      url "https://github.com/po1o/prompto/releases/download/v5/prompto-linux-amd64"
      sha256 "c2a2db8ad6e3c66dea3cb53b2885618b8d068637ac3f93e7adcee28d95cd9f7e"
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
