EAPI=5


inherit git-r3 cmake-utils fortran-2

DESCRIPTION="Ingest-CM1"
HOMEPAGE="https://github.com/cwebster2/ingest_cm1"
#SRC_URI="https://github.com/cwebster2/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/cwebster2/ingest_cm1.git"
EGIT_COMMIT="v${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

IUSE="static-libs hdf5"

RDEPEND="hdf5? ( sci-libs/hdf5 )"
DEPEND="${RDEPEND}
        dev-util/cmake
"

pkg_setup() {
	FORTRAN_STANDARD=2003
	fortran-2_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with hdf5 HDF5)
		$(cmake-utils_useno static-libs BUILD_SHARED_LIBS)
	)
	cmake-utils_src_configure
}
