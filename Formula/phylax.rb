class Phylax < Formula
  desc "Phylax Credible Layer (PCL) CLI"
  homepage "https://github.com/phylaxsystems/credible-sdk"
  version "0.9.1"

  # Define URLs and SHA256 checksums for different architectures
  # You will need to update these for each new release.
  # To get the SHA256, download the binary and run: shasum -a 256 <binary_file_name>

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-x86_64.tar.gz"
      sha256 "16d4dbbc66efcbb731164412c1ac378fc6c8eca408021397f5ca1d59346015f1"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-macos-arm64.tar.gz"
      sha256 "4e6ef951cc3f0ed2e96b1d393628226c83876f32f8c6c31755811b1ddb346add"
    else
      odie "Unsupported MacOS architecture."
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-x86_64.tar.gz"
      sha256 "00934824979d31bd0b87736431bd22ce24b0ab0526fc742b95669f00e141fe5d"
    elsif Hardware::CPU.arm?
      url "https://github.com/phylaxsystems/credible-sdk/releases/download/#{version}/pcl-#{version}-linux-arm64.tar.gz"
      sha256 "40abb9b711847f03c9f9f473b38f28b3a417b478ec87fae386a4edfe24b56714"
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
