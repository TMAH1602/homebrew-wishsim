class Wishsim < Formula
  desc "Cinematic terminal wish simulator with animated reveals"
  homepage "https://github.com/TMAH1602/WishSim"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.6.1/wishsim-macos-arm64.tar.gz"
      sha256 "0ac1c136fe32c696a205ed9cc41044d6c7073ec1abfd42fde1885fce9ad7f5fb"
    else
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.6.1/wishsim-macos-x86_64.tar.gz"
      sha256 "a08103892a31f7eccd5f778cbe7466f7ecbba8f6426f5dda42677b5a8f319b62"
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
