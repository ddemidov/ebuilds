# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git-2 cmake-utils

EGIT_REPO_URI="demidov@tesla1:git/cuspmv.git"

DESCRIPTION="Sparse matrix -- vector multiply with CUDA"
HOMEPAGE="http://cr-niimm.ksu.ru:3000"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=sys-devel/gcc-4.6.0
	dev-util/nvidia-cuda-toolkit
	sci-libs/cudactx"
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_compile() {
	CMAKE_BUILD_DIR=${WORKDIR}/${P}_build_double
	mycmakeargs=(-DREAL=double)
	cmake-utils_src_configure

	CMAKE_BUILD_DIR=${WORKDIR}/${P}_build_float
	mycmakeargs=(-DREAL=float)
	cmake-utils_src_configure
}

src_install() {
	CMAKE_BUILD_DIR=${WORKDIR}/${P}_build_double
	cmake-utils_src_install

	CMAKE_BUILD_DIR=${WORKDIR}/${P}_build_float
	cmake-utils_src_install
}
