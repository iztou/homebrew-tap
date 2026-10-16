class M2m < Formula
  desc "Java monolith to microservices partitioning CLI (analyze/partition/trace/generate)"
  homepage "https://github.com/iztou/monoGomicro"
  url "https://repo1.maven.org/maven2/io/github/iztou/monogomicro-cli/0.1.0/monogomicro-cli-0.1.0.jar"
  sha256 "a4eff3168df0f2a4e021f2af796d5036e5e2c55747ff728f4352bca847179188"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install "monogomicro-cli-0.1.0.jar"
    bin.write_jar_script libexec/"monogomicro-cli-0.1.0.jar", "m2m", java_ver: "17"
  end

  test do
    assert_match(/Usage/, shell_output("#{bin}/m2m --help 2>&1", 0))
  end
end
