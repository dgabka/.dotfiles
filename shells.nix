# Development shells definitions
{pkgs, ...}: {
  default = pkgs.mkShell {
    name = "dev-sh";
    buildInputs = with pkgs; [
      # Rust tools
      rust-bin.beta.latest.default
      rust-analyzer

      # Node.js tools
      nodejs
      pnpm
      yarn
      typescript
      vtsls
    ];
  };

  rust = pkgs.mkShell {
    name = "rust-sh";
    buildInputs = with pkgs; [
      rust-bin.beta.latest.default
      rust-analyzer
      cargo-watch
    ];
  };

  node20 = pkgs.mkShell {
    name = "node20-sh";
    buildInputs = with pkgs; [
      nodejs_20
      pnpm
      yarn
      typescript
      vtsls
    ];
  };

  node22 = pkgs.mkShell {
    name = "node22-sh";
    buildInputs = with pkgs; [
      nodejs_22
      pnpm
      yarn
      typescript
      vtsls
    ];
  };

  node23 = pkgs.mkShell {
    name = "node23-sh";
    buildInputs = with pkgs; [
      nodejs_23
      pnpm
      yarn
      typescript
      vtsls
    ];
  };
}
