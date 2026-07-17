# typed: false
# frozen_string_literal: true

# ALU GUBI Driver — encrypted thin REST API client (format v2 hybrid envelope)
#
# Encryption / supply-chain (same stack as alu-gubi-cli):
#   - Key wrap:     ML-KEM-768 (FIPS 203) encapsulates the AES-256-GCM data key
#   - Bulk cipher:  AES-256-GCM payload encryption
#   - Manifest:     ML-DSA-65 (FIPS 204) signed release manifest
#   - Integrity:    Homomorphic ciphertext seal verified before decrypt
#   - Loader:       Split-key stub/header shards + ephemeral decrypt-and-exec
#
# Install (same tap as the server CLI):
#   brew tap shyamalschandra/alu-gubi-cli
#   brew trust --formula shyamalschandra/alu-gubi-cli/alu-gubi-driver
#   brew install alu-gubi-driver

class AluGubiDriver < Formula
  desc "ALU GUBI — thin pure-Rust REST API driver (ML-KEM-768 encrypted release)"
  homepage "https://github.com/shyamalschandra/alu_gubi"
  url "https://shyamalschandra.github.io/alu-gubi-cli/releases/alu-gubi-driver-0.1.0-macos-arm64.tar.gz"
  sha256 "047b10236858d94c2c22b0699f92b81b5c700f0a92c167576d4fac1d71764fc3"
  license "CCSL-1.0a"

  def install
    bin.install "alu-gubi-driver-0.1.0-macos-arm64" => "alu-gubi-driver"
    bin.install_symlink bin/"alu-gubi-driver" => "gubi-driver"
  end

  def caveats
    <<~EOS
      🦀 ALU GUBI encrypted API driver installed (format v2)!

      Terminal 1 — start the server API:
        alu-gubi-cli serve

      Terminal 2 — continuous live TUI (q to quit):
        alu-gubi-driver live --zip 94102 --display-name "Demo Citizen"
        # aliases: watch · tui · demo --watch
        # one-shot: alu-gubi-driver demo

      Herd computing (100B virtual people → RNG JSON tokens):
        alu-gubi-driver herd --dry-run
        alu-gubi-driver herd-stream --dry-run
        # real-time TUI (q quit · space pause): tick-driven, not batch rounds
        alu-gubi-driver herd-stream -g 32 --chunk 2 --tick 20 --dry-run

      Envelope: ML-KEM-768 key wrap + AES-256-GCM bulk + ML-DSA-65 signed
      manifest + homomorphic seal (same as alu-gubi-cli).
    EOS
  end

  test do
    assert_match "HTTP driver", shell_output("#{bin}/alu-gubi-driver --help")
  end
end
