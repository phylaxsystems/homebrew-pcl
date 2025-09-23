class Phylax < Formula
  desc "Phylax Credible Layer (PCL) CLI"
  homepage "https://github.com/phylaxsystems/credible-sdk"
  version "0.6.1"

  # Define URLs and SHA256 checksums for different architectures
  # You will need to update these for each new release.
  # To get the SHA256, download the binary and run: shasum -a 256 <binary_file_name>

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-x86_64.tar.gz"
      sha256 "73137dfaae3f02d8dc8d1a1829ec5c26e70948775a98d9a5d7a342f5a86112e9"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-arm64.tar.gz"
      sha256 "4d2b7a18d2bd66afd3017c695982e63be5a635f0ec3b5698c3dcd10004ae1964"
    else
      odie "Unsupported MacOS architecture."
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-x86_64.tar.gz"
      sha256 "8e0d51bd2a9044cdb30da686907e95d7a85d365e1ad532a4162942656204761c"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-arm64.tar.gz"
      sha256 "7946ec64a59ca8685dc4acd25376afb5f63ce47af57ff40cbc1ddd4fa83d06c8"
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
