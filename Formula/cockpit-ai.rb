class CockpitAi < Formula
  desc "Distributed personal agentic work orchestration system"
  homepage "https://github.com/shreynshah/cockpit.ai"
  version "0.1.1"
  license "MIT"

  depends_on "node@22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shreynshah/cockpit.ai/releases/download/v#{version}/cockpit-#{version}-darwin-arm64.tar.gz"
      sha256 "9114190024a26e2a868095d2b30f9b9f112d674c7b24ae47bde2f1f6afc76b4c" # darwin-arm64
    else
      url "https://github.com/shreynshah/cockpit.ai/releases/download/v#{version}/cockpit-#{version}-darwin-x64.tar.gz"
      sha256 "" # darwin-x64
    end
  end

  on_linux do
    url "https://github.com/shreynshah/cockpit.ai/releases/download/v#{version}/cockpit-#{version}-linux-x64.tar.gz"
    sha256 "" # linux-x64
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cockpit.mjs" => "cockpit"
    bin.install_symlink libexec/"bin/cockpitd.mjs" => "cockpitd"
  end

  test do
    system "#{bin}/cockpit", "--version"
  end
end
