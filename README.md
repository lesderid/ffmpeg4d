# D bindings to FFmpeg

[![dub package](https://img.shields.io/badge/dub-package-FF4081.svg)](http://code.dlang.org/packages/ffmpeg4d)

This repo contains D bindings for [FFmpeg](https://www.ffmpeg.org/), created with [dstep](https://github.com/jacob-carlborg/dstep) with some [manual fixes](/generate.fish).

## Disclaimer
These bindings are largely untested and are not necessarily complete or compatible with the latest version of FFmpeg. Furthermore, the script to generate the bindings is quite messy.

## Versioning
Major and minor version numbers correspond to FFmpeg versions (e.g. v4.1.5 should be compatible with FFmpeg 4.1.x).

## Contributing
Feel free to make a pull request with newly generated bindings if the repo is outdated. Any fixes to the generation script are also welcome of course.

## License
These bindings are licensed under the same terms as FFmpeg, which is [mostly LGPL 2.1-licensed](LICENSE.md).
