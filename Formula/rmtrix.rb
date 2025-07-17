class Rmtrix < Formula
  desc "CLI tool for searching and removing files"
  homepage "https://github.com/meettak/rmtrix"
  version "0.1"
  
  if OS.mac?
    url "https://github.com/meettak/rmtrix/releases/download/v#{version}/rmtrix-shadow-#{version}.zip"
    sha256 "REPLACE_WITH_ACTUAL_SHA256"
  end

  depends_on "openjdk@17"

  def install
    # Install the JAR file
    libexec.install "lib/rmtrix-#{version}-all.jar"
    
    # Create wrapper script
    (bin/"rmtrix").write <<~EOS
      #!/bin/bash
      exec "#{Formula["openjdk@17"].opt_bin}/java" -jar "#{libexec}/rmtrix-#{version}-all.jar" "$@"
    EOS
  end

  test do
    system "#{bin}/rmtrix", "--help"
  end
end
