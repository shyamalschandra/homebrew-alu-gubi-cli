class AluGubiCli < Formula
  desc "ALU GUBI — Gamified Universal Basic Income CLI (100% Pure Rust, encrypted release)"
  homepage "https://shyamalschandra.github.io/alu-gubi-cli/"
  url "https://shyamalschandra.github.io/alu-gubi-cli/releases/alu-gubi-cli-0.1.0-macos-arm64.tar.gz"
  sha256 "066caf044ab54aa260362be582a5ad9698dc45c9d33149f74a474ceb9f584e74"
  license "CC-BY-ND-4.0"

  depends_on "ollama" => :recommended

  def install
    bin.install "alu-gubi-cli-0.1.0-macos-arm64" => "alu-gubi-cli"
    bin.install_symlink bin/"alu-gubi-cli" => "alu-gubi" unless (bin/"alu-gubi-cli").exist?
  end

  def caveats
    <<~EOS
      🦀 ALU GUBI encrypted CLI installed!

        alu-gubi-cli ui
        alu-gubi-cli moby up -d

      Binary is AES-256-GCM encrypted with homomorphic seal verification at runtime.
    EOS
  end

  test do
    assert_match "ALU GUBI", shell_output("#{bin}/alu-gubi-cli --help")
  end
end
