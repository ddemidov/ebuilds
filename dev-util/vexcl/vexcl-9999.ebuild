# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git-2

EGIT_REPO_URI="git://github.com/ddemidov/vexcl.git"
EGIT_PROJECT="oclutil"

DESCRIPTION="Vector expression template library for OpenCL"
HOMEPAGE="https://github.com/ddemidov/vexcl"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_install() {
	insinto /usr/include/vexcl
	doins vexcl/*.hpp
}
