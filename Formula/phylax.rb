class Phylax < Formula
  desc "Phylax Credible Layer (PCL) CLI"
  homepage "https://github.com/phylaxsystems/credible-sdk"
  version "0.4.1"

  # Define URLs and SHA256 checksums for different architectures
  # You will need to update these for each new release.
  # To get the SHA256, download the binary and run: shasum -a 256 <binary_file_name>

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-x86_64.tar.gz"
      sha256 "c4d5300b908c513c0c294b20b72ce87d70470cf08a126016575c7115d7f7841d"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-arm64.tar.gz"
      sha256 "a0a47e927be45ec57582405a45c237dd208a67450daee1f5edf16d030d1c5317"
    else
      odie "Unsupported MacOS architecture."
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-x86_64.tar.gz"
      sha256 "90aa72fca9a51847aceab9d0594e16dd2d402bb34fb15b0e13c3d8d07b844e68"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-arm64.tar.gz"
      sha256 "3b14f0c52806f40a5b3aadc67a26235709768308e3c3460413720034a364952f"
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