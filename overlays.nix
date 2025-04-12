# Collection of all overlays used in the system
{
  neovim-nightly,
  rust-overlay,
  ...
}: {
  # Base overlays used across all configurations
  base = [
    neovim-nightly.overlays.default
  ];

  # Development-specific overlays
  dev = [
    (import rust-overlay)
  ];
}
