# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Media Path Key Agreement for Unicast Secure RTP"
HOMEPAGE="https://github.com/BelledonneCommunications/bzrtp"
SRC_URI="https://github.com/BelledonneCommunications/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="sqlite static-libs test"
RESTRICT="test"

RDEPEND="net-libs/bctoolbox[test?]
	sqlite? ( dev-db/sqlite:3
		dev-libs/libxml2:2 )"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_STATIC="$(usex static-libs)"
		-DENABLE_TESTS="$(usex test)"
		-DENABLE_ZIDCACHE="$(usex sqlite)"
	)

	cmake_src_configure
}