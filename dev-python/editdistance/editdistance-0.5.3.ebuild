# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Fast implementation of the edit distance(Levenshtein distance)"
HOMEPAGE="https://github.com/roy-ht/editdistance"
SRC_URI="https://github.com/roy-ht/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test" # fails

BDEPEND="dev-python/cython[${PYTHON_USEDEP}]"

distutils_enable_tests unittest
