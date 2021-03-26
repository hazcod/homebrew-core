class Futhark < Formula
  desc "Data-parallel functional programming language"
  homepage "https://futhark-lang.org/"
  url "https://github.com/diku-dk/futhark/archive/v0.19.3.tar.gz"
  sha256 "509dc0f0aea6e0cb06db0f1fefe6e72d68c2703b8534f559ea6162ef82b97595"
  license "ISC"
  head "https://github.com/diku-dk/futhark.git"

  bottle do
    sha256 cellar: :any_skip_relocation, big_sur:  "45ad54cf277690e96eea9515b489b16aea5be2c381a99d0972b01a1d24ae5324"
    sha256 cellar: :any_skip_relocation, catalina: "dd1328e591e512df8686d5a91ab95e20e6f12218a3167f10937a369a328cf6a5"
    sha256 cellar: :any_skip_relocation, mojave:   "c0a4fd62db0fa66329996b3aa46a76a38a22db3294ea476aa50b078ccee85eac"
  end

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build
  depends_on "sphinx-doc" => :build

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  def install
    system "cabal", "v2-update"
    system "cabal", "v2-install", *std_cabal_v2_args

    system "make", "-C", "docs", "man"
    man1.install Dir["docs/_build/man/*.1"]
  end

  test do
    (testpath/"test.fut").write <<~EOS
      let main (n: i32) = reduce (*) 1 (1...n)
    EOS
    system "#{bin}/futhark", "c", "test.fut"
    assert_equal "3628800i32", pipe_output("./test", "10", 0).chomp
  end
end
