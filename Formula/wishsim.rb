class Wishsim < Formula
  desc "Cinematic terminal wish simulator with animated reveals"
  homepage "https://github.com/TMAH1602/WishSim"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.3.0/wishsim-macos-arm64.tar.gz"
      sha256 "2425cbe8a4a29fbf8fe9319cae4b16e59a6a06179a856cef98e9d81c220c81bf"
    else
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.3.0/wishsim-macos-x86_64.tar.gz"
      sha256 "6befd401f7a46fa3b03999a3e5c1b2f6055c4c319c168f1d004424d5530d6a86"
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
