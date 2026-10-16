class M2m < Formula
  desc "Java monolith to microservices partitioning CLI (analyze/partition/trace/generate)"
  homepage "https://github.com/iztou/monoGomicro"
  url "https://repo1.maven.org/maven2/io/github/iztou/monogomicro-cli/0.2.0/monogomicro-cli-0.2.0.jar"
  sha256 "a195b9106f92f1c40cb70c8a853f66e2565389aefff1ddd5edbf7c0ed26ff6c2"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install "monogomicro-cli-0.2.0.jar"
    bin.write_jar_script libexec/"monogomicro-cli-0.2.0.jar", "m2m", java_version: "17"
  end

  test do
    assert_match(/Usage/, shell_output("#{bin}/m2m --help 2>&1", 0))
  end
end
