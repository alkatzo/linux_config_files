# .bashrc_profile is sourced only by bash 

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi



# ---------------- SMARTS smsop autocomplete ----------------
if [ -f /smarts/control/latest/bin/smsop_autocomplete.sh ]; then
    source /smarts/control/latest/bin/smsop_autocomplete.sh
fi
# -----------------------------------------------------------


# ---------------- SMARTS Core Dump ----------------
ulimit -c unlimited
# --------------------------------------------------------------

export SMARTS_ROOT=${SMARTS_ROOT:-/smarts}
export SMARTS_USER=${SMARTS_USER:-sroot}
export SMARTS_GROUP=${SMARTS_GROUP:-mpl}
export SMARTS=/smarts/builds/latest-core
export ALICE=/smarts/builds/latest-alice
export MPLSQL=/smarts/builds/latest-mplsql
export SCRIPTS=/smarts/control/latest
export SMARTS_PYTHON=/smarts/thirdparty/python
export PATH=${PATH}:/smarts/thirdparty/python/bin
export SMARTS_JRE=/smarts/thirdparty/jre
export PATH=$SMARTS_JRE/bin:$PATH:$SMARTS/bin:$ALICE/bin:$SCRIPTS/bin:$MPLSQL/bin
