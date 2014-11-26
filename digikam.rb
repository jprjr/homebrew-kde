require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Digikam < BaseKdeFormula
  homepage 'http://www.digikam.org/'
  url 'http://download.kde.org/stable/digikam/digikam-4.4.0.tar.bz2'
  sha1 '1feb43120addda314e09761440ec2058e430171c'

  # Ref: https://trac.macports.org/browser/trunk/dports/kde/digikam/Portfile
  # Digikam and kipi-plugins dependencies
  depends_on 'kdelibs'
  depends_on 'kdepimlibs'
  depends_on 'qt'
  depends_on 'libtiff'
  #depends_on 'libjpg'
  depends_on 'libpng'
  depends_on 'opencv'
  depends_on 'marble'
  depends_on 'exiv2'

  # kipi-plugins dependencies
  #depends_on 'expat'
  depends_on 'gdk-pixbuf'
  #depends_on 'libgpod'
  depends_on 'libxml2'
  depends_on 'libxslt'
  depends_on 'qca'
  depends_on 'qjson'
  depends_on 'imagemagick'
  depends_on 'eigen'

  # Digikam dependencies
  #depends_on 'boost'
  #depends_on 'gettext'
  depends_on 'glib'
  depends_on 'lensfun'
  depends_on 'libgphoto2'
  depends_on 'liblqr'
  depends_on 'libusb'
  depends_on 'jasper'
  depends_on 'shared-desktop-ontologies'
  depends_on 'libraw'
  depends_on 'sane-backends'

  # If building with external KDEGraphics libs
  #depends_on 'libkdcraw'
  #depends_on 'libkexiv2'
  #depends_on 'libkipi'
  #depends_on 'libksane'

  # Runtime dependencies
  depends_on 'kde-runtime'
  depends_on 'oxygen-icons'

  def patches
    # Build fails with 'Unknown CMake command "FLEX_TARGET".'
    # Suspect missing 'hugin' package. Disable panorama plugin for now:
    {:p0 => 'https://gist.githubusercontent.com/jprjr/c77c1d51a73eaadaec6f/raw/ea43e9c8bb0e6f393c450710e51cd08d8fafed19/disable-panoaram-digikam-4.4.0.diff'}
  end

  def extra_cmake_args
    [
      '-DDIGIKAMSC_USE_PRIVATE_SHAREDLIBS=on',
      '-DDIGIKAMSC_USE_PRIVATE_KDEGRAPHICS=on',
      '-DDIGIKAMSC_COMPILE_DOC=off'
    ]
  end


  kde_build_deps
end

