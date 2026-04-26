class Gitswitch < Formula
  desc "Terminal UI for managing multiple local git identities"
  homepage "https://github.com/aksisonline/gitswitch"
  version "0.1.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-darwin-arm64"
      sha256 "6eb0306e1ac89d39121a8984e9c601d57c0cce66ca0539b1184f292161c90cb1"
    else
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-darwin-amd64"
      sha256 "410ffb70eb0f5426d58f5e9faa55e385ef407f156877ccf2a433fabba5d45397"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-linux-arm64"
      sha256 "1d68c5490cd3ab5ea7b3fe970a4c9c6a736040e387ad2d5a4fdf717adb751055"
    else
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-linux-amd64"
      sha256 "cbe96cb8c79940d30ff84ea8479926618801fb4434ddabbd9a414d2b2dbe06e3"
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
