class Gitswitch < Formula
  desc "Terminal UI for managing multiple local git identities"
  homepage "https://github.com/aksisonline/gitswitch"
  version "0.1.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-darwin-arm64"
      sha256 ""
    else
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-darwin-amd64"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-linux-arm64"
      sha256 ""
    else
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-linux-amd64"
      sha256 ""
    end
  end

  def install
    binary_name = if OS.mac?
                    "gitswitch-darwin-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}"
                  else
                    "gitswitch-linux-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}"
                  end
    bin.install binary_name => "gitswitch"
  end

  test do
    system "#{bin}/gitswitch", "--help"
  end
end
