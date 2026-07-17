# shyamalschandra/alu-gubi-cli Homebrew tap

Official tap for **ALU GUBI** encrypted binaries (Pages-hosted artifacts).

Release envelope (format v2): **ML-KEM-768** key wrap + **AES-256-GCM** bulk + **ML-DSA-65** signed manifest + homomorphic seal.

| Formula | Binary | Role |
|---------|--------|------|
| `alu-gubi-cli` | `alu-gubi-cli` | Server / stack CLI |
| `alu-gubi-driver` | `alu-gubi-driver` / `gubi-driver` | Thin REST API client |

## Install server CLI

```bash
brew tap shyamalschandra/alu-gubi-cli
brew trust --formula shyamalschandra/alu-gubi-cli/alu-gubi-cli
brew install alu-gubi-cli
```

## Install API driver (client)

```bash
brew tap shyamalschandra/alu-gubi-cli
brew trust --formula shyamalschandra/alu-gubi-cli/alu-gubi-driver
brew install alu-gubi-driver
```

## Run

```bash
# Terminal 1
alu-gubi-cli serve

# Terminal 2
alu-gubi-driver demo
```

No tap clone? Install directly from formula URLs on GitHub Pages:

```bash
brew install https://shyamalschandra.github.io/alu-gubi-cli/homebrew-alu-gubi/Formula/alu-gubi-cli.rb
brew install https://shyamalschandra.github.io/alu-gubi-cli/homebrew-alu-gubi/Formula/alu-gubi-driver.rb
```

Website: https://shyamalschandra.github.io/alu-gubi-cli/
