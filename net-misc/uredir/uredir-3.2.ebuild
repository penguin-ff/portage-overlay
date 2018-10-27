# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit systemd tmpfiles user

DESCRIPTION="UDP port redirector"
HOMEPAGE="https://github.com/troglobit/${PN}"
SRC_URI="https://github.com/troglobit/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/libuev"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

pkg_setup() {
	enewgroup uredir
	enewuser uredir -1 -1 /dev/null uredir
}

src_install() {
	default

	newinitd "${FILESDIR}"/uredir.initd uredir
	newconfd "${FILESDIR}"/uredir.confd uredir
	systemd_dounit "${FILESDIR}"/uredir.service
	newtmpfiles "${FILESDIR}"/uredir.tmpfile uredir.conf
}

pkg_postinst() {
	tmpfiles_process uredir.conf
}