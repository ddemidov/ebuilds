# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

EGIT_REPO_URI="git://github.com/ddemidov/mba https://github.com/ddemidov/mba"
EGIT_COMMIT="master"

DESCRIPTION="Scattered data interpolation with multilevel B-Splines"
HOMEPAGE="https://github.com/ddemidov/mba"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_install() {
	insinto /usr/include/mba
	doins mba.hpp
}
