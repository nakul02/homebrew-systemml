class ApacheSystemml < Formula
  desc "Distributed and declarative machine learning platform"
  homepage "https://systemml.apache.org/"
  url "https://github.com/nakul02/incubator-systemml/archive/0.11.0-incubating-SNAPSHOT.tar.gz"
  version "0.11.0-incubating-SNAPSHOT"
  sha256 "ad90bd5970ac3d3abb3127e3c2cf1e3f42d46bf9348e19c12dfc8472b854230c"

  head "https://github.com/apache/incubator-systemml.git"

  bottle :disable, "No binary version available in a public location"

  depends_on :java => "1.6+"
  depends_on "maven"

  def install
    system "mvn", "clean", "install", "-DskipTests"
    rm_f Dir["bin/*.bat"]
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  test do
    system 'echo "print (1 + 2)"' >> test.dml
    system "#{bin}/systemml", "test.dml"
  end
end
