class Phylax < Formula
  desc "Credible Layer CLI"
  homepage "https://github.com/phylaxsystems/credible-sdk"
  version "1.2.0"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-arm64.tar.gz"
    sha256 "dac8590af37cff432cc9e85370399392012d91c479988e34562b890ece70cff6"
  end

  on_linux do
    on_intel do
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-x86_64.tar.gz"
      sha256 "60565c9211c0bb03fede1b4dc26198b4e93dcf30b1ac637cc02a68693d9f246a"
    end

    on_arm do
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-arm64.tar.gz"
      sha256 "651a1d93b20195f7d57c31ddca742701e1db7ffe2c5b94c3dd84def7b3ac6d76"
    end
  end

  def install
    bin.install "pcl"
  end

  test do
    assert_match "pcl #{version}", shell_output("#{bin}/pcl --version")
  end
end
