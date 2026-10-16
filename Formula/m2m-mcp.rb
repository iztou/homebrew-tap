class M2mMcp < Formula
  desc "MCP server (stdio) for LLM-driven microservices partitioning/editing"
  homepage "https://github.com/iztou/monoGomicro"
  url "https://repo1.maven.org/maven2/io/github/iztou/monogomicro-mcp/0.2.0/monogomicro-mcp-0.2.0.jar"
  sha256 "b50efb28b3f76cf9742e19c25c3d1e9251451d61df78be670caa133885fcccf5"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install "monogomicro-mcp-0.2.0.jar"
    bin.write_jar_script libexec/"monogomicro-mcp-0.2.0.jar", "m2m-mcp", java_version: "17"
  end

  test do
    # MCP server 走 stdio 常驻，不便在 test 中启动；验证 jar 与包装脚本就位
    assert_predicate libexec/"monogomicro-mcp-0.2.0.jar", :exist?
    assert_predicate bin/"m2m-mcp", :executable?
  end
end
