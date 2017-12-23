# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

MY_P=${PN}${PV}

inherit qmake-utils python-single-r1

DESCRIPTION="A dynamic Python binding for the Qt framework"
HOMEPAGE="http://pythonqt.sourceforge.net/"
SRC_URI="mirror://sourceforge/pythonqt/pythonqt/${P}/${MY_P}.zip"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc +extensions webkit"

RDEPEND="${PYTHON_DEPS}
	dev-qt/qtcore:5/5.7
	dev-qt/qtgui:5/5.7
	dev-qt/qtwidgets:5/5.7
	extensions? (
		dev-qt/designer:5/5.7
		dev-qt/qtdeclarative:5/5.7[widgets]
		dev-qt/qtmultimedia:5/5.7[widgets]
		dev-qt/qtnetwork:5/5.7
		dev-qt/qtopengl:5/5.7
		dev-qt/qtprintsupport:5/5.7
		dev-qt/qtsql:5/5.7
		dev-qt/qtsvg:5/5.7
		dev-qt/qtxml:5/5.7
		dev-qt/qtxmlpatterns:5/5.7
		webkit? ( dev-qt/qtwebkit:5/5.7 )
	)"
DEPEND="${RDEPEND}
	dev-qt/qtxml:5/5.7
	virtual/pkgconfig
	doc? ( app-doc/doxygen )"

S="${WORKDIR}/${MY_P}"

REQUIRED_USE="webkit? ( extensions ) ${PYTHON_REQUIRED_USE}"

# Bring uitools back, backport other fixes from trunk
PATCHES=( "${FILESDIR}/${P}-commit-433-441.patch" )

src_prepare() {
	default

	if ! use extensions ; then
		sed -i '/SUBDIRS/s/extensions//' PythonQt.pro || die "sed for extensions"
	fi
	if ! use webkit ; then
		# Remove webkit support if not used
		sed -i '/qtHaveModule(webkit):CONFIG += PythonQtWebKit/d' \
			extensions/PythonQt_QtAll/PythonQt_QtAll.pro \
			|| die "sed for webkit"
	fi

	# Unset python version to use python-config
	sed -i "/unix:PYTHON_VERSION=/s/2.7//" build/python.prf \
		|| die "sed for python version"
}

src_configure() {
	eqmake5 PREFIX="${ED%/}"/usr
}

src_install() {
	einstalldocs

	# Includes
	insinto /usr/include/PythonQt
	doins -r src/*.h
	insinto /usr/include/PythonQt/gui
	doins -r src/gui/*.h

	if use extensions ; then
		insinto /usr/include/PythonQt/extensions/PythonQt_QtAll
		doins -r extensions/PythonQt_QtAll/*.h
	fi

	# Libraries
	dolib.so lib/libPythonQt*
}
