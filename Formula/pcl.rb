# Formula/pcl.rb
class Pcl < Formula
    desc "Phylax Credible Layer (PCL) CLI"
    homepage "https://github.com/phylaxsystems/pcl"
    # Replace "v0.1.0" with your actual latest release tag
    version "v0.0.4"
  
    # Define URLs and SHA256 checksums for different architectures
    # You will need to update these for each new release.
    # To get the SHA256, download the binary and run: shasum -a 256 <binary_file_name>
  
    if OS.mac?
      if Hardware::CPU.intel?
        # Assumes your binary for Intel Macs is named, e.g., pcl-x86_64-apple-darwin
        # Adjust the filename in the URL accordingly.
        url "https://github.com/phylaxsystems/pcl/releases/download/#{version}/pcl-x86_64-apple-darwin"
        sha256 "YOUR_SHA256_CHECKSUM_FOR_INTEL_MAC_BINARY" # Replace this
      elsif Hardware::CPU.arm?
        # Assumes your binary for Apple Silicon Macs is named, e.g., pcl-aarch64-apple-darwin
        # Adjust the filename in the URL accordingly.
        url "https://github.com/phylaxsystems/pcl/releases/download/#{version}/pcl-aarch64-apple-darwin"
        sha256 "YOUR_SHA256_CHECKSUM_FOR_ARM_MAC_BINARY" # Replace this
      else
        odie "Unsupported MacOS architecture."
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/phylaxsystems/pcl/releases/download/#{version}/pcl-x86_64-unknown-linux-gnu"
        sha256 "YOUR_SHA256_CHECKSUM_FOR_LINUX_BINARY" # Replace this
      elsif Hardware::CPU.arm?
        url "https://github.com/phylaxsystems/pcl/releases/download/#{version}/pcl-aarch64-unknown-linux-gnu"
        sha256 "YOUR_SHA256_CHECKSUM_FOR_LINUX_BINARY" # Replace this
      else
        odie "Unsupported Linux architecture."
      end
    else
      odie "Unsupported operating system."
    end
  
    def install
      # The downloaded file (from the URL) will be named after the formula, e.g., "pcl"
      # if the URL points directly to the binary.
      # If your URL downloads a file with a different name (e.g., pcl-x86_64-apple-darwin),
      # Homebrew will download it to a temporary location, and `name` (which is "pcl")
      # will be used as the target filename when moving it.
      # We need to ensure the downloaded binary is moved to the bin directory and named "pcl".
  
      # Determine the downloaded filename based on the URL structure.
      # This is a bit more robust if the downloaded filename isn't simply 'pcl'.
      downloaded_filename = File.basename(url)
  
      # Rename the downloaded binary to "pcl" and move it to the bin directory
      bin.install downloaded_filename => "pcl"
    end
  
    test do
      # Test if the CLI is installed and can print its help message or version.
      # Adjust this test to a command that works for your CLI.
      assert_match version.to_s.delete_prefix("v"), shell_output("#{bin}/pcl --version")
    end
  end