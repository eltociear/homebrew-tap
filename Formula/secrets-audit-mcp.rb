class SecretsAuditMcp < Formula
  include Language::Python::Virtualenv

  desc "MCP server + CLI scanning files for 32 secret-provider patterns"
  homepage "https://github.com/eltociear/secrets-audit-mcp"
  url "https://github.com/eltociear/secrets-audit-mcp/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "8f1b33b7801da2ccfbcf1567b7945fcf27e2522f0dd3829ef75b576239dbf05f"
  license "MIT"
  head "https://github.com/eltociear/secrets-audit-mcp.git", branch: "main"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
    bin.install "server.py" => "secrets-audit-mcp"
    bin.env_script_all_files(libexec/"bin", PYTHONPATH: prefix)
  end

  test do
    output = pipe_output("#{bin}/secrets-audit-mcp", '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' + "\n", 0)
    assert_match "audit", output
  end
end
