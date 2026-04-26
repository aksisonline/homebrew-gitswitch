class Gitswitch < Formula
  desc "Terminal UI for managing multiple local git identities"
  homepage "https://github.com/aksisonline/gitswitch"
  version "0.1.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-darwin-arm64"
      sha256 "03b46b9790302186939b17cf67837212ddbc4149c423c39e79cdeff877fe495a"
    else
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-darwin-amd64"
      sha256 "2b1acb7122ea93e928641c9a63f5da7e8dacf970510e4b1c82b4aa6f9311292a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-linux-arm64"
      sha256 "75296eb479573b536addc9f2de901ec05a5d75dbef620967ae0bff2bc8fd0e40"
    else
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-linux-amd64"
      sha256 "53d9d95bc21e57705de87132b04bfd6f53f387a1764fe95944c9da6313c8f3ce"
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
