from setuptools import setup
from subprocess import call
from os.path import join, dirname, abspath

call(["/bin/bash", join(join(dirname(abspath(__file__)), "scripts"), "install.sh")])

setup(
	name             = "python-libnuml",
	version          = "1.1.0",
	description      = "libNUML Python API",
	long_description = ("libNUML is a library for reading, writing and "+
	"manipulating NUML. It is written in ISO C and C++, supports NUML "+
	"Level 1, Version 1, and runs on Debian Linux. For more information"+
	"about NUML, please see https://github.com/NuML/NuML/"),
	license          = "LGPL",
	author           = "Frank T. Bergmann, Vincent Noel (packaging)",
	url              = "https://github.com/NuML/NuML/",
	py_modules=['libnuml'],
	data_files=[('../..', ['_libnuml.so'])]
)
