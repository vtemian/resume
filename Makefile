# Makefile for LaTeX resume generation

# Default target
.PHONY: all
all: pdf

# Generate PDF (run twice for proper references/links)
.PHONY: pdf
pdf:
	pdflatex resume.tex
	pdflatex resume.tex

# Quick build (single pass)
.PHONY: quick
quick:
	pdflatex resume.tex

# Clean auxiliary files
.PHONY: clean
clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.toc *.lof *.lot

# Clean everything including PDF
.PHONY: distclean
distclean: clean
	rm -f resume.pdf

# Open PDF (macOS)
.PHONY: open
open: pdf
	open resume.pdf

# Watch for changes and rebuild (requires fswatch)
.PHONY: watch
watch:
	@echo "Watching for changes in *.tex and *.cls files..."
	@fswatch -o *.tex *.cls | xargs -n1 -I{} make pdf

# Help
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make         - Build PDF (default)"
	@echo "  make pdf     - Build PDF (two passes)"
	@echo "  make quick   - Quick build (single pass)"
	@echo "  make clean   - Remove auxiliary files"
	@echo "  make distclean - Remove all generated files"
	@echo "  make open    - Build and open PDF (macOS)"
	@echo "  make watch   - Auto-rebuild on file changes (requires fswatch)"
	@echo "  make help    - Show this help message"