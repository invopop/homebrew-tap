class Invopop < Formula
  desc "Command-line interface for the Invopop platform"
  homepage "https://github.com/invopop/cli"
  url "https://github.com/invopop/cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "2974dcda17b839cd44617ab39a374709bf4f14b3a485f9567a70a193aadbce04"
  head "https://github.com/invopop/cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/invopop"
    generate_completions_from_executable(bin/"invopop", "completion")
  end

  test do
    assert_match "invopop", shell_output("#{bin}/invopop --help")
  end
end
