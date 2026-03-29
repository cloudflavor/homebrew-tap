class OpalCli < Formula
  desc "Terminal-first local GitLab pipeline runner with AI-assisted debugging"
  homepage "https://opal.cloudflavor.io"
  version "0.1.0-rc6"
  license "Apache-2.0"

  if OS.mac?
    depends_on arch: :arm64

    url "https://github.com/cloudflavor/opal/releases/download/v0.1.0-rc6/opal-0.1.0-rc6-aarch64-apple-silicon.tar.gz"
    sha256 "048d782746cb795cc5eec8dcea5d6ab2058d51facdf6124cfbf1d3b788dda915"
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cloudflavor/opal/releases/download/v0.1.0-rc6/opal-0.1.0-rc6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a471c59307426a01c9ab8fe19301d7cc6a91dd375ab48a0066865f920aaabc24"
    else
      url "https://github.com/cloudflavor/opal/releases/download/v0.1.0-rc6/opal-0.1.0-rc6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47a74f2c0558119ce083fc9487e7a443b1083b8943075d34905d12e2b43ad5e9"
    end
  end

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+(?:-rc\d+)?)$/i)
    strategy :github_releases
  end

  conflicts_with "opal", because: "both install an `opal` executable"

  def install
    bin.install "opal"
  end

  def caveats
    if OS.mac?
      <<~EOS
        Opal requires a local container engine already installed and available on your PATH.

        Supported macOS engines:
          - container
          - docker
          - orbstack
          - podman
      EOS
    else
      <<~EOS
        Opal requires a local container engine already installed and available on your PATH.

        Supported Linux engines:
          - podman
          - docker
          - nerdctl
      EOS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opal --version")
  end
end
