# BLAKE3
[![Crystal CI](https://github.com/GeopJr/blake3.cr/actions/workflows/crystal.yml/badge.svg)](https://github.com/GeopJr/blake3.cr/actions/workflows/crystal.yml)
[![GitHub release](https://img.shields.io/github/release/GeopJr/blake3.cr.svg)](https://github.com/GeopJr/blake3.cr/releases)
![GitHub commits since latest release (by date) for a branch](https://img.shields.io/github/commits-since/GeopJr/blake3.cr/latest)

Blake3 using the official [BLAKE3 c](https://github.com/BLAKE3-team/BLAKE3/tree/master/c) implementation.

## Features
- [x] Fast.  ~2x faster than [Sodium::Digest::Blake2b](https://github.com/didactic-drunk/sodium.cr#blake2b).
- [x] Uses Crystal's Digest API.
- [x] Keyed digests.
- [ ] Key derivation.
- [x] Configurable final size.
- [ ] Streaming final output.
- [x] Tested against official test vectors.
- [x] Builds a blake3 c static library.

## Speed

[examples/blake3_hash.cr](https://github.com/GeopJr/blake3.cr/blob/main/examples/blake3_hash.cr) 
is approximately the same speed as [b3sum](https://github.com/BLAKE3-team/BLAKE3#the-b3sum-utility) with 1 thread or mmap disabled.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     blake3:
       github: GeopJr/blake3.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "blake3"
```

```crystal
digest = Digest::Blake3.new
digest.update data
p digest.final.hexstring
```

```crystal
output_size = 1024
digest = Digest::Blake3.new(output_size)
digest.update data
p digest.final.hexstring => ...a.very.long.string...
```
   
```crystal
digest = Digest::Blake3.new(key: "super secret exactly 32 byte key")
digest.update data
p digest.final.hexstring
```

For further API documentation see [Crystal's Digest API](https://crystal-lang.org/api/latest/Digest.html)

## Contributing

1. Fork it (<https://github.com/GeopJr/blake3.cr/fork>)
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create a new Pull Request

## Contributors

- [Didactic Drunk](https://github.com/didactic-drunk) - creator and maintainer
- [GeopJr](https://github.com/GeopJr) - maintainer of this fork
