class Wishsim < Formula
  desc "Cinematic terminal wish simulator with animated reveals"
  homepage "https://github.com/TMAH1602/WishSim"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.7.0/wishsim-macos-arm64.tar.gz"
      sha256 "ca6f2d3ed3878d0263e784a994a18f0f7a80417e1329f7bf75e8ef625bd2e32a"
    else
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.7.0/wishsim-macos-x86_64.tar.gz"
      sha256 "4259f01a2de9339e16b9ed9db0839d138e5206786c59c95535014a8f15c9013e"
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
