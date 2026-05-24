class SkillAuditMcp < Formula
  include Language::Python::Virtualenv

  desc "MCP server + CLI that audits MCP servers for supply-chain attacks"
  homepage "https://github.com/eltociear/skill-audit-mcp"
  url "https://github.com/eltociear/skill-audit-mcp/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "10ba3a07ee3e6ff9d0d256a75925803803af00a699f73e066e3565ab384b28d1"
  license "MIT"
  head "https://github.com/eltociear/skill-audit-mcp.git", branch: "main"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
    bin.install "server.py" => "skill-audit-mcp"
    bin.env_script_all_files(libexec/"bin", PYTHONPATH: prefix)
  end

  test do
    output = pipe_output("#{bin}/skill-audit-mcp", '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' + "\n", 0)
    assert_match "audit", output
  end
end
