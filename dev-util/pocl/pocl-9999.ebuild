# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit bzr
EBZR_REPO_URI="lp:pocl"

DESCRIPTION="Portable Computing Language"
HOMEPAGE="http://pocl.sourceforge.net/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

DEPEND="sys-devel/clang sys-apps/hwloc"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}

