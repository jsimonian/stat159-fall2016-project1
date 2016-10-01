MAIN = paper # Main directory name
SUB = sections # Subsection directory name
MDTITLE = paper # Markdown output file name
HTML = paper # HTML output file name

.PHONY: all clean

all: $(MDTITLE) $(HTML)

$(MDTITLE): $(MAIN)/$(SUB)/*
	cat $^ > $(MAIN)/$@

$(HTML): $(MDTITLE)
	pandoc $(MAIN)/$< -s -o $(MAIN)/$@

clean:
	cd $(MAIN); rm $(MDTITLE); rm $(HTML)
