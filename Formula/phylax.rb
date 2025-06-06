class Phylax < Formula
    desc "Phylax Credible Layer (PCL) CLI"
    homepage "https://github.com/phylaxsystems/pcl"
    version "0.0.7"
  
    # Define URLs and SHA256 checksums for different architectures
    # You will need to update these for each new release.
    # To get the SHA256, download the binary and run: shasum -a 256 <binary_file_name>
  
    if OS.mac?
      if Hardware::CPU.intel?
        url "https://github.com/phylaxsystems/pcl/releases/download/#{version}/pcl-#{version}-macos-x86_64.tar.gz"
        sha256 "7ddf8921b364d746026a3613d1f8b30a1135002ae9f598e480c7b351b731ce00"
      elsif Hardware::CPU.arm?
        url "https://github.com/phylaxsystems/pcl/releases/download/#{version}/pcl-#{version}-macos-arm64.tar.gz"
        sha256 "75fed16c3f53f718d0ff5ff33bbb46f9c8057608717f5bf397d15a6603ef0586"
      else
        odie "Unsupported MacOS architecture."
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/phylaxsystems/pcl/releases/download/#{version}/pcl-#{version}-linux-x86_64.tar.gz"
        sha256 "b220ae990130e817654141bf14ea4a97bf0e3a767e436ff61608e4b444e67a19"
      elsif Hardware::CPU.arm?
        url "https://github.com/phylaxsystems/pcl/releases/download/#{version}/pcl-#{version}-linux-arm64.tar.gz"
        sha256 "5b42058bbd6ee8a2a5303618277d15c7f5d28e70d0d391f4f86bc8eb795d6db4"
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