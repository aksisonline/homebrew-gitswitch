class Gitswitch < Formula
  desc "Terminal UI for managing multiple local git identities"
  homepage "https://github.com/aksisonline/gitswitch"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-darwin-arm64"
      sha256 "6bdaee427a3e9b60beff2011ce3d74bb839b6d2e5e031a7e40659a66d3a0eccc"
    else
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-darwin-amd64"
      sha256 "6a6ddd77bd8c6cbff9b584de39432a4a88f5c9a055d472f885e525c353fe9cfb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-linux-arm64"
      sha256 "c34342959e0a75f9f30b61bc145eff27d1089de812f50aff6c34761cfd8ddf26"
    else
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-linux-amd64"
      sha256 "dd25aeeff6b8749e24c98c56b81dc91a49da742eb3c5c4dadfd6a0f89ada7b59"
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
