# Zen Obfuscator
> Lua obfuscator built for Roblox executors. Fast, lightweight, and modular.

---

## How It Works

Zen encodes your Lua source through a pipeline of obfuscation layers before outputting a protected script.

**Pipeline:**
1. **XOR + Byte Shift** — encodes each byte with a random key and a shift of 7
2. **Junk Injection** — injects dead code locals and fake conditionals throughout
3. **Closure Wrap** — wraps the output in an anonymous self-executing function

---

## Usage

```bash
lua5.2 Main.lua
```

Follow the terminal prompts:
```
Input File:  path/to/script.lua
Output File: path/to/output.lua
```

Then select from the menu:
- **Start** — runs the obfuscation pipeline
- **Settings** — configure obfuscation options

---

## Settings

| Option | Default | Description |
|---|---|---|
| `Byte_Shifting` | `true` | XOR + byte shift encoding |
| `Junk_Injection` | `true` | Injects dead code (default amount: 80) |
| `Closure_Wrap` | `true` | Wraps output in anonymous closure |

---

## Project Structure

```
Zen/
├── Main.lua
├── IO.lua
├── Pipeline.lua
├── Settings.lua
└── Modules/
    ├── StringToSequence.lua
    ├── Junk.lua
    ├── CLI.lua
    ├── Watermark.lua
    └── Arithmetic.lua
```

---

## Executing Output

```lua
loadstring(game:HttpGet("your_raw_url"))()
```

---

## Todo

- [ ] Make it better 
- [ ] String splitting across multiple table entries  
- [ ] AST-based variable renaming
- [ ] Layer stacking config (choose order of pipeline steps)
- [ ] More junk code patterns
- [ ] Anti-deobfuscation checks
- [ ] Support for Luau syntax

---

## Version

`v1.0.2`
