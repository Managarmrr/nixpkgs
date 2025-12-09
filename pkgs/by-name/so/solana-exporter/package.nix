{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script
}:

buildGoModule (finalAttrs: {
  pname = "solana-exporter";
  version = "3.0.2";

  src = fetchFromGitHub {
    owner = "asymmetric-research";
    repo = "solana-exporter";
    tag = "v${finalAttrs.version}";
    hash = "sha256-CA7J2UhlK43o5I1PAGI4zlKkX7Gir9RdJUuEfPhZSwY=";
  };

  vendorHash = "sha256-ZB9DMWHTMtV5LCX8LUNJrEaW/DYG2WBWHj9VW/AQu5c=";

  meta = {
    description = "Prometheus monitor for the Solana blockchain";
    mainProgram = "solana-exporter";
    homepage = "https://github.com/asymmetric-research/solana-exporter";
    changelog = "https://github.com/asymmetric-research/solana-exporter/blob/v${finalAttrs.version}/CHANGELOG.md";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [
      Managarmrr
    ];
  };

  passthru.updateScript = nix-update-script { };
})
