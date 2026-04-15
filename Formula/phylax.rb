class Phylax < Formula
  desc "Credible Layer CLI"
  homepage "https://github.com/phylaxsystems/pcl"
  version "1.3.1"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/phylaxsystems/pcl/releases/download/#{version}/pcl-#{version}-macos-arm64.tar.gz"
    sha256 ""
  end

  on_linux do
    on_intel do
      url "https://github.com/phylaxsystems/pcl/releases/download/#{version}/pcl-#{version}-linux-x86_64.tar.gz"
      sha256 ""
    end

    on_arm do
      url "https://github.com/phylaxsystems/pcl/releases/download/#{version}/pcl-#{version}-linux-arm64.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "pcl"
  end

  test do
    assert_match "pcl #{version}", shell_output("#{bin}/pcl --version")
  end
end
