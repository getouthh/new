# -*- makefile -*-
#----------------------------------------------------------------------------
#       GNU ACE Workspace
#
# $Id: GNUACEWorkspaceCreator.pm 80826 2008-03-04 14:51:23Z wotte $
#
# This file was generated by MPC.  Any changes made directly to
# this file will be lost the next time it is generated.
#
# MPC Command:
# /export/anduriltmp/bczar/DOC_ROOT/stage-17314/ACE_wrappers/bin/mwc.pl -type gnuace -exclude "TAO/TAO_*.mwc,TAO/CIAO/CIAO_*.mwc" -recurse -hierarchy -relative ACE_ROOT=/export/anduriltmp/bczar/DOC_ROOT/stage-17314/ACE_wrappers -relative TAO_ROOT=/export/anduriltmp/bczar/DOC_ROOT/stage-17314/ACE_wrappers/TAO -relative CIAO_ROOT=/export/anduriltmp/bczar/DOC_ROOT/stage-17314/ACE_wrappers/TAO/CIAO -relative DANCE_ROOT=/export/anduriltmp/bczar/DOC_ROOT/stage-17314/ACE_wrappers/TAO/CIAO/DAnCE
#
#----------------------------------------------------------------------------

MAKEFILE = GNUmakefile

ifeq ($(findstring k,$(MAKEFLAGS)),k)
  KEEP_GOING = -
endif

include $(ACE_ROOT)/include/makeinclude/macros.GNU

all: direct_logging indirect_logging Netsvcs_Client_Test Netsvcs_Dump_Restore

REMAINING_TARGETS := $(subst all, , $(TARGETS_NESTED:.nested=)) $(CUSTOM_TARGETS)

$(REMAINING_TARGETS):
	@cd Logger && $(MAKE) -f GNUmakefile.direct_logging $(@)
	@cd Logger && $(MAKE) -f GNUmakefile.indirect_logging $(@)
	@cd Naming/Client && $(MAKE) -f GNUmakefile.Netsvcs_Client_Test $(@)
	@cd Naming/Dump_Restore && $(MAKE) -f GNUmakefile.Netsvcs_Dump_Restore $(@)

.PHONY: direct_logging
direct_logging:
	@cd Logger && $(MAKE) -f GNUmakefile.direct_logging all

.PHONY: indirect_logging
indirect_logging:
	@cd Logger && $(MAKE) -f GNUmakefile.indirect_logging all

.PHONY: Netsvcs_Client_Test
Netsvcs_Client_Test:
	@cd Naming/Client && $(MAKE) -f GNUmakefile.Netsvcs_Client_Test all

.PHONY: Netsvcs_Dump_Restore
Netsvcs_Dump_Restore:
	@cd Naming/Dump_Restore && $(MAKE) -f GNUmakefile.Netsvcs_Dump_Restore all

project_name_list:
	@echo direct_logging
	@echo indirect_logging
	@echo Netsvcs_Client_Test
	@echo Netsvcs_Dump_Restore
