# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

DESCRIPTION="Portable Computing Language"
HOMEPAGE="http://pocl.sourceforge.net/"
SRC_URI="http://pocl.sourceforge.net/downloads/pocl-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

DEPEND="sys-devel/clang sys-apps/hwloc"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
