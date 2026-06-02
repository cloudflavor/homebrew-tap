class ParleyCli < Formula
  desc "Terminal-first review tool for Git diffs with AI-assisted discussion"
  homepage "https://github.com/cloudflavor/parley"
  version "0.3.1"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cloudflavor/parley/releases/download/0.3.1/parley-v0.3.1-macos-aarch64.tar.gz"
    sha256 "037d18eb0edc22c84de6df1a58063439307059491c307c4f0b5857c084ac59bc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/cloudflavor/parley/releases/download/0.3.1/parley-v0.3.1-linux-aarch64.tar.gz"
    sha256 "91cb8f8d70d4da2aa2cc971fcda2b5ac690982900eed951a7fd720c92181c50f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cloudflavor/parley/releases/download/0.3.1/parley-v0.3.1-linux-x86_64.tar.gz"
    sha256 "12f2a083d9a16569b4aff8e959325300c80974b3e9fbbe46ff0223ead6ffe3bd"
  end

  livecheck do
    url "https://github.com/cloudflavor/parley/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)*)}i)
  end

  def install
    bin.install "parley"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/parley --version")
  end
end
