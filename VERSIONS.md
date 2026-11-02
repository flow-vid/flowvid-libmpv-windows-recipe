# FlowVid libmpv (Windows) pinned versions

Reproducibility manifest for `flow-vid/flowvid-libmpv-windows-recipe` (fork of
`shinchiro/mpv-winbuild-cmake`). Used by `flow-vid/flowvid-libmpv-desktop` to build the **LGPL**
`libmpv-2.dll` bundled in FlowVid PC.

## Pinned (behaviour-defining headline components)
| Component | Pin | Why |
|-----------|-----|-----|
| **mpv**    | `2339eb72767517fc5a113283939f59076946fbc1` | master ~v0.41.0. Proven-buildable with this recipe + current deps (== zhongfly's 2026-06-25 release). |
| **FFmpeg** | `946fcce07b6dcd0331c8cc609192aeff5e1924f8` | tag n9.0.2 (2026-11). The old "release tags do not work" reason (floating deps) is gone since every dep is pinned (2026-09-08). Was master 8.x `b5ef72c1`. |


## The other dependencies
The rest (libplacebo, dav1d, libass, freetype, fribidi, harfbuzz, zlib, libpng, …) are pinned too, each to
the commit that went into the last proven build. See "Dependency pins" below.

## LGPL
Built with `compile-lgpl-libmpv.patch` (from the CI fork): drops x264/x265 (encoders), libssh, libsrt,
libdvdnav, libdvdread, avisynth. All decoders + libass (ISC) + libplacebo remain → LGPLv2.1+, FFmpeg
statically linked LGPLv3.

## Dependency pins (2026-09-08)

Every git-sourced package and toolchain component is pinned to a commit: the revision each repository had on 2026-06-25, the date of the last proven Windows build, or the revision the recipe already reset to. Nothing follows a branch tip anymore, so a rebuild months later produces the same inputs. Bump pins deliberately, one at a time, and rebuild.

## 2026-11 bumps (one CI run for all five; if it fails, revert one at a time)
- FFmpeg n9.0.2 `946fcce0`, libplacebo v7.387.0 `275f7dea`, harfbuzz 15.0.0 `35f656a1`, freetype VER-2-15-0 `37515cf5`, fribidi v1.0.18 `15393e49`.
- Source check before the bump: mpv 0.41 uses none of the APIs FFmpeg 9.0 removed; libplacebo 7.387 and harfbuzz 15 remove no public API.
