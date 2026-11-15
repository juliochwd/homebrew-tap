class Mythoscode < Formula
  desc "MythosCode, a coding agent for the terminal"
  homepage "https://mythoscode.dev"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juliochwd/mythoscode-releases/releases/download/v0.1.1/mythoscode-darwin-arm64"
      sha256 "e4a3f59bce3c57ef4d7e384e4a5bc1d33716741b3d4868d3eaaaad4e59b8238e"
    end
    on_intel do
      url "https://github.com/juliochwd/mythoscode-releases/releases/download/v0.1.1/mythoscode-darwin-x64"
      sha256 "ae51ed3401248848f4ed44dab647a66d0c52f94da099e2be0e37f2f7cbe7d464"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juliochwd/mythoscode-releases/releases/download/v0.1.1/mythoscode-linux-arm64"
      sha256 "f53d55b834203c2804547889bfb1f5f21481bef8d18c8e21d529835d820c679e"
    end
    on_intel do
      url "https://github.com/juliochwd/mythoscode-releases/releases/download/v0.1.1/mythoscode-linux-x64"
      sha256 "6d8cfb7257f3d3452cb608ad6c14e01ba23101dd4bd3254ef661c205d519b138"
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
