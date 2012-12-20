# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

EGIT_REPO_URI="git://github.com/ddemidov/amgcl https://github.com/ddemidov/amgcl"
EGIT_COMMIT="${PV}"

DESCRIPTION="amgcl: an accelerated algebraic multigrid for C++"
HOMEPAGE="https://github.com/ddemidov/amgcl"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_install() {
	insinto /usr/include/
	doins -r amgcl
}
