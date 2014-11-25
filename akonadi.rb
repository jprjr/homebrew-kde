require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Akonadi < BaseKdeFormula
  url 'http://download.kde.org/stable/akonadi/src/akonadi-1.13.0.tar.bz2'
  sha1 '9d594b5840e2e5d90057a7e5d8545004a3476bc0'

  depends_on 'shared-mime-info'
  depends_on 'mysql'
  depends_on 'soprano'
  depends_on 'boost'
  depends_on 'qt' => ["with-d-bus", "with-qt3support"]

  kde_build_deps

  def patches
    {:p0 => [
      "https://svn.macports.org/repository/macports/trunk/dports/devel/akonadi/files/patch-tests.diff"
    ]}
  end
  if MacOS.version < :mavericks
      def extra_cmake_args
      "-DAKONADI_BUILD_TESTS:BOOL=OFF -DBUILD_TESTING:BOOL=OFF"
      end
  end

end
