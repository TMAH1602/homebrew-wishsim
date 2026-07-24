class Wishsim < Formula
  desc "Cinematic terminal wish simulator with animated reveals"
  homepage "https://github.com/TMAH1602/WishSim"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.8.0/wishsim-macos-arm64.tar.gz"
      sha256 "3014aa518b89140b98606533ebfe163b1eb8ffba37e8b45e7557517144fb801e"
    else
      url "https://github.com/TMAH1602/WishSim/releases/download/v0.8.0/wishsim-macos-x86_64.tar.gz"
      sha256 "c7b0b7940eb873611ebcd4eb705837030f861f6ed2b6db523649fcf5a54b879e"
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
