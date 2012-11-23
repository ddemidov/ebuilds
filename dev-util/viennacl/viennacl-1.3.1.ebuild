# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

EGIT_REPO_URI="git://viennacl.git.sourceforge.net/gitroot/viennacl/viennacl"
EGIT_COMMIT="release-${PV}"

DESCRIPTION="ViennaCL - A Linear algebra library for computations on GPUs and \
	         multi-core CPUs"
HOMEPAGE="http://viennacl.sourceforge.net"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="virtual/opencl"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r viennacl
}
