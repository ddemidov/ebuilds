# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils fortran-2 toolchain-funcs multilib

# TODO:
# testing: emake examples?
# better doc instalation and building
# pypastix (separate package?)
# multilib with eselect?
# static libs building without pic
# metis?

DESCRIPTION="Parallel solver for very large sparse linear systems"
HOMEPAGE="http://pastix.gforge.inria.fr"
SRC_URI="https://gforge.inria.fr/frs/download.php/file/33818/pastix_5.2.2.11.tar.bz2"

LICENSE="CeCILL-C"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc int64 mpi smp starpu static-libs"

RDEPEND="
	sci-libs/scotch:0=[int64?,mpi?]
	sys-apps/hwloc:0=
	virtual/blas
	mpi? ( virtual/mpi )
	starpu? ( dev-libs/starpu:0= )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/pastix_release_7fd8c2e/src"

src_prepare() {
	sed -e 's/^\(HOSTARCH\s*=\).*/\1 ${HOST}/' \
		-e "s:^\(CCPROG\s*=\).*:\1 $(tc-getCC):" \
		-e "s:^\(CFPROG\s*=\).*:\1 $(tc-getFC):" \
		-e "s:^\(CF90PROG\s*=\).*:\1 $(tc-getFC):" \
		-e "s:^\(MPCCPROG\s*=\).*:\1 mpicc -cc=$(tc-getCC):" \
		-e "s:^\(MPCXXPROG\s*=\).*:\1 mpic++ -cxx=$(tc-getCXX):" \
		-e "s:^\(MCFPROG\s*=\).*:\1 mpif90 -f90=$(tc-getFC):" \
		-e "s:^\(ARPROG\s*=\).*:\1 $(tc-getAR):" \
		-e "s:^\(CCFOPT\s*=\).*:\1 ${FFLAGS}:" \
		-e "s:^\(CCFDEB\s*=\).*:\1 ${FFLAGS}:" \
		-e 's:^\(EXTRALIB\s*=\).*:\1 -lm -lrt:' \
		-e "s:^#\s*\(ROOT\s*=\).*:\1 \$(DESTDIR)${EPREFIX%/}/usr:" \
		-e 's:^#\s*\(INCLUDEDIR\s*=\).*:\1 $(ROOT)/include:' \
		-e 's:^#\s*\(BINDIR\s*=\).*:\1 $(ROOT)/bin:' \
		-e "s:^#\s*\(LIBDIR\s*=\).*:\1 \$(ROOT)/$(get_libdir):" \
		-e 's:^#\s*\(SHARED\s*=\).*:\1 1:' \
		-e 's:^#\s*\(SOEXT\s*=\).*:\1 .so:' \
		-e '/fPIC/s/^#//g' \
		-e "s:^#\s*\(SHARED_FLAGS\s*=.*\):\1 ${LDFLAGS}:" \
		-e "s:pkg-config:$(tc-getPKG_CONFIG):g" \
		-e "s:^\(BLASLIB\s*=\).*:\1 $($(tc-getPKG_CONFIG) --libs blas):" \
		-e "s:^\s*\(HWLOC_HOME\s*?=\).*:\1 ${EPREFIX}/usr:" \
		-e "s:-I\$(HWLOC_INC):$($(tc-getPKG_CONFIG) --cflags hwloc):" \
		-e "s:-L\$(HWLOC_LIB) -lhwloc:$($(tc-getPKG_CONFIG) --libs hwloc):" \
		-e "s:^\s*\(SCOTCH_HOME\s*?=\).*:\1 ${EPREFIX}/usr:" \
		-e "s:^\s*\(SCOTCH_INC\s*?=.*\):\1/scotch:" \
		-e "s:^\s*\(SCOTCH_LIB\s*?=.*\)lib:\1$(get_libdir):" \
		config/LINUX-GNU.in > config.in
	sed -i -e 's/__SO_NAME__,$@/__SO_NAME__,$(notdir $@)/g' Makefile || die
}

src_configure() {
	use amd64 && sed -i \
		-e 's/^\(VERSIONBIT\s*=\).*/\1 _64bit/' config.in

	use int64 && sed -i \
		-e '/VERSIONINT.*_int64/s/#//' \
		-e '/CCTYPES.*INTSSIZE64/s/#//' config.in

	use mpi || sed -i \
		-e '/VERSIONMPI.*_nompi/s/#//' \
		-e '/CCTYPES.*NOMPI/s/#//' \
		-e '/MPCCPROG\s*= $(CCPROG)/s/#//' \
		-e '/MCFPROG\s*= $(CFPROG)/s/#//' \
		-e 's/-DDISTRIBUTED//' \
		-e 's/-lptscotch/-lscotch/g' \
		config.in

	use smp || sed -i \
		-e '/VERSIONSMP.*_nosmp/s/#//' \
		-e '/CCTYPES.*NOSMP/s/#//' config.in

	use starpu && sed -i -e '/libstarpu/s/#//g' config.in
}

src_compile() {
	emake all drivers
}

src_install() {
	default
	sed -i -e "s:${D}::g" "${ED}"/usr/bin/pastix-conf || die
	# quick and dirty (static libs should really be built without pic)
	use static-libs || rm "${ED}"/usr/$(get_libdir)/*.a
	cd ..
	dodoc README.txt
	use doc && dodoc doc/refcard/refcard.pdf
}
