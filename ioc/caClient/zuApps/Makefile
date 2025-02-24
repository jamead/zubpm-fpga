TOP=..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

PROD_HOST += zuLive
zuLive_SRCS	+= zuLive.c
zuLive_LIBS	+= $(EPICS_BASE_HOST_LIBS)

PROD_HOST += zuADC
zuADC_SRCS	+= zuADC.c
zuADC_LIBS	+= $(EPICS_BASE_HOST_LIBS)

PROD_HOST += zuTBT
zuTBT_SRCS      += zuTBT.c
zuTBT_LIBS      += $(EPICS_BASE_HOST_LIBS)

PROD_HOST += zuFA
zuFA_SRCS      += zuFA.c
zuFA_LIBS      += $(EPICS_BASE_HOST_LIBS)

PROD_HOST += zuSA
zuSA_SRCS      += zuSA.c
zuSA_LIBS      += $(EPICS_BASE_HOST_LIBS)

PROD_HOST += zuTemp
zuTEmp_SRCS      += zuTemp.c
zuTemp_LIBS      += $(EPICS_BASE_HOST_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

