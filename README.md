# Cloudflavor Homebrew Tap

This is the official Cloudflavor Homebrew tap.

## Opal

The Homebrew formula name is `opal-cli`.
The installed executable is still:

```bash
opal
```

The formula is named `opal-cli` because `opal` already exists in `homebrew/core` for the Ruby-to-JavaScript transpiler.

If you already have Homebrew core's `opal` installed, uninstall it first because both formulae install an `opal` executable.

Install the tap and formula:

```bash
brew tap cloudflavor/tap
brew install cloudflavor/tap/opal-cli
```

Check the installed version:

```bash
opal --version
```

## How to Release

1. Publish the new Opal release on GitHub.
2. Make sure the release includes all supported tarballs:
   - macOS `arm64`
   - Linux `arm64`
   - Linux `x86_64`
3. Compute the SHA-256 for each tarball:

   ```bash
   shasum -a 256 opal-<version>-<target>.tar.gz
   ```

4. Update `Formula/opal-cli.rb` with:
   - the new `version`
   - the matching `url` values
   - the matching `sha256` values
   - any formula metadata that changed
5. Validate the formula:

   ```bash
   brew style Formula/opal-cli.rb
   ruby -c Formula/opal-cli.rb
   ```

6. Commit and push the change to the default branch of `cloudflavor/homebrew-tap`.
7. Verify the updated tap:

   ```bash
   brew update
   brew livecheck cloudflavor/tap/opal-cli
   brew upgrade cloudflavor/tap/opal-cli
   ```

Notes:

- `livecheck` is already configured in `Formula/opal-cli.rb` to track both stable tags and `-rcN` tags.
- If upstream asset names change or a platform is added or removed, update the corresponding `url` and `sha256` entries in `Formula/opal-cli.rb`.
