#
# run_coverage.sh
# Nick Loadholtes <nick@ironboundsoftware.com>
# July 18, 2012
# Helper util to check python code coverage
#
nosetests --with-coverage --cover-erase --cover-inclusive --cover-package $1
coverage html --omit="tests/*i,*/site-packages/*"
#coverage report -m src/*
