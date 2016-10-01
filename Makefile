MAIN=paper# Main directory name
SUB=sections# Subsection directory name
MDTITLE=paper.md# Markdown output file name
HTML=paper.html# HTML output file name

.PHONY: all clean

all: $(MDTITLE) $(HTML)

$(MDTITLE):
	cat $^ > $(MAIN)/$@

$(HTML): $(MDTITLE)
	pandoc $(MAIN)/$< -s -o $(MAIN)/$@

clean:
	cd $(MAIN); rm $(MDTITLE); rm $(HTML)
