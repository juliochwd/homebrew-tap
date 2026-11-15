class Mythoscode < Formula
  desc "MythosCode, a coding agent for the terminal"
  homepage "https://mythoscode.dev"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juliochwd/mythoscode-releases/releases/download/v0.1.2/mythoscode-darwin-arm64"
      sha256 "845731a4567862b67542d124a672f6ec4a3d61efc278081a9151101c956a87de"
    end
    on_intel do
      url "https://github.com/juliochwd/mythoscode-releases/releases/download/v0.1.2/mythoscode-darwin-x64"
      sha256 "8695b473b6d5d105503b61d10e0105fb73c899e502786d0d417f38f19236ef5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juliochwd/mythoscode-releases/releases/download/v0.1.2/mythoscode-linux-arm64"
      sha256 "ea0530cb17dd328c73b2a2a901f1094971e698180045c4a847385186726f4c21"
    end
    on_intel do
      url "https://github.com/juliochwd/mythoscode-releases/releases/download/v0.1.2/mythoscode-linux-x64"
      sha256 "1fd93f7abd10959a7c2d773d6adfef295135b6d4ce8102b299bee233903356d9"
    end
  end

  def install
    target = if OS.mac?
      Hardware::CPU.arm? ? "darwin-arm64" : "darwin-x64"
    else
      Hardware::CPU.arm? ? "linux-arm64" : "linux-x64"
    end
    bin.install "mythoscode-#{target}" => "mythoscode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mythoscode --version")
  end
end
