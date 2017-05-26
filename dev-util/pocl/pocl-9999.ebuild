# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit git-2 autotools-utils
EGIT_REPO_URI="git://github.com/pocl/pocl https://github.com/pocl/pocl"
EGIT_COMMIT="master"

DESCRIPTION="Portable Computing Language"
HOMEPAGE="http://pocl.sourceforge.net/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

DEPEND="sys-devel/clang sys-apps/hwloc"
RDEPEND="${DEPEND}"

src_configure() {
	"${S}"/autogen.sh
	autotools-utils_src_configure
}

src_compile() {
	autotools-utils_src_compile
}

src_install() {
	autotools-utils_src_install
}
