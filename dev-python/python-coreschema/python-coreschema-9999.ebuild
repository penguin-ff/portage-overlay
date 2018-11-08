# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{4..6}} )
EGIT_REPO_URI="https://github.com/core-api/${PN}.git"

inherit distutils-r1 git-r3

DESCRIPTION="Python CoreSchema"
HOMEPAGE="https://github.com/core-api/python-coreschema"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="test"

BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/jinja[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? ( dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}] )"

python_test() {
	./runtests || die "test failed"
}