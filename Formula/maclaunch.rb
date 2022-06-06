class Maclaunch < Formula
  desc "Manage your macOS startup items."
  homepage "https://github.com/hazcod/maclaunch"
  url "https://codeload.github.com/hazcod/maclaunch/zip/2.3.1"
  version "2.3.1"
  sha256 "579394e1cf97cfd3a321c5b0278d34917e0365d5e88a836264abad4798c754b8"
  license "MIT"

  def install
    bin.install "maclaunch.sh" => "maclaunch"
  end

  test do
    system "#{bin}/maclaunch"
  end
end
