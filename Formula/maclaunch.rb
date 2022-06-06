class Maclaunch < Formula
  desc "Manage your macOS startup items"
  homepage "https://github.com/hazcod/maclaunch"
  license "MIT"
  
  url "https://github.com/hazcod/maclaunch/archive/2.3.1.tar.gz"
  sha256 "579394e1cf97cfd3a321c5b0278d34917e0365d5e88a836264abad4798c754b8"

  def install
    bin.install "maclaunch.sh" => "maclaunch"
  end

  test do
    system "#{bin}/maclaunch"
  end
end
