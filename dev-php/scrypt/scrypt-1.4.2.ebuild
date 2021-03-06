# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PHP_EXT_ECONF_ARGS="--enable-scrypt"
USE_PHP="php7-2 php7-3 php7-4"

inherit php-ext-pecl-r3

DESCRIPTION="A PHP wrapper fo the scrypt hashing algorithm"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/re2c"
