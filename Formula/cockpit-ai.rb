class CockpitAi < Formula
  desc "Distributed personal agentic work orchestration system"
  homepage "https://github.com/shreynshah/cockpit.ai"
  version "0.1.3"
  license "MIT"

  depends_on "node@22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shreynshah/cockpit.ai/releases/download/v#{version}/cockpit-#{version}-darwin-arm64.tar.gz"
      sha256 "27d37262b22fc000aadc6d24550bc9c366756ae89dfd86a2373285280069f662"
    else
      url "https://github.com/shreynshah/cockpit.ai/releases/download/v#{version}/cockpit-#{version}-darwin-x64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    url "https://github.com/shreynshah/cockpit.ai/releases/download/v#{version}/cockpit-#{version}-linux-x64.tar.gz"
    sha256 ""
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
