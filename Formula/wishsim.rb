class Wishsim < Formula
  desc "Cinematic terminal wish simulator with animated reveals"
  homepage "https://github.com/TMAH1602/WishSim"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.3.1/wishsim-macos-arm64.tar.gz"
      sha256 "c9b13fa0443c0017fca2612e7925e74a312f6b9f1563c0f5b78ab7b028d1ca51"
    else
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.3.1/wishsim-macos-x86_64.tar.gz"
      sha256 "974954bb580ad0365d06d51ca9580c7cec5bd2079515f00785ff12f11c74cc29"
    end
  end

  def install
    bin.install "wishsim"
  end

  def caveats
    <<~EOS
      Run WishSim directly in Kitty or Ghostty for full-resolution character artwork.
      Terminal multiplexers such as Zellij may block the graphics protocol.
    EOS
  end

  test do
    assert_match "wishsim #{version}", shell_output("#{bin}/wishsim --version")
  end
end
