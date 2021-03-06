# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )
EHG_REPO_URI="https://bitbucket.org/Mekk/mercurial-extension_utils"

inherit distutils-r1 mercurial

DESCRIPTION="Mercurial Extension Utils"
HOMEPAGE="https://bitbucket.org/Mekk/mercurial-extension_utils"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="test? ( dev-vcs/mercurial[${PYTHON_USEDEP}] )"

S="${WORKDIR}/${MY_P}"

python_prepare_all() {
	# Remove tests need access to filesystem
	rm tests/test_doctest.py || die "rm failed"

	distutils-r1_python_prepare_all
}

python_test() {
	"${PYTHON}" -m unittest discover -v tests || die "tests failed with ${EPYTHON}"
}
