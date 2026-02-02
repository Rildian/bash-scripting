# Convert png, jpg... -> webp

## Why?
Well, the purpose of this script is actually to access an Obsidian folder (where you store your images) and convert all of them to `.webp`. 

**Why webp?** So that your vault doesn't consume too much storage. It keeps the quality but shrinks the file size massively.

## Requirements
To use this script, you strictly need to have **cwebp** installed on your machine.
- Linux (Debian/Ubuntu): `sudo apt install webp`
- MacOS: `brew install webp`

## Setup
Before running the main script, you need to make sure everything is executable. I included a helper for this so you don't have to manually `chmod` every single file.

First, give permission to the permission script itself:
```bash
chmod +x permission.sh
```

Then, just hit:
```bash
./permission.sh
```

## Usage
Run the main script (`main.sh`) to convert images AND automatically update your `.md` links in Obsidian.

```bash
./main.sh [OPTIONS]
```

To visualize the options, you can hit:
```
./main.sh -h
```

Or

```
./main.sh --help
```


### Options
| Flag | Description |
|------|-------------|
| `-i` or `--images` | Directory of images. (You can pass multiple directories) |
| `-m` or `--mdir` | Directory of .md files. (Where your notes live) |
| `-h` or `--help` | Show the help message. |

### Examples
Here are a few ways you can run it:

```bash
# Basic usage
./main.sh -i ./assets -m ./notes

# Multiple image folders
./main.sh --images ./photos ./icons -m ./docs

# Multiple obsidian directories
./main.sh --mdir ./dir1 ./dir2 -i ./images

# Using full flags (order doesn't matter)
./main.sh --mdir ./vault --images ./media
```

---

Created this because storage isn't infinite.
