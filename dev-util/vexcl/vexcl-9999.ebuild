# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

EGIT_REPO_URI="git://github.com/ddemidov/vexcl https://github.com/ddemidov/vexcl"
EGIT_COMMIT="master"

DESCRIPTION="VexCL - Vector expression template library for OpenCL"
HOMEPAGE="https://github.com/ddemidov/vexcl"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="virtual/opencl"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include/
	doins -r vexcl
}
