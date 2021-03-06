# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{6..8} )
EGIT_REPO_URI="https://github.com/awslabs/${PN}.git"

inherit distutils-r1 git-r3

DESCRIPTION="AWS CloudFormation Linter"
HOMEPAGE="https://github.com/awslabs/cfn-python-lint"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="test"

RDEPEND="dev-python/aws-sam-translator[${PYTHON_USEDEP}]
	dev-python/importlib_resources[${PYTHON_USEDEP}]
	dev-python/jsonpatch[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/junit-xml[${PYTHON_USEDEP}]
	dev-python/networkx[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
BDEPEND="test? ( dev-python/mock[${PYTHON_USEDEP}]
	dev-python/pydot[${PYTHON_USEDEP}] )"

distutils_enable_tests unittest
