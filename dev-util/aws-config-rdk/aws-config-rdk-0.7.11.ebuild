# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="AWS Config Rules Development Kit"
HOMEPAGE="https://github.com/awslabs/aws-config-rdk"
SRC_URI="https://github.com/awslabs/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/boto3[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
