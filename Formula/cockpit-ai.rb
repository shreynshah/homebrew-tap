class CockpitAi < Formula
  desc "Distributed personal agentic work orchestration system"
  homepage "https://github.com/shreynshah/cockpit.ai"
  version "0.1.16"
  license "MIT"

  depends_on "node@22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shreynshah/releases/releases/download/v#{version}/cockpit-#{version}-darwin-arm64.tar.gz"
      sha256 "acf4d4c044676e27d38535f18401d6e27464ebd8bbf3601436ee210e8c82f814" # darwin-arm64
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
