class Phylax < Formula
  desc "Credible Layer CLI"
  homepage "https://github.com/phylaxsystems/credible-sdk"
  version "0.9.4"

  # Define URLs and SHA256 checksums for different architectures
  # You will need to update these for each new release.
  # To get the SHA256, download the binary and run: shasum -a 256 <binary_file_name>

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/main/pcl-#{version}-macos-arm64.tar.gz"
      sha256 "3be04c912694282bcd2ac75ea10ef4d1a7fe9e3c17a4fd165eacbf1a93e20292"
    else
      odie "Intel macOS is no longer supported."
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/main/pcl-#{version}-linux-x86_64.tar.gz"
      sha256 "690cf4bdefd7b7bd72e8347fea7ff67672eda96dcc21f44c91ded1ecab655e4a"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/main/pcl-#{version}-linux-arm64.tar.gz"
      sha256 "4fb91075326e845fc51d2ac47b564f0b54020e9d9cd3097ea8d8cbb8695472d7"
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
