# eltociear/homebrew-tap

Homebrew tap for [`skill-audit-mcp`](https://github.com/eltociear/skill-audit-mcp)
and [`secrets-audit-mcp`](https://github.com/eltociear/secrets-audit-mcp) —
two MCP servers (and CLIs) that audit MCP server code for supply-chain
attacks and leaked secrets.

## Install

```bash
brew tap eltociear/tap
brew install skill-audit-mcp
brew install secrets-audit-mcp
```

Then run either as a CLI:

```bash
skill-audit-mcp   # MCP server on stdio
secrets-audit-mcp # MCP server on stdio
```

Or wire into Claude Desktop / Cursor / Cline / Goose as an MCP server.

## Pay-per-use hosted endpoint

If you don't want to install anything, the same scan engine is available as
a pay-per-use HTTP endpoint via [Bankr x402](https://x402.bankr.bot):

```bash
curl -X POST https://x402.bankr.bot/0x130c617c8f636cad965ed57ca2164ee4e39ac6dd/security-audit \
  -H 'Content-Type: application/json' \
  -d '{"target":"https://github.com/example/mcp-server"}'
```

Free tier: 1K req/month with 0% platform fee. Paid tier: $0.01/scan in
USDC on Base.

## Subscribe to weekly intel

Polar.sh recurring tiers at [polar.sh/eltociear](https://polar.sh/eltociear):

- **Pulse Monthly — $5/mo** weekly intel + new platform alerts
- **Pro Stack — $20/mo** Pulse + private templates + 1:1 audit credit
- **Pulse Annual — $50/yr** 16% saving for the year-long stack

## License

[CC0](LICENSE) for tap metadata. Both upstream projects are MIT-licensed.
