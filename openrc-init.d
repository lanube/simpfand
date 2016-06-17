#!/sbin/openrc-run
#Proposed by git/lanube
# Distributed under the terms of the GNU General Public License v2
###############
#Instalation notes
#1. Create file /etc/init.d/simpfand, copy all this code here.
#2. chmod +x /etc/init.d/simpfand
#3, rc-update add simpfand enable 
#4. /etc/init.d/simpfand start
#tested with gentoo
###################
PIDFILE=/var/run/simpfand.pid
DAEMON_OPTS="--start"
DAEMON=/bin/simpfand

start() {
	ebegin "Starting ${SVCNAME}"
	start-stop-daemon --start --quiet -b --make-pidfile --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS 
}

stop() {

	ebegin "Stopping ${SVCNAME}"
	start-stop-daemon --stop --quiet --oknodo --pidfile $PIDFILE

}
restart() {

	ebegin "Restarting ${SVCNAME}"
	start-stop-daemon --stop --quiet --oknodo --retry 30 --pidfile $PIDFILE
	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS

}
