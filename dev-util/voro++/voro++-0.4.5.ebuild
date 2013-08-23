# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Software library for carrying out three-dimensional computations of the Voronoi tessellation"
HOMEPAGE="http://math.lbl.gov/voro++"
SRC_URI="http://math.lbl.gov/voro++/download/dir/voro++-0.4.5.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

src_install() {
	emake PREFIX="${D}/usr" install || die "Install failed"
}
