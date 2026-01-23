class Phylax < Formula
  desc "Credible Layer CLI"
  homepage "https://github.com/phylaxsystems/credible-sdk"
  version "1.0.3"

  # Define URLs and SHA256 checksums for different architectures
  # You will need to update these for each new release.
  # To get the SHA256, download the binary and run: shasum -a 256 <binary_file_name>

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-arm64.tar.gz"
      sha256 "441d616768892f336d60ddbced70f050d56c290a55027e0fc6b0e4d61357ddc1"
    else
      odie "Intel macOS is no longer supported."
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-x86_64.tar.gz"
      sha256 "98c0489fe14770204e0239ed844d97b9952d4e8710a042e4666d3fcdc56e39a1"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-arm64.tar.gz"
      sha256 "d17e0abaf67070665b89a328803130c7c2226b8dbe03900ae3a5492dd8e4eb8a"
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
