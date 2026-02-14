class HeadsetcontrolLatest < Formula
  desc "Control Sidetone, Battery Level and LEDs on Logitech and Corsair Headsets"
  homepage "https://github.com/Sapd/headsetcontrol"
  # Wir nutzen hier direkt die Git-URL als Hauptquelle
  url "https://github.com/Sapd/headsetcontrol.git", branch: "master"
  version "latest-head"

  depends_on "cmake" => :build
  depends_on "hidapi"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    output = `#{bin}/HeadsetControl`

    # First string appears, when a headset is detected
    # Second when a headset was searched for, but none found
    assert_match(/(You didn't set|No supported headset found).*/, output)
  end
end