# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

EGIT_REPO_URI="git://github.com/ddemidov/vexcl.git"
EGIT_BRANCH="master"

DESCRIPTION="Vector expression template library for OpenCL"
HOMEPAGE="https://github.com/ddemidov/vexcl"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="virtual/opencl"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include/vexcl
	doins vexcl/*.hpp
}