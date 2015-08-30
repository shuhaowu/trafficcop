.PHONY: package clean

TAR = /bin/tar
AR  = /usr/bin/ar
GIT = /usr/bin/git

OUTDIR   = build
REVISION = $(shell $(GIT) rev-parse --short HEAD)

package: clean
	mkdir -p $(OUTDIR)

	$(TAR) cvzf $(OUTDIR)/control.tar.gz -C src/control .
	$(TAR) cvzf $(OUTDIR)/data.tar.gz -C src/data .
	$(AR) r $(OUTDIR)/trafficcop-$(REVISION).ipk src/debian-binary $(OUTDIR)/control.tar.gz $(OUTDIR)/data.tar.gz

clean:
	rm -rf $(OUTDIR)
