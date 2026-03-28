class CockpitAi < Formula
  desc "Distributed personal agentic work orchestration system"
  homepage "https://github.com/shreynshah/cockpit.ai"
  version "0.1.11"
  license "MIT"

  depends_on "node@22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shreynshah/releases/releases/download/v#{version}/cockpit-#{version}-darwin-arm64.tar.gz"
      sha256 "ecc6ad9020c2ccf34d0dcd62642454b8f97ac753d4c9a4dee06938ad3fad3b78" # darwin-arm64
    else
      url "https://github.com/shreynshah/releases/releases/download/v#{version}/cockpit-#{version}-darwin-x64.tar.gz"
      sha256 "" # darwin-x64
    end
  end

  on_linux do
    url "https://github.com/shreynshah/releases/releases/download/v#{version}/cockpit-#{version}-linux-x64.tar.gz"
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
