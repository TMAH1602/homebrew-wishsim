class Wishsim < Formula
  desc "Cinematic terminal wish simulator with animated reveals"
  homepage "https://github.com/TMAH1602/WishSim"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.2.0/wishsim-macos-arm64.tar.gz"
      sha256 "a67dc766effeb4da58825e8737644cba83671456b1a2e333739d0709c44dac1d"
    else
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.2.0/wishsim-macos-x86_64.tar.gz"
      sha256 "11897b1cc6a6353e4c75fbf783f659d8171bd7171d1b1143fbd1de600fed7f6b"
    end
  end

  def install
    bin.install "wishsim"
  end

  def caveats
    <<~EOS
      Run WishSim directly in Kitty for full-resolution character artwork.
      Terminal multiplexers such as Zellij may block Kitty's graphics protocol.
    EOS
  end

  test do
    assert_match "wishsim #{version}", shell_output("#{bin}/wishsim --version")
  end
end
