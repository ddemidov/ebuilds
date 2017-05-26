# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

EGIT_REPO_URI="https://github.com/viennacl/viennacl-dev.git"

DESCRIPTION="ViennaCL - A Linear algebra library for computations on GPUs and \
	         multi-core CPUs"
HOMEPAGE="http://viennacl.sourceforge.net"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

DEPEND="virtual/opencl
	dev-libs/pugixml
"
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
	cd "${S}"
	eapply "${FILESDIR}"/pugixml.patch
	eapply_user
}

src_compile() {
	cmake-utils_src_compile kernels
}

src_install() {
	insinto /usr/include
	doins -r viennacl
	doins -r ${CMAKE_BUILD_DIR}/viennacl
	if use doc; then
		dodoc doc/viennacl.pdf
	fi
}
