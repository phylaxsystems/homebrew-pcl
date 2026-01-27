class Phylax < Formula
  desc "Credible Layer CLI"
  homepage "https://github.com/phylaxsystems/credible-sdk"
  version "1.0.3-patch"

  # Define URLs and SHA256 checksums for different architectures
  # You will need to update these for each new release.
  # To get the SHA256, download the binary and run: shasum -a 256 <binary_file_name>

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-arm64.tar.gz"
      sha256 "1f95dbd28689e02eea2075e5aadc02e609059a1ca80dc6fe9557871bb0edef5f"
    else
      odie "Intel macOS is no longer supported."
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-x86_64.tar.gz"
      sha256 "0b1dd4a6246081a85b8a2dec8964b395889c58aaa3a87c63cbc3126c242774fb"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-arm64.tar.gz"
      sha256 "64f57791131da736e8d5a7dc8563b0fa5919b290fa2379e96e33f3e53fb41ab0"
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
