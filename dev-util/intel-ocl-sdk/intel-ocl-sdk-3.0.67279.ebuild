# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/intel-ocl-sdk/intel-ocl-sdk-2.0.31360.ebuild,v 1.4 2012/11/01 09:01:35 xarthisius Exp $

EAPI=4

MY_P=${PN//-/_}_2012_x64

inherit rpm multilib

INTEL_CL=/opt/intel/opencl-1.2-3.0.67279/lib64/

DESCRIPTION="Intel's implementation of the OpenCL standard optimized for Intel processors."
HOMEPAGE="http://software.intel.com/en-us/articles/opencl-sdk/"
SRC_URI="http://registrationcenter.intel.com/irc_nas/3142/intel_sdk_for_ocl_applications_2013_xe_sdk_3.0.67279_x64.tgz"

LICENSE="Intel-SDP"
SLOT="0"
IUSE="tools"
KEYWORDS="amd64 -x86"

RDEPEND="app-admin/eselect-opencl
	dev-cpp/tbb
	sys-process/numactl
	tools? (
		sys-devel/llvm
		>=virtual/jre-1.6
	)"
DEPEND=""

RESTRICT="mirror"
QA_EXECSTACK="${INTEL_CL/\//}libcpu_device.so
	${INTEL_CL/\//}libOclCpuBackEnd.so
	${INTEL_CL/\//}libtask_executor.so"
QA_PREBUILT="${INTEL_CL}*"

S=${WORKDIR}

src_unpack() {
	default
	dir=intel_sdk_for_ocl_applications_2013_xe_sdk_3.0.67279_x64
	for p in opencl-1.2-base-3.0.67279-1.x86_64.rpm \
		     opencl-1.2-devel-3.0.67279-1.x86_64.rpm \
			 opencl-1.2-intel-cpu-3.0.67279-1.x86_64.rpm \
			 opencl-1.2-intel-devel-3.0.67279-1.x86_64.rpm
	do
		rpm_unpack ./${dir}/${p}
	done
}

src_install() {
	doins -r opt

	insinto /etc/OpenCL/vendors/
	doins opt/intel/opencl-1.2-3.0.67279/etc/intel64.icd
}
