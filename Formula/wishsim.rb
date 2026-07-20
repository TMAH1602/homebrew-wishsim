class Wishsim < Formula
  desc "Cinematic terminal wish simulator with animated reveals"
  homepage "https://github.com/TMAH1602/WishSim"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.5.0/wishsim-macos-arm64.tar.gz"
      sha256 "2c3e454df4c322227b5fba9c8fe31122778cf895568f7426f5d50e5b85eb8e5d"
    else
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.5.0/wishsim-macos-x86_64.tar.gz"
      sha256 "d094c68d2affdcf539c4e3569ea40c64d9a648fa9e1f45595082f552fa9c7070"
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
