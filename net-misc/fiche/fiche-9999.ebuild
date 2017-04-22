# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 user

DESCRIPTION="Command line pastebin server"
HOMEPAGE="https://github.com/solusipse/fiche"
EGIT_REPO_URI="https://github.com/solusipse/${PN}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

pkg_setup() {
	# Add fiche group and user to system
	enewgroup ${PN}
	enewuser ${PN} -1 -1 /etc/${PN} ${PN}
}

src_prepare() {
	default

	# Remove CFLAGS defined by upstream
	sed -i 's/ -O2//' Makefile || die "sed for Makefile.in failed"
}

src_install() {
	# Install binary
	dobin ${PN}

	# Create data directory
	diropts -m 755 -o ${PN} -g ${PN}
	keepdir /var/lib/${PN}

	# Install Gentoo init script and its config
	newinitd "${FILESDIR}"/${PN}-0.9.initd ${PN}
	newconfd "${FILESDIR}"/${PN}-0.9.confd ${PN}
}
