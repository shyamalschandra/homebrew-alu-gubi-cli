# typed: false
# frozen_string_literal: true

# ALU GUBI CLI — encrypted release formula (format v2 hybrid envelope)
#
# Encryption / supply-chain (matches Pages releases/manifest.json):
#   - Key wrap:     ML-KEM-768 (FIPS 203) encapsulates the AES-256-GCM data key
#   - Bulk cipher:  AES-256-GCM payload encryption
#   - Manifest:     ML-DSA-65 (FIPS 204) signed release manifest
#   - Integrity:    Homomorphic ciphertext seal verified before decrypt
#   - Loader:       Split-key stub/header shards + ephemeral decrypt-and-exec
#
# Install:
#   brew tap shyamalschandra/alu-gubi-cli
#   brew trust --formula shyamalschandra/alu-gubi-cli/alu-gubi-cli
#   brew install alu-gubi-cli

class AluGubiCli < Formula
  desc "ALU GUBI — Gamified Universal Basic Income CLI (ML-KEM-768 encrypted release)"
  homepage "https://github.com/shyamalschandra/alu_gubi"
  url "https://shyamalschandra.github.io/alu-gubi-cli/releases/alu-gubi-cli-0.1.0-macos-arm64.tar.gz"
  sha256 "db55ec55f09e0f3244817ad6e64aec90eb4e5c444e0e67ee7a1967f00495dcdb"
  license "CCSL-1.0a"

  depends_on "ollama" => :recommended

  def install
    bin.install "alu-gubi-cli-0.1.0-macos-arm64" => "alu-gubi-cli"
    bin.install_symlink bin/"alu-gubi-cli" => "alu-gubi" unless (bin/"alu-gubi-cli").exist?
  end

  def caveats
    <<~EOS
      🦀 ALU GUBI encrypted CLI installed (format v2)!

        alu-gubi-cli ui
        alu-gubi-cli moby-up -d
        alu-gubi-cli serve

      Envelope: ML-KEM-768 key wrap + AES-256-GCM bulk + ML-DSA-65 signed
      manifest + homomorphic seal. No plaintext payload on disk at rest.
    EOS
  end

  test do
    assert_match "ALU GUBI", shell_output("#{bin}/alu-gubi-cli --help")
  end
end
