class M2mMcp < Formula
  desc "MCP server (stdio) for LLM-driven microservices partitioning/editing"
  homepage "https://github.com/iztou/monoGomicro"
  url "https://repo1.maven.org/maven2/io/github/iztou/monogomicro-mcp/0.1.0/monogomicro-mcp-0.1.0.jar"
  sha256 "9eda830b3d6928b54a612f6d400772c9c6abe77a929a69eb68a35e11b4b628ba"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install "monogomicro-mcp-0.1.0.jar"
    bin.write_jar_script libexec/"monogomicro-mcp-0.1.0.jar", "m2m-mcp", Formula["openjdk@17"].opt_prefix
  end

  test do
    # MCP server 走 stdio 常驻，不便在 test 中启动；验证 jar 与包装脚本就位
    assert_predicate libexec/"monogomicro-mcp-0.1.0.jar", :exist?
    assert_predicate bin/"m2m-mcp", :executable?
  end
end
