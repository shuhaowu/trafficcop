.PHONY: package

TAR = /bin/tar
AR  = /usr/bin/ar
GIT = /usr/bin/git

OUTDIR   = build
REVISION = $(shell $(GIT) rev-parse --short HEAD)

package:
	mkdir -p $(OUTDIR)

	$(TAR) cvzf $(OUTDIR)/control.tar.gz src/control/
	$(TAR) cvzf $(OUTDIR)/data.tar.gz src/data/
	$(AR) -r $(OUTDIR)/trafficcop-$(REVISION).opk

clean:
	rm -rf $(OUTDIR)
