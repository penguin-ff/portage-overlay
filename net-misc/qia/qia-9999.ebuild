# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="Authorization tool for Stargazer Billing System written in Qt"
HOMEPAGE="http://stg.codes"
SRC_URI=""
EGIT_REPO_URI="http://git.stg.codes/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug libressl"

DEPEND="dev-db/sqlite:3
	dev-libs/boost[static-libs]
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwebkit:5
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )"
RDEPEND="${DEPEND}
	app-arch/bzip2
	sys-libs/zlib
	dev-libs/expat"

src_configure() {
	if use debug; then
		CMAKE_BUILD_TYPE="Debug"
	fi

	cmake_src_configure
}
