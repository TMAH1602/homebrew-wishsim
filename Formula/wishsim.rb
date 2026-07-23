class Wishsim < Formula
  desc "Cinematic terminal wish simulator with animated reveals"
  homepage "https://github.com/TMAH1602/WishSim"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.6.0/wishsim-macos-arm64.tar.gz"
      sha256 "ab39eb535e441607755e33b074c990245042131e2455141b83495e0125b4fb65"
    else
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.6.0/wishsim-macos-x86_64.tar.gz"
      sha256 "52ce54b2bb78100ddceb843802ebd2a128d235c59c3bad8d10c7d1b4257454ce"
    end
  end

  def install
    bin.install "wishsim"
  end

  def caveats
    <<~EOS
      Ghostty is WishSim's primary supported terminal emulator and is recommended
      for full-resolution artwork. Kitty is also supported; other terminals use
      the portable ANSI renderer.
      Terminal multiplexers such as Zellij may block the graphics protocol.
    EOS
  end

  test do
    assert_match "wishsim #{version}", shell_output("#{bin}/wishsim --version")
  end
end
