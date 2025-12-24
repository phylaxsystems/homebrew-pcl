class Phylax < Formula
  desc "Phylax Credible Layer (PCL) CLI"
  homepage "https://github.com/phylaxsystems/credible-sdk"
  version "0.9.2"

  # Define URLs and SHA256 checksums for different architectures
  # You will need to update these for each new release.
  # To get the SHA256, download the binary and run: shasum -a 256 <binary_file_name>

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-x86_64.tar.gz"
      sha256 "4571b5351e3c6c30b8604341ccf6b43ce979874292e098649207c16f37474087"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-arm64.tar.gz"
      sha256 "94ec59840f02d5505e709301b3e94f7cca59df8375cbe9734f2d40be2c2c9535"
    else
      odie "Unsupported MacOS architecture."
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-x86_64.tar.gz"
      sha256 "e58799f140d0d4ceef9456f5df7c8fad1bad4215937d871746b4bbf020d8dfdc"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-arm64.tar.gz"
      sha256 "7b53e17e8ad99ec1f54d75e7e49e92d973ed88a02ac0a513594d31d4ce800312"
    else
      odie "Unsupported Linux architecture."
    end
  else
    odie "Unsupported operating system."
  end

  def install
    bin.install "pcl"
  end

  test do
    assert_match "pcl #{version}", shell_output("#{bin}/pcl --version")
  end
end
