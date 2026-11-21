cask "alt-tab-patched" do
  version "11.10.2"
  sha256 "8825a1782083930c4bac36a0a1338e8c1b9637d0889c40f8c338c8fff813c5c1"

  url "https://github.com/viliampucik/homebrew-tap/releases/download/v#{version}/AltTab-#{version}.zip"
  name "AltTab (patched)"
  desc "Unofficial patched build of AltTab"
  homepage "https://github.com/viliampucik/homebrew-tap"

  conflicts_with cask: "alt-tab"
  depends_on macos: :monterey

  app "AltTab.app"

  # Self-signed, not notarized: drop quarantine so Gatekeeper doesn't block launch
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/AltTab.app"], must_succeed: false
  end

  uninstall quit: "com.lwouis.alt-tab-macos"
end
