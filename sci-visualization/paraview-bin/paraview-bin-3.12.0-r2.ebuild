# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="ParaView is a powerful scientific data visualization application"
HOMEPAGE="http://www.paraview.org"
SRC_URI="http://paraview.org/files/v3.12/ParaView-3.12.0-RC2-Linux-x86_64.tar.gz"

LICENSE="paraview GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

INSTALLDIR="/opt"

src_install() {
	dodir /opt || die "Creating directory failed."
	cp -dpR ParaView-3.12.0-RC2-Linux-x86_64 "${D}"/opt/paraview

	echo "PATH=/opt/paraview/bin" >> "${T}"/40${PN}
	echo "LDPATH=/opt/paraview/lib/paraview-3.12" >> "${T}"/40${PN}
	echo "PYTHONPATH=/opt/paraview/lib/paraview-3.12" >> "${T}"/40${PN}
	doenvd "${T}"/40${PN}

	make_desktop_entry paraview "Paraview" paraview \
		|| die "Failed to install Paraview desktop entry"
}
