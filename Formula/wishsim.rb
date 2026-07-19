class Wishsim < Formula
  desc "Cinematic terminal wish simulator with animated reveals"
  homepage "https://github.com/TMAH1602/WishSim"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.4.0/wishsim-macos-arm64.tar.gz"
      sha256 "ccd46f9ef73e86fddb91988cad8a1f4b91ab2314b28467e0eda1b882911ec318"
    else
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.4.0/wishsim-macos-x86_64.tar.gz"
      sha256 "60c8aa3222da9d478dbb82f899a8cae65da860ddb362a128e3fce8af33bab671"
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
