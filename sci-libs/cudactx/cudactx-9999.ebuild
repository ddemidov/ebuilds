# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git-2 cmake-utils

EGIT_REPO_URI="git@cr-niimm.ksu.ru:cudactx.git"

DESCRIPTION="CUDA context and worker thread pool"
HOMEPAGE="http://cr-niimm.ksu.ru"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/boost
	dev-util/nvidia-cuda-toolkit"
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_install() {
	cmake-utils_src_install
}
