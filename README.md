# Cloudflavor Homebrew Tap

This is the official Cloudflavor Homebrew tap.

## Opal

Install the tap:

```bash
brew tap cloudflavor/tap
```

Install Opal:

```bash
brew install cloudflavor/tap/opal
```

Check the installed version:

```bash
opal --version
```

## How to Release

1. Publish the new Opal release on GitHub first.
2. Make sure the release includes all supported tarballs:
   - macOS `arm64`
   - Linux `arm64`
   - Linux `x86_64`
3. Compute the SHA-256 for each tarball:

   ```bash
   shasum -a 256 opal-<version>-<target>.tar.gz
   ```

4. Update `Formula/opal.rb` with:
   - the new `version`
   - the matching `url` values
   - the matching `sha256` values
5. Validate the formula:

   ```bash
   brew style Formula/opal.rb
   ruby -c Formula/opal.rb
   ```

6. Commit and push the change to the default branch of `cloudflavor/homebrew-tap`.
7. Verify the updated tap:

   ```bash
   brew update
   brew livecheck cloudflavor/tap/opal
   brew upgrade cloudflavor/tap/opal
   ```

Notes:

- `livecheck` is already configured in `Formula/opal.rb` to track both stable tags and `-rcN` tags.
- If upstream asset names change or a platform is added or removed, update the corresponding `url` and `sha256` entries in `Formula/opal.rb`.
