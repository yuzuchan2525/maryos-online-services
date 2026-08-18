# MARY Online Services Server v1

Static service root for **MARYOS 1.0**.

This repository is designed to be deployed directly with Cloudflare Pages.

## Endpoints

- `/manifest.json` — service status/endpoints
- `/update.json` — current MARYOS update manifest
- `/shareware.json` — Shareware Center catalog
- `/news.json` — MARY News feed
- `/sites/home.json` — MARYNET home metadata
- `/sites/support.json` — support metadata
- `/updates/` — versioned `.UPD` files
- `/packages/` — versioned `.MPK` files

## Current release

`update.json` intentionally points to:

- MARYOS 1.0
- Build 96.100
- no newer update

Do **not** publish a newer build in `update.json` until its real `.UPD`
package already exists and its SHA-256 has been verified.

`update.example-future.json` is only a template.

## Cloudflare Pages

Deploy the repository root as the static output.

No build command is needed for this repository.

The `_headers` file enables cross-origin reads and keeps JSON manifests
uncached while allowing versioned packages/update files to be cached.

## MARYOS

After deployment, enter the Pages root URL in:

`Control Panel -> MARY Online Services`

Enable external services and run **Test Connection**.
