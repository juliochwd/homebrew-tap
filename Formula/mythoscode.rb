class Mythoscode < Formula
  desc "MythosCode, a coding agent for the terminal"
  homepage "https://mythoscode.dev"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juliochwd/mythoscode-releases/releases/download/v0.1.0/mythoscode-darwin-arm64"
      sha256 "849732725cb22fbef338bd55688feae49df5d9553116aaae635f9fe416249195"
    end
    on_intel do
      url "https://github.com/juliochwd/mythoscode-releases/releases/download/v0.1.0/mythoscode-darwin-x64"
      sha256 "ae9f276a418feba29f49388276c2dc278d192e7e8d8444608c09536a5d207537"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juliochwd/mythoscode-releases/releases/download/v0.1.0/mythoscode-linux-arm64"
      sha256 "50a637988c41ebc1190808ba2153397838698d84a61fc416feaa80a1a55a8fb9"
    end
    on_intel do
      url "https://github.com/juliochwd/mythoscode-releases/releases/download/v0.1.0/mythoscode-linux-x64"
      sha256 "641115aa054e9929881e213448ccae9ec2197d3ccfb722dde47a8da48ba3275c"
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
