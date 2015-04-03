class Pdfsandwich < Formula
  desc "Tool to extend pdf files with OCR data"
  homepage "http://www.tobias-elze.de/pdfsandwich/"
  head "svn://svn.code.sf.net/p/pdfsandwich/code/trunk/src"

  depends_on "ocaml" => :build
  depends_on "gawk" => :build
  depends_on "tesseract"
  depends_on "unpaper"
  depends_on "imagemagick"
  depends_on "exact-image"
  depends_on "ghostscript"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    cp test_fixtures("test.pdf"), testpath/"test.pdf"
    system "#{bin}/pdfsandwich", testpath/"test.pdf"
  end
end
