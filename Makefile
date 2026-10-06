.PHONY: paper-build paper-clean paper-qeios paper-qeios-clean

paper-build:
	./scripts/build_paper.sh

paper-clean:
	rm -rf paper/build
	rm -f paper/sections/*.tex
	rm -f paper/foundations_iii.md

paper-qeios:
	./scripts/build_qeios_assets.sh

paper-qeios-clean:
	rm -rf paper/build/qeios_single
