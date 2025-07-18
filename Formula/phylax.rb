class Phylax < Formula
  desc "Phylax Credible Layer (PCL) CLI"
  homepage "https://github.com/phylaxsystems/credible-sdk"
  version "0.2.0"

  # Define URLs and SHA256 checksums for different architectures
  # You will need to update these for each new release.
  # To get the SHA256, download the binary and run: shasum -a 256 <binary_file_name>

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-x86_64.tar.gz"
      sha256 "181b7a8e2f8f191ed32491453ae43e35f9618aaa1ae8c529bb25c07f98792820"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-arm64.tar.gz"
      sha256 "f04ab2f3b294cae64528240703af20b2218742a15585819988a14fe2be8d54ee"
    else
      odie "Unsupported MacOS architecture."
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-x86_64.tar.gz"
      sha256 "85c026679862527469e8237de2416b163d0542f9c3af9ab56dab29acbc20b4b3"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-arm64.tar.gz"
      sha256 "5cdeedb5c78716507a7e5de8ff542db431dc9fceea027a015bd2656d26f0c4a7"
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